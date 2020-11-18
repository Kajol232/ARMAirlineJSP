<%@ page import="model.Passenger" %>
<%@ page import="Repositories.FlightRepository" %>
<%@ page import="model.Flight" %>
<%@ page import="Repositories.PassengerRepository" %>
<%@ page import="Repositories.BookingRepository" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/7/2020
  Time: 8:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Confirm Booking</title>
</head>
<body>
<div>
    <%
    Passenger passenger;
    Flight flight;
    PassengerRepository passengerRepository = new PassengerRepository();
    FlightRepository flightRepository = new FlightRepository();
    if (request.getMethod().equalsIgnoreCase("get")){
    String flightId = request.getParameter("flightId");
    String passId = request.getParameter("passengerId");
    flight = flightRepository.getFlightByCode(flightId);
    passenger = passengerRepository.getPassengerById(passId);
    double price = flight.getPrice();
    String grade = request.getParameter("grade");
    String type = request.getParameter("type");
        double nPrice = flightRepository.getFlightPrice(type,grade,price);
    %>
</div>
<%
        out.println("Dear "+ passenger.getName() + ", your flight is charged at " + nPrice + "; Kindly confirm flight details " +
                "and click on below payment button to proceed");

%>
<form action="ticket.jsp" method="get">
    <label>Flight Details</label>
    <div>
        <label>FlightId</label><input type = "text" name ="id" value = "<%=flightId%>"readOnly/>
    </div>
    <div>
        <label>PassId</label><input type = "text" name ="pId" value = "<%=passId%>"readOnly/>
    </div>
    <div>
        <label>Departure Port:</label>
        <input type="text" name = "dep" value="<%=flight.getDeparture()%>" readonly/>
    </div>
    <div>
        <label>Destination Port:</label>
        <input type="text" name = "des" value="<%=flight.getDestination()%>" readonly/>
    </div>
    <div>
        <label>Date:</label>
        <input type="text" name = "depDate" value="<%=flight.getDate()%>" readonly/>
    </div>
    <div>
        <label>Time:</label>
        <input type="text" name = "depTime" value="<%=flight.getDepartureTime()%>" readonly/>
    </div>
    <div>
        <label>Ticket Grade:</label>
        <input type="text" name = "grade" value="<%=grade%>" readonly/>
    </div>
    <div>
        <label>Ticket Type:</label>
        <input type="text" name = "type" value="<%=type%>" readonly/>
    </div>
    <div>
        <label>Flight Price:</label>
        <input type="text" name = "price" value="<%=nPrice%>" readonly/>
    </div>

    <input type="submit" name="submit" value="Pay"/>
</form>

<%}%>
</body>
</html>
