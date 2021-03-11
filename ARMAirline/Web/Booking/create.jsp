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
    <meta charset="utf-8">
    <meta name = "viewport" content = "width = device-width, initial-scale = 1, shrink-to-fit = no">
    <meta name = "author" content="Muhammad AmotulRahman O.">

    <link rel="shortcut icon" href="../images/icon.JPG" type="images/x-icon">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">


    <title>Book Flight</title>
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
        Aircraft aircraft;
        Flight flight;


        FlightRepository flightRepository = new FlightRepository();
        if (request.getMethod().equalsIgnoreCase("get")){
            String flightId = request.getParameter("fId");
            flight = flightRepository.getFlightByCode(flightId);
            aircraft = flight.getAircraft();

    %>
    <div class="mainBoard">
        <div class="centerElement" style="vertical-align: middle">
            <header class="header">Book Flight</header>
        </div>
        <div class="form_container">
            <form method = "get" action="confirmation%20page.jsp">
            <div class="row">
                <div class="col-25">
                <label for="fId">Flight Id:</label>
                </div>
                <div class="col-75">
                <input type="text" id="fId" placeholder="Flight id" name="flightId" value="<%=aircraft.getModel()%>"
                       readonly/>
                </div>
            </div>
                <div class="row">
                <div class="col-25">
                    <label for="pId">Passenger ID:</label>
                </div>
                    <div class="col-75">
                    <input type="text" id="pId" placeholder="Enter user code" name="passengerId" required/>
                </div>
                </div>
            <form method="get" action="create.jsp">
            <div class="row">
                <div class="col-25">
                   <label for="grade">Ticket Class:</label>
                </div>
                <div class="col-75">
                    <select name="grade" id="grade">
                        <option value="FirstClass">FirstClass</option>
                        <option value="Business">Business</option>
                        <option value="Economy">Economy</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="type">Ticket Type:</label>
                </div>
                <div class="col-75">
                    <select name="type" id="type">
                        <option value="One-Way">One-Way</option>
                        <option value="Return">Return</option>
                    </select>
                </div>

           </div>
               <div class="centerElement">
                <input type="submit" value="Get Price"/>
               </div>
            </form>

        </form>
        <%}%>
        </div>
    </div>
</div>
<div class="footer_container">
    <div class="contact_us"><p>Contact US</p></div>

    <footer class="footer_distributed">
        <div class="footer_left">
            <h3>ARMAirline <span><img src="../images/icon.JPG"></span></h3>
            <p class="footer_links">
                <a href="../index.jsp" class="link_1">Home</a>
                <a href="#">Blog</a>
                <a href="#">About</a>
                <a href="#">Faq</a>
                <a href="#contact us">Contact</a>
            </p>

            <p class="footer_company_name">ARMAirline &copy 2020</p>
        </div>

        <div class="footer_center">
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
                <p><a href="mailto:ridamot123@gmai.com">support@armairline.com</a></p>
            </div>
        </div>
        <div class="footer_right" id="About us">
            <p class="footer_company_about">
                <span><u>About Us</u></span><br>
                ARMAirline is one of the many judiciary of Kajol enterprise<br>
                <span><u>Vision & Mission</u></span><br>
            </p>

            <div class="footer_icons">

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
