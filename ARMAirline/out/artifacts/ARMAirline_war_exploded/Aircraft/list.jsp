<%@ page import="Repositories.AircraftRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Aircraft" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10/30/2020
  Time: 11:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name = "viewport" content = "width = device-width, initial-scale = 1, shrink-to-fit = no">
    <meta name = "author" content="Muhammad AmotulRahman O.">

    <link rel="shortcut icon" href="../images/icon.JPG" type="images/x-icon">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../CSS/app.css">
    <link rel="stylesheet" type="text/css" href="../CSS/aircraft.css">

    <title>Aircraft List</title>
</head>
<body class ="bg-image">
<nav class="navbar" id = "myNavbar">
    <div class="container">
        <a class = "" href="../index.jsp">
            <img  class="logo-img" src="../images/homeLogo.JPG" alt="home logo" title="home-logo" >
            <span class=""> ARMAirline International<sub><i>....Satisfaction at its peak.......</i></sub></span>
        </a>


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

                <caption>Aircraft Lists</caption>
                <tr>
                    <th>Model</th>
                    <th>Name</th>
                    <th>Capacity</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
                <%
                    AircraftRepository aircraftRepository = new AircraftRepository();
                    List<Aircraft> aircraftList = aircraftRepository.getAircraftList();
                    for (Aircraft a:  aircraftList){
                %>
                <tr>
                    <td><%=a.getModel()%></td>
                    <td><%=a.getName()%></td>
                    <td><%=a.getCapacity()%></td>
                    <td><%=a.getStatus()%></td>
                    <td>
                        <a href="edit.jsp?model=<%=a.getModel()%>"><button>Edit</button></a>
                        <a href="remove.jsp?model=<%=a.getModel()%>"><button>Delete</button></a>

                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </div>

</body>
</html>
