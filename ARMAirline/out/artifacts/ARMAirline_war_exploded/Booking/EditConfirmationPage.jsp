<%@ page import="model.Passenger" %>
<%@ page import="model.Flight" %>
<%@ page import="Repositories.FlightRepository" %>
<%@ page import="Repositories.PassengerRepository" %>
<%@ page import="Repositories.BookingRepository" %>
<%@ page import="model.Booking" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/20/2020
  Time: 3:45 PM
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
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">

    <title>Confirmation Page</title>
</head>
<body class="body_container">
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
            <li><a href="../Admin/LogOff.jsp">Log Off</a></li>

        </ul>

    </nav>
</div>
<div class="main_container">
    <%
        Passenger passenger;
        Flight flight;
        BookingRepository bookingRepository = new BookingRepository();
        FlightRepository flightRepository = new FlightRepository();
        if (request.getMethod().equalsIgnoreCase("get")){
            String bId = request.getParameter("bId");
            Booking b = bookingRepository.getBookingById(bId);
            String flightId = request.getParameter("fId");
            String passId = request.getParameter("pId");
            flight = b.getFlight();
            passenger = b.getPassenger();
            double fPrice = flight.getPrice();
            double bPrice = b.getPrice();
            String grade = request.getParameter("grade");
            String type = request.getParameter("type");
            double nPrice = flightRepository.getFlightPrice(type,grade,fPrice);
            double price = bPrice - nPrice;

    %>
        <div><h3>

                <%
        out.println("Dear "+ passenger.getName() + ", your flight is charged at" + nPrice + " and balance is " + price + "; Kindly confirm flight details " +
                "and click on below payment button to regularize");
        %>

        <div class="mainBoard">
                        <div class="centerElement" style="vertical-align: middle">
                            <header class="header">Flight Details</header>
                        </div>
                        <div class="form_container">
                            <form action="EditTicket.jsp" method="get">

                                <div class="row">
                                    <div class="col-25">
                                        <label>TickedId:</label>
                                    </div>
                                    <div class="col-75">
                                        <input type = "text" name ="tId" value = "<%=bId%>"readOnly/>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-25">
                                        <label>FlightId</label>
                                    </div>
                                    <div class="col-75">
                                        <input type = "text" name ="fId" value = "<%=flightId%>"readOnly/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <label>PassId</label>
                                    </div>
                                    <div class="col-75">
                                        <input type = "text" name ="pId" value = "<%=passId%>"readOnly/>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-25">
                                        <label>Ticket Grade:</label>
                                    </div>
                                    <div class="col-75">
                                        <input type="text" name = "grade" value="<%=grade%>" readonly/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <label>Ticket Type:</label>
                                    </div>
                                    <div class="col-75">
                                        <input type="text" name = "type" value="<%=type%>" readonly/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-25">
                                        <label>Balance:</label>
                                    </div>
                                    <div class="col-75">
                                        <input type="text" name = "price" value="<%=nPrice%>" readonly/>
                                    </div>
                                </div>
                                <div class="centerElement">
                                    <input type="submit" name="submit" value="Pay"/>
                                </div>
                            </form>
                            <%}%>
                        </div>
                    </div>
</div>
</body>
</html>
