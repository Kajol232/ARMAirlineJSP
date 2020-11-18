<%@ page import="model.Aircraft" %>
<%@ page import="Repositories.AircraftRepository" %>
<%@ page import="Repositories.FlightRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/2/2020
  Time: 1:57 PM
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

    <title>New Flight</title>
</head>
<body class="bg-image">
<nav class="navbar responsive" id="myNavbar">
    <div class="container">
        <a class = "" href="#">
            <img  class="logo-img" src="../images/homeLogo.JPG" alt="home logo" title="home-logo" ></a>
        <span class=""></span>
        </button>

    <div class="" id="">
        <ul>
            <li>
                <a href = "index.jsp" class="">Home</a>
            </li>
            <li>
                <a href="../Passenger/create.jsp">Register</a>
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
                        <a href="../Aircraft/create.jsp">New Aircraft</a>
                        <a href="../Aircraft/edit.jsp">Edit Aircraft</a>
                        <a href="../Aircraft/remove.jsp">Delete Aircraft</a>
                        <a href="../Aircraft/list.jsp">Aircraft Lists</a>
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
                        <a href="../Booking/remove.jsp">Delete Booking</a>
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
    </div>
</nav>

<div class="mainBody">
    <div class="col-25">
        <table>

            <caption>Available Aircraft Lists</caption>
            <tr>
                <th>Model</th>
                <th>Name</th>
                <th>Capacity</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <%
                AircraftRepository aircraftRepository = new AircraftRepository();
                List<Aircraft> aircraftList = aircraftRepository.getAvailableAircraft();
                for (Aircraft a:  aircraftList){
            %>
            <tr>
                <td><%=a.getModel()%></td>
                <td><%=a.getName()%></td>
                <td><%=a.getCapacity()%></td>
                <td><%=a.getStatus()%></td>
                <td>
                    <a href="../Flight/create.jsp?model=<%=a.getModel()%>"><button>Select</button></a>

                </td>
            </tr>
            <%}%>
        </table>
    </div>
    <%

        if (request.getMethod().equalsIgnoreCase("GET")){
            String model = request.getParameter("model");
            Aircraft aircraft = aircraftRepository.getAircraftByModel(model);
            if (aircraft == null){
                out.println("Aircraft does not exist");
            }else{

    %>
<div class="col-75">

    <form action="create.jsp" method="post" class="form-container">
        <div>Create Flight</div>
                <div class="row">
                    <div class="col-25"> <label>Aircraft Model:</label></div>
                    <div class="col-75"> <input type="text" name="aircraftModel" value="<%=aircraft.getModel()%>" required/></div>
                </div>
                <div class="row">
                    <div class="col-25"><label>Departure Port:</label></div>
                    <div class="col-75"> <input type="text" placeholder="Enter departure Airport" name="departure" required/></div>
                </div>
                <div class="row">
                    <div class="col-25"> <label>Destination Port:</label></div>
                    <div class="col-75">  <input type="text" placeholder="Enter destination Airport" name="destination" required/></div>
                </div>
                <div class="row">
                        <div class="col-25"><label>Price:</label></div>
                            <div class="col-75">  <input type="text" name="price" required/></div>
                </div>
                <div class="row">
                    <div class="col-25"><label>Departure Date:</label></div>
                        <div class="col-75"> <input type="date" name="date" required/></div>
                </div>
                 <div class="centerbtn">
                        <button type="submit" >Create Flight</button>
                 </div>
        <%}}%>

        <%
            if (request.getMethod().equalsIgnoreCase("POST")) {
                String model = request.getParameter("aircraftModel");
                Aircraft aircraft = aircraftRepository.getAircraftByModel(model);
                String departure = request.getParameter("departure");
                String destination = request.getParameter("destination");

                String date = String.valueOf(request.getParameter("date"));
                double price = Double.valueOf(request.getParameter("price"));
                FlightRepository flightRepository = new FlightRepository();
                boolean result = flightRepository.createNewFlight(aircraft, departure,
                        destination, date, price);

                if (result){
                    out.println(String.format("Congrats, %s creation was successful", model));
                    response.sendRedirect("list.jsp");
                }else{
                    out.println(String.format("Sorry, %s creation failed", model));
                }
            }

        %>


    </form>
</div>

    <div> <p><a href="../index.jsp">Go back to Home Page</a> </p></div>
</div>


<div class="foot">

<section class="section" id="contact us">Contact Us </section>
<footer class="footer-distributed">
    <div class="footer-left">
        <h3>ARMAirline<span><img src="../images/icon.JPG"></span></h3>

        <p class="footer-links">
            <a href="../index.jsp" class="link-1">Home</a>
            <a href="#">Blog</a>
            <a href="search.jsp">Book Flight</a>
            <a href="#">About</a>
            <a href="#">Faq</a>
            <a href="#contact us">Contact</a>
        </p>

        <p class="footer-company-name">ARMAirline &copy 2020</p>
    </div>

    <div class="footer-center">
        <div>
            <i class="fa fa-map-marker"></i>
            <p><span>35 Ikeja-way, Ikeja</span>Lagos State,Nigeria</p>
        </div>
        <div>
            <i class="fa fa-phone"></i>
            <p>+234 08164553227</p>
        </div>
        <div>
            <i class="fa fa-envelope"></i>
            <p><a href="maito:ridamot123@gmai.com">support@armairline.com</a></p>
        </div>
    </div>
    <div class="footer-right" id="About us">
        <p class="footer-company-about">
            <span>About Us</span>
            ARMAirline is one of the many judiciary of Kajol enterprise
        </p>

        <div class="footer-icons">

            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-github"></i></a>

        </div>
    </div>
</footer>
</div>


</body>
</html>

