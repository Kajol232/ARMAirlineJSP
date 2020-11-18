<%@ page import="model.Aircraft" %>
<%@ page import="Repositories.AircraftRepository" %>
<%@ page import="java.util.List" %><%--
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

    <link rel="shortcut icon" href="../images/logo2.jpg" type="images/x-icon">
    <link rel="stylesheet" type="text/css" href="../CSS/app.css">
    <link rel="stylesheet" type="text/css" href="../CSS/aircraft.css">
    <title>Delete Aircraft</title>
</head>
<body class ="bg-image">
<nav class="navbar" id = "myNavbar">
    <div class="container">
        <a class = "" href="../index.jsp">
            <img  class="logo-img" src="../images/homeLogo.JPG" alt="home logo" title="home-logo" > </a>
        <button class="" type="button" data-toggle="collapse" data-target ="#navbarResponsive"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class=""></span>
        </button>


        <div class="" id="">
            <ul>
                <li>
                    <a href = "../index.jsp">Home</a>
                </li>
                <li>
                    <a href="#">Register</a>
                </li>
                <li>
                    <div class="dropdown">
                        <button class="dropbtn">
                            About Us<i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-content">
                            <a href="#">Vision & Mission</a>
                            <a href="#">Contact Us</a>
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
                            <a href="edit.jsp">Edit Aircraft</a>
                            <a href="remove.jsp">Delete Aircraft</a>
                            <a href="list.jsp">Aircraft Lists</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

</nav>
<div class ="mainBody">
    <%

        AircraftRepository aircraftRepository = new AircraftRepository();
        if (request.getMethod().equalsIgnoreCase("GET")){
            String model = request.getParameter("model");
            Aircraft aircraft = aircraftRepository.getAircraftByModel(model);
            if (aircraft == null){
                out.println("Aircraft does not exist");
            }else{
    %>
    <form class="form-container" method="post">
        <div>
            <label >Aircraft Details</label>
        </div>
        <div>
            <div>
                <label>Model:</label>
                <input type="text" name="a_model" value="<%=aircraft.getModel()%>" readonly/>
            </div>
            <div>
                <label>Aircraft Name:</label>
                <input type="text" name="a_name" value="<%=aircraft.getName()%>"readonly/>
            </div>
            <div>
                <label>Aircraft Model:</label>
                <input type="text" name="a_cap" value="<%=aircraft.getCapacity()%>"readonly/>
            </div>
        </div>
        <div>
            <button type="submit" class="centerbtn">Delete</button>
        </div>
    </form>
<%}}%>


<div><p><a href="../index.jsp">Go back to Home Page</a> </p></div>
</div>
<div class="foot">
    <section class="section" id="contact us">Contact Us </section>
    <footer class="footer-distributed">
        <div class="footer-left">
            <h3>ARMAirline<span><img src="../images/icon.JPG"></span></h3>

            <p class="footer-links">
                <a href="index.jsp" class="link-1">Home</a>
                <a href="#">Blog</a>
                <a href="#">Book Flight</a>
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
<%

        if (request.getMethod().equalsIgnoreCase("post")){
            String m =request.getParameter("a_model");
                boolean result = aircraftRepository.deleteAircraft(m);
                if (result) {
                    out.println(String.format("%s, deleted successfully", m));
                    response.sendRedirect("list.jsp");
                } else {
                    out.println(String.format("Unable to delete,%s", m));
                }
        }



%>
