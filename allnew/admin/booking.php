<?php
include 'header.php';
require '../connection.php';
session_start();
if(!isset(  $_SESSION['email'] ))
{
    header("location:login.php");
    exit;
}

$sql = "SELECT booking.*, movie.name AS movie_name, GROUP_CONCAT(seat_num ORDER BY seat_num) AS seat_numbers, COUNT(*) AS num_seats_booked, user.name AS user_name
        FROM booking
        JOIN movie ON booking.movie_id = movie.id
        JOIN user ON booking.user_id = user.id
        GROUP BY booking.booking_date, booking.booking_time";


$result = $conn->query($sql);

if (!$result) {
    die("SQL Error: " . $conn->error);
}

if ($result->num_rows > 0) {
    echo "<div class='booking-list'>";
    echo "<h2>Booking List</h2>";

    echo "<table>";
    echo "<tr>
            <th>Name</th>
            <th>Movie Name</th>
            <th>Show Date</th>
            <th>Show Time</th>
            <th>Booking Date</th>
            <th>Booking Time</th>
            <th>Seats Booked</th>
            <th>Seat Numbers</th>
          </tr>";

    while ($row = $result->fetch_assoc()) {
        $name = $row['user_name'];
        $movieName = $row['movie_name'];
        $showDate = date('F j, Y', strtotime($row['show_date'])); // Format the date
        $showTime = date('h:i A', strtotime($row['show_time'])); // Format the time
        $bookingDate = date('F j, Y', strtotime($row['booking_date'])); // Format the booking date
        $bookingTime = date('h:i A', strtotime($row['booking_time'])); // Format the booking time
        $seatNumbers = $row['seat_numbers'];
        $numSeatsBooked = $row['num_seats_booked'];

        echo "<tr>
                <td>$name</td>
                <td>$movieName</td>
                <td>$showDate</td>
                <td>$showTime</td>
                <td>$bookingDate</td>
                <td>$bookingTime</td>
                <td>$numSeatsBooked</td>
                <td>$seatNumbers</td>
              </tr>";
    }

    echo "</table>";
    echo "</div>";
} else {
    echo "No bookings found.";
}

$conn->close();
?>

<link rel="stylesheet" href="booking.css">
