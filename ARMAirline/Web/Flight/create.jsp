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
    <link rel="stylesheet" type="text/css" href="../CSS/style.css">

    <title>New Flight</title>
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
    <div class="col1">
        <div class="centerElement" style="vertical-align: middle">
            <header class="header">Available Aircraft Lists</header>
        </div>
        <div class="form_container">
            <table>

            <tr>
                <th>Model</th>
                <th>Name</th>
                <th>Capacity</th>
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
                <td>
                    <a href="../Flight/create.jsp?model=<%=a.getModel()%>"><button>Select</button></a>

                </td>
            </tr>
            <%}%>
        </table>
        </div>
    </div>
    <%

        if (request.getMethod().equalsIgnoreCase("GET")){
            String model = request.getParameter("model");
            Aircraft aircraft = aircraftRepository.getAircraftByModel(model);
            if (aircraft == null){
                out.println("");
            }else{

    %>
<div class="col2">
    <div class="centerElement" style="vertical-align: middle">
        <header class="header">Create Flight</header>
    </div>
    <div class="form_container">

        <form action="create.jsp" method="post" class="form-container">
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
                 <div class="centerElement">
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

