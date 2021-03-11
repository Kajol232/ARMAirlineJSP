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

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="shortcut icon" href="../images/icon.JPG" type="images/x-icon">
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">
    <title>Edit Flight</title>
</head>
<body class="body_container">
<div>
    <div class = "nav_container" id = "myNavbar">
        <nav class="navbar">
            <a href="../index.jsp">
                <img class="logo_img" src="../images/homeLogo.JPG" alt="Homepage logo"/>
            </a><span><sub><em>Satisfaction at its peak!!!!</em></sub></span>

            <ul>
                <li><a href="../Admin/AdminIndex.jsp">Home</a></li>

                <li>
                    <div class="dropdown">
                        <button class="dropbtn">About Us</button>
                        <div class="dropdown-content">
                            <a>Vission & Mission</a>
                            <a>Contact Us</a>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="dropdown">
                        <button class="dropbtn">Manage Aircraft</button>
                        <div class="dropdown-content">
                            <a href="../Aircraft/create.jsp">Create Aircraft</a>
                            <a href="../Aircraft/list.jsp">UpdateAircraft</a>
                            <a href="../Aircraft/list.jsp">Delete Aircraft</a>
                            <a href="../Aircraft/list.jsp">Aircraft List</a>
                        </div>
                    </div>
                </li>

                <li>
                    <div class="dropdown">
                        <button class="dropbtn">Manage Flight</button>
                        <div class="dropdown-content">
                            <a href="../Flight/create.jsp">Create Flight</a>
                            <a href="../Flight/list.jsp">Update Flight</a>
                            <a href="../Flight/list.jsp">Delete Flight</a>
                            <a href="../Flight/list.jsp">Flight List</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="dropdown">
                        <button class="dropbtn">Manage Booking</button>
                        <div class="dropdown-content">
                            <a href="../Booking/edit.jsp">Update Booking</a>
                            <a href="../Booking/remve.jsp">Delete Booking</a>
                            <a href="../Flight/list.jsp">Booking Lists</a>
                        </div>
                    </div>
                </li>
                <li><a href="../Admin/LogOff.jsp">Log Off</a></li>

            </ul>

        </nav>
    </div>
    <div class="main_container">

        <%

            FlightRepository flightRepository = new FlightRepository();
            if (request.getMethod().equalsIgnoreCase("GET")){
                String model = request.getParameter("model");
               Flight f = flightRepository.getFlightByCode(model);

                if (f == null){
                    out.println("");
                }else{
                    Aircraft a = f.getAircraft();
        %>
        <div class="mainBoard">
            <div class="form_container">
                <form method="post">
                    <div class="row">
                        <div class="col-25">
                            <label for="model">Model:</label>
                        </div>
                        <div class="col-75">
                            <input type="text" id="model" name="model" value="<%=a.getModel()%>" readonly/>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="dpt">Departure:</label>
                        </div>
                        <div class="col-75">
                            <input type="text" id="dpt" name="departure" value="<%=f.getDeparture()%>"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="dest">Destination:</label>
                        </div>
                        <div class="col-75">
                            <input type="text" id="dest" name="destination" value="<%=f.getDestination()%>"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="dptTime">Departure Time:</label>
                        </div>
                        <div class="col-75">
                            <input type="text" id="dptTime" name="departure_time" value="<%=f.getDepartureTime()%>" readonly/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="date">Date:</label>
                        </div>
                        <div class="col-75">
                            <input type="text" id="date" name="date" value="<%=f.getDate()%>"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="cap">Flight Capacity:</label>
                        </div>
                        <div class="col-75">
                            <input type="number" id="cap" name="seat" value="<%=f.getCapacity()%>" readonly/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="price">Price:</label>
                        </div>
                        <div class="col-75">
                            <input type="text"  id="price" name="price" value="<%=f.getPrice()%>"/>
                        </div>
                    </div>

                        <div class="centerElement">
                            <input type="submit" value="Edit"/>

                        </div>
                </form>
                <%}}%>
            </div>
        </div>


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
