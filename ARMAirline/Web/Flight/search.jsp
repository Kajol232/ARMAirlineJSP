<%@ page import="Repositories.FlightRepository" %>
<%@ page import="model.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Aircraft" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/4/2020
  Time: 10:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Available Flight</title>
</head>
<body>
<div>
    <form method="get">
        <div>
            <label>Search</label>
        </div>
        <div>
            <label>Departure:</label>
            <input type="text" placeholder="Enter takeOff point" name="departure" required/>
        </div>
        <div>
            <label>Destination:</label>
            <input type="text" name="destination" placeholder="Enter destination" required/>
        </div>
        <div>
            <label>Departure Date:</label>
            <input type="date" name="date" placeholder="Select departure date" required/>
        </div>
        <button type="submit">Search Flight</button>
    </form>
</div>

<div>
    <table>
        <caption>Results</caption>
        <tr>
            <th>Select</th>
            <th>Model</th>
            <th>Departure</th>
            <th>Destination</th>
            <th>Departure Time</th>
            <th>Departure Date</th>
            <th>Price</th>
        </tr>
        <%
            FlightRepository flightRepository = new FlightRepository();
            if (request.getMethod().equalsIgnoreCase("GET")){
                String departure = request.getParameter("departure");
                String destination = request.getParameter("destination");
                String date = String.valueOf(request.getParameter("date"));
                List<Flight> flightList = flightRepository.getAvailableFlight(destination,departure,date);
                if (flightList != null){
                    for (Flight f : flightList ) {
                        Aircraft aircraft = f.getAircraft();
        %>
        <form ACTION="../Booking/create.jsp" method="get">
            <div>
                <div>
                    <tr>
                        <td><input type="radio" name = "fId" value = "<%=aircraft.getModel()%>"/> </td>
                        <td><%=aircraft.getModel()%></td>
                        <td><%=f.getDeparture()%></td>
                        <td><%=f.getDestination()%></td>
                        <td><%=f.getDepartureTime()%></td>
                        <td><%=f.getDate()%></td>
                        <td><%=f.getPrice()%></td>
                    </tr>
                </div>
            </div>
            <%}}else{
                out.println("No Available flight from "+ destination + " to" + departure + " on" + date);
                }}%>
            <div>
                <tr>
                    <td colspan="4">
                           <input type="submit" value="Book"/>
                    </td>
                </tr>
            </div>
        </form>


    </table>
</div>

</body>
</html>
