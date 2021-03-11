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
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">

    <title>Aircraft List</title>
</head>
<body class ="body_container">
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
                        <a href="create.jsp">Create Aircraft</a>
                        <a href="list.jsp">UpdateAircraft</a>
                        <a href="list.jsp">Delete Aircraft</a>
                        <a href="list.jsp">Aircraft List</a>
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
<div class="centerElement" style="vertical-align: middle">
    <header class="header">Aircraft Lists</header>
</div>

    <div class="main_container">
        <div class="mainBoard">
            <div class="">
                <table>
                <tr>
                    <th>Model</th>
                    <th>Name</th>
                    <th>Capacity</th>
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
                    <td>
                        <a href="edit.jsp?model=<%=a.getModel()%>"><button>Edit</button></a>
                        <a href="remove.jsp?model=<%=a.getModel()%>"><button>Delete</button></a>

                    </td>
                </tr>
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
