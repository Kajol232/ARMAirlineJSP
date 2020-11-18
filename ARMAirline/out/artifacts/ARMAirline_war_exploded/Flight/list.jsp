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
    <meta name = "viewport" content = "width = device-width, initial-scale = 1, shrink-to-fit = no">
    <meta name = "author" content="Muhammad AmotulRahman O.">

    <link rel="shortcut icon" href="../images/icon.JPG" type="images/x-icon">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../CSS/app.css">

    <title>Flight List</title>
</head>
<body class = "bg-image">
<nav class="navbar" id = "myNavbar">
    <div class="container">
        <a class = "" href="../index.jsp">
            <img  class="logo-img" src="../images/homeLogo.JPG" alt="home logo" title="home-logo" > </a>
            <span class=""> ARMAirline International<sub><i>....Satisfaction at its peak.......</i></sub></span>



        <div class="" id="">
            <ul>
                <li>
                    <a href = "index.jsp" class="">Home</a>
                </li>
                <li>
                    <a href="Passenger/create.jsp">Register</a>
                </li>
                <li>
                    <div class="dropdown">
                        <button class="dropbtn">
                            About Us<i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">Vision & Mission</a>
                            <a href="#contact us">Contact Us</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="dropdown">
                        <button class="dropbtn">
                            Manage Aircraft<i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="create.jsp">New Aircraft</a>
                            <a href="list.jsp">Edit Aircraft</a>
                            <a href="list.jsp">Delete Aircraft</a>
                            <a href="list.jsp">Aircraft Lists</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="dropdown">
                        <button class="dropbtn">
                            Manage Flight<i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="../Flight/create.jsp">New Flight</a>
                            <a href="../Flight/edit.jsp">Edit Flight</a>
                            <a href="../Flight/remove.jsp">Delete Flight</a>
                            <a href="../Flight/list.jsp">Flight List</a>
                            <a href="../Flight/search.jsp">Search Flight</a>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="dropdown">
                        <button class="dropbtn">
                            Manage Booking<i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="../Flight/search.jsp">Book Flight</a>
                            <a href="../Booking/edit.jsp">Edit Booking</a>
                            <a href="../Booking/remve.jsp">Delete Booking</a>
                            <a href="../Booking/list.jsp">Booking List</a>
                            <a href="../Booking/search.jsp">Search Booking</a>
                        </div>
                    </div>
                </li>
                <li>
                    <a href = "#" class="">Log In</a>
                </li>


            </ul>

        </div>
    </div>

</nav>
<div class="mainBody">
    <div>
    <table>
        <caption>Flight Lists</caption>
        <tr>
            <th>Model</th>
            <th>Departure</th>
            <th>Destination</th>
            <th>Departure Time</th>
            <th>Departure Date</th>
            <th>Seat</th>
            <th>Price</th>
            <th>Action</th>
        </tr>
        <%
            FlightRepository flightRepository = new FlightRepository();
                List<Flight> flightList = flightRepository.getAll();
                    for (Flight f : flightList ) {
                       Aircraft aircraft = f.getAircraft();
        %>
            <div>
                <tr>
                    <td><%=aircraft.getModel()%></td>
                    <td><%=f.getDeparture()%></td>
                    <td><%=f.getDestination()%></td>
                    <td><%=f.getDepartureTime()%></td>
                    <td><%=f.getDate()%></td>
                    <td><%=f.getCapacity()%></td>
                    <td><%=f.getPrice()%></td>
                    <td>
                        <a href="edit.jsp?model=<%=aircraft.getModel()%>"><button>Edit</button></a>
                        <a href="remove.jsp?model=<%=aircraft.getModel()%>"><button>Delete</button></a>

                    </td>
                </tr>
            </div>
            <%}%>

    </table>
    </div>
</div>

</body>
</html>
