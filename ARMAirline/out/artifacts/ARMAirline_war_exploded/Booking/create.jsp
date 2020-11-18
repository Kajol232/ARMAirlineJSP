<%@ page import="model.Booking" %>
<%@ page import="Repositories.BookingRepository" %>
<%@ page import="model.Flight" %>
<%@ page import="Repositories.FlightRepository" %>
<%@ page import="model.Aircraft" %>
<%@ page import="model.Passenger" %>
<%@ page import="Repositories.AircraftRepository" %>
<%@ page import="Repositories.PassengerRepository" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/5/2020
  Time: 2:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Flight</title>
    <script src="../js/booing.js"></script>
</head>
<body>
<div>
    <div>
        <h3>Book Flight</h3>
    </div>
    <div>
        <%
            Aircraft aircraft;
            Flight flight;


            AircraftRepository aircraftRepository;
            FlightRepository flightRepository = new FlightRepository();
            PassengerRepository passengerRepository;
            if (request.getMethod().equalsIgnoreCase("get")){
                String flightId = request.getParameter("fId");
                flight = flightRepository.getFlightByCode(flightId);
                aircraft = flight.getAircraft();

        %>
        <form method = "get" action="confirmation%20page.jsp">
            <div>
                <label>Flight Id:</label>
                <input type="text" placeholder="Flight id" name="flightId" value="<%=aircraft.getModel()%>"
                       readonly/>
            </div>
            <div>
                <label>Passenger ID:</label>
                <input type="text" placeholder="Enter user code" name="passengerId" required/>
            </div>
            <form method="get" action="create.jsp">
            <div>
                   <label>Ticket Class:</label><br>
                   <input type="radio" name="grade"  value="FirstClass"/>FirstClass
                   <input type="radio" name="grade"  value="Business"/>Business
                   <input type="radio" name="grade"  value="Economy"/>Economy
            </div>
            <div>
                <label >Ticket Type:</label><br>
                <input type="radio" name="type"  value="One-Way"/>One-Way
                <input type="radio" name="type"  value="Return"/>Return

           </div>
               <div>
                <input type="submit" value="Get Price"/>
               </div>
            </form>

        </form>
        <%}%>
    </div>
</div>
</body>
</html>
