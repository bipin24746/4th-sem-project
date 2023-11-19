<?php
require '../connection.php';
include 'header.php';

$user_id = $_SESSION['user_id'];
$cancellationStatus = '';

// Function to cancel a booking by ID and remove it from the database
function cancelBooking($conn, $bookingId) {
    // Get the booking date and time for the booking being canceled
    $sql_get_booking = "SELECT booking_date, booking_time FROM booking WHERE id = $bookingId";
    $result = $conn->query($sql_get_booking);

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $bookingDate = $row['booking_date'];
        $bookingTime = $row['booking_time'];

        // Delete all bookings with the same date and time
        $sql_delete_bookings = "DELETE FROM booking WHERE booking_date = '$bookingDate' AND booking_time = '$bookingTime'";
        if ($conn->query($sql_delete_bookings) === TRUE) {
            return true;
        } else {
            return false;
        }
    } else {
        return false;
    }
}

// Check if the cancel button is clicked and process the cancellation
if (isset($_POST['cancel_booking'])) {
    $bookingIdToCancel = $_POST['booking_id'];
    if (cancelBooking($conn, $bookingIdToCancel)) {
        $cancellationStatus = 'Booking canceled successfully.';
    } else {
        $cancellationStatus = 'Failed to cancel booking.';
    }
}

// Remove past bookings from the database
$currentDate = date('Y-m-d');
$sql_remove_old_bookings = "DELETE FROM booking WHERE show_date < '$currentDate'";
$conn->query($sql_remove_old_bookings);

// Fetch all the remaining bookings for the logged-in user
$sql = "SELECT booking.*, movie.name AS movie_name, COUNT(*) AS num_seats_booked
        FROM booking
        JOIN movie ON booking.movie_id = movie.id
        WHERE booking.user_id = '$user_id' AND booking.show_date >= CURDATE() AND CONCAT(booking.show_date, ' ', booking.show_time) >= NOW()
        GROUP BY booking.show_date, booking.show_time, booking.movie_id
        ORDER BY booking.show_date DESC, booking.show_time DESC";

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    echo "<div class='booking-list'>";
    echo "<h2>My Booking List</h2>";

    // Display cancellation status message
    if (!empty($cancellationStatus)) {
        echo "<p class='cancellation-message'>$cancellationStatus</p>";
    }

    echo "<table>";
    echo "<tr>
            <th>Name</th>
            <th>Movie Name</th>
            <th>Show Date</th>
            <th>Show Time</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Seats Booked</th>
            <th>Cancel</th>
          </tr>";

    // Use an associative array to group bookings by show date, show time, and movie name
    $groupedBookings = [];

    while ($row = $result->fetch_assoc()) {
        $groupKey = $row['show_date'] . $row['show_time'] . $row['movie_name'];

        if (!isset($groupedBookings[$groupKey])) {
            $groupedBookings[$groupKey] = [];
        }

        $groupedBookings[$groupKey][] = $row;
    }

    foreach ($groupedBookings as $group) {
        foreach ($group as $row) {
            $bookingId = $row['id'];
            $name = $_SESSION['user_name'];
            $movieName = $row['movie_name'];
            $selectedDate = $row['show_date'];
            $selectedShowTime = $row['show_time'];
            $bookingDate = $row['booking_date'];
            $bookingTime = $row['booking_time'];
            $numSeatsBooked = $row['num_seats_booked'];

            echo "<tr>
                    <td>$name</td>
                    <td>$movieName</td>
                    <td>$selectedDate</td>
                    <td>$selectedShowTime</td>
                    <td>$bookingDate</td>
                    <td>$bookingTime</td>
                    <td>$numSeatsBooked</td>
                    <td>
                        <form method='post' action=''>
                            <input type='hidden' name='booking_id' value='$bookingId'>
                            <button type='submit' name='cancel_booking'>Cancel Booking</button>
                        </form>
                    </td>
                  </tr>";
        }
    }

    echo "</table>";
    echo "</div>";
} else {
    echo "No bookings found.";
}

$conn->close();
?>