<%@ page import="model.Passenger" %>
<%@ page import="model.Flight" %>
<%@ page import="Repositories.PassengerRepository" %>
<%@ page import="Repositories.FlightRepository" %>
<%@ page import="Repositories.BookingRepository" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/7/2020
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <%
        Passenger passenger;
        Flight flight;

        PassengerRepository passengerRepository = new PassengerRepository();
        FlightRepository flightRepository = new FlightRepository();
        BookingRepository bookingRepository = new BookingRepository();

        if (request.getMethod().equalsIgnoreCase("get")){

            String flightId = request.getParameter("id");
            flight = flightRepository.getFlightByCode(flightId);

            String passId = request.getParameter("pId");
            passenger = passengerRepository.getPassengerById(passId);

            String type = request.getParameter("type");
            String grade = request.getParameter("grade");
            Double nPrice  = Double.parseDouble(request.getParameter("price"));




            String seatNum = flightRepository.assignSeat(flightId,grade);
            out.println(seatNum);

            String ticketId = bookingRepository.createNewBooking(seatNum,passenger,flight,type,grade,nPrice);

                if (ticketId != null){
                    out.println("Dear "+ passenger.getName() + ", your ticketId is " + ticketId);
                }

        }
    %>
</div>
</body>
</html>
