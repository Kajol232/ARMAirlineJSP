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
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">

    <title>Flight List</title>
</head>
<body class = "body_container">
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
    <div class="centerElement" style="vertical-align: middle">
        <header class="header">Flight Lists</header>
    </div>
    <div class="mainBoard">
    <div class=" " style="width: 400px; vertical-align: middle">
    <table>
        <tr>
            <th>Model</th>
            <th>Departure</th>
            <th>Destination</th>
            <th>Departure Time</th>
            <th>Departure Date</th>
            <th>Seat</th>
            <th>Price</th>
            <th colspan="3">Action</th>
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
                        <a href="edit.jsp?model=<%=aircraft.getModel()%>"><button type="submit">Edit</button></a></td>
                    <td><a href="remove.jsp?model=<%=aircraft.getModel()%>"><button type="submit">Delete</button></a></td>
                        <td><a href="../Booking/list.jsp?fId=<%=aircraft.getModel()%>"><button type="submit">Booking List</button> </a>

                    </td>
                </tr>
            </div>
            <%}%>

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
