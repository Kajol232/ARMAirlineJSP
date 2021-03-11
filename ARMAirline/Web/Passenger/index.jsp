<%@ page import="Repositories.LogInRepository" %>
<%@ page import="model.Passenger" %>
<%@ page import="Repositories.FlightRepository" %>
<%@ page import="model.Flight" %>
<%@ page import="model.Aircraft" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/6/2020
  Time: 3:14 PM
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

    <title>UserHome ARMAIRLINE</title>
</head>
<body class="body_container">

<div class="nav_container" id="myNavbar">
    <nav class="navbar">
        <a href="index.jsp">
            <img class="logo_img" src="../images/homeLogo.JPG" alt="Homepage logo"/>
        </a><span><sup><em>Satisfaction at its peak!!!!</em></sup></span>

        <ul>
            <li><a href="index.jsp">Home</a></li>

            <li><a href="ChangePassword.jsp">Password Change</a></li>

            <li>
                <div class="dropdown">
                    <button class="dropbtn">Manage Account</button>
                    <div class="dropdown-content">
                        <a href="edit.jsp">Update record</a>
                        <a href="remove.jsp">Delete Account</a>
                    </div>
                </div>
            </li>
            <li>
                <div class="dropdown">
                    <button class="dropbtn">Manage Booking</button>
                    <div class="dropdown-content">
                        <a href="../Booking/edit.jsp">Update Booking</a>
                        <a href="../Booking/remve.jsp">Delete Booking</a>
                        <a href="BookingList.jsp">Booking List</a>
                    </div>
                </div>
            </li>
            <li><a href="Logoff.jsp">Log Off</a></li>
        </ul>
    </nav>
</div>



<div class="centerElement" style="vertical-align: middle"> <header class="header">Search Flight</header></div>

<div class="main_container">
    <div class="col1">
    <div class="form_container">
        <form method="get">
            <div class="row">
                <div class="col-25">
                    <label for="dept">Departure Port:</label>
                </div>
                <div class="col-75">
                    <input type="text" placeholder="Departure point here" name="dept" id="dept" required/>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="dest">Destination Port:</label>
                </div>
                <div class="col-75">
                    <input type="text" placeholder="Destination point here" name="dest" id="dest" required/>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label for="date">Departure Date:</label>
                </div>
                <div class="col-75">
                    <input type="date" placeholder="Departure Date here" name="date" id="date" required/>
                </div>
            </div>
            <div class="centerElement">
                <input type="submit" name="search" value="Search"/>
            </div>
        </form>
    </div></div>
    <div class="col2">
        <div class="centerElement" style="vertical-align: middle"> <header class="header">Results</header></div>

        <div class="form_container">
            <table>
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
                        String departure = request.getParameter("dept");
                        String destination = request.getParameter("dest");
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
    </div>
</div>

<div class="footer_container">
    <div class="contact_us"><p>Contact US</p></div>

    <footer class="footer_distributed">
        <div class="footer_left">
            <h3>ARMAirline <span><img src="../images/icon.JPG"></span></h3>
            <p class="footer_links">
                <a href="index.jsp" class="link_1">Home</a>
                <a href="#">Blog</a>
                <a href="#">About</a>
                <a href="#">Faq</a>
                <a href="#">Contact</a>
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
