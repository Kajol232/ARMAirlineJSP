<%@ page import="Repositories.FlightRepository" %>
<%@ page import="org.w3c.dom.stylesheets.LinkStyle" %>
<%@ page import="model.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Time" %>
<%@ page import="model.Aircraft" %>
<%@ page import="Repositories.AircraftRepository" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/4/2020
  Time: 1:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name = "viewport" content = "width = device-width, initial-scale = 1, shrink-to-fit = no">
    <meta name = "author" content="Muhammad AmotulRahman O.">

    <link rel="shortcut icon" href="../images/icon.JPG" type="images/x-icon">
    <link rel="stylesheet" type="text/css" href="../CSS/app.css">
    <link rel="stylesheet" type="text/css" href="../CSS/aircraft.css">
    <title>Edit Flight</title>
</head>
<body class="bg-image">
<div>
    <div><nav class="navbar" id = "myNavbar">
        <div class="container">
            <a class = "" href="../index.jsp">
                <img  class="logo-img" src="../images/homeLogo.JPG" alt="home logo" title="home-logo" > </a>
            <button class="" type="button" data-toggle="collapse" data-target ="#navbarResponsive"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class=""></span>
            </button>


            <div class="" id="">
                <ul>
                    <li>
                        <a href = "../index.jsp">Home</a>
                    </li>
                    <li>
                        <a href="#">Register</a>
                    </li>
                    <li>
                        <div class="dropdown">
                            <button class="dropbtn">
                                About Us<i class="fa fa-caret-down"></i>
                            </button>
                            <div class="dropdown-content">
                                <a href="#">Vision & Mission</a>
                                <a href="#">Contact Us</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="dropdown">
                            <button class="dropbtn">
                                Manage Aircraft<i class="fa fa-caret-down"></i>
                            </button>
                            <div class="dropdown-content">
                                <a href="../Aircraft/create.jsp">New Aircraft</a>
                                <a href="../Aircraft/list.jsp">Edit Aircraft</a>
                                <a href="../Aircraft/list.jsp">Delete Aircraft</a>
                                <a href="../Aircraft/list.jsp">Aircraft Lists</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

    </nav></div>
    <div class="mainBody">

        <%

            FlightRepository flightRepository = new FlightRepository();
            if (request.getMethod().equalsIgnoreCase("GET")){
                String model = request.getParameter("model");
               Flight f = flightRepository.getFlightByCode(model);

                if (f == null){
                    out.println("Flight does not exist");
                }else{
                    Aircraft a = f.getAircraft();
        %>
        <form method="post" class="form-container">
            <div>
                <div>
                    <label>Model:</label>
                    <input type="text" name="model" value="<%=a.getModel()%>" readonly/>

                </div>

                <div>
                    <label>Departure:</label>
                    <input type="text" name="departure" value="<%=f.getDeparture()%>"/>
                </div>
                <div>
                    <label>Destination:</label>
                    <input type="text" name="destination" value="<%=f.getDestination()%>"/>
                </div>
                <div>
                    <label>Departure Time:</label>
                    <input type="text" name="departure_time" value="<%=f.getDepartureTime()%>" readonly/>
                </div>
                <div>
                    <label>Date:</label>
                    <input type="text" name="date" value="<%=f.getDate()%>"/>
                </div>
                <div>
                    <label>Flight Capacity:</label>
                    <input type="number" name="seat" value="<%=f.getCapacity()%>" readonly/>
                </div>
                <div>
                    <label>Price:</label>
                    <input type="text" name="price" value="<%=f.getPrice()%>"/>
                </div>

                <div>
                <input type="submit" value="Edit"/>

            </div>
            </div>
        </form>
    <%}}%>

</div>
</div>
</body>
</html>
<%
    if (request.getMethod().equalsIgnoreCase("post")){
        String m =request.getParameter("model");
        String departure = request.getParameter("departure");
        String destination = request.getParameter("destination");
        Time departureTime = Time.valueOf(request.getParameter("departure_time"));
        String date = request.getParameter("date");
        int seat = Integer.parseInt(request.getParameter("seat"));
        double price = Double.parseDouble(request.getParameter("price"));
        AircraftRepository aircraftRepository =new AircraftRepository();
        Aircraft aircraft = aircraftRepository.getAircraftByModel(m);
            Flight flight = new Flight(aircraft,departure,destination, departureTime, date, seat, price);
            boolean result = flightRepository.updateFlight(flight);
            if (result) {
                out.println(String.format("%s, updated successfully", m));
                response.sendRedirect("list.jsp");
            } else {
                out.println(String.format("Unable to update,%s", m));
            }


    }
%>
