<%@ page import="Repositories.AircraftRepository" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10/29/2020
  Time: 3:26 PM
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

        <title>New Aircraft</title>
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
        <header class="header">Create New Aircraft</header>
    </div>
        <div class="main_container">

            <div class="mainBoard">
                <div class="form_container">
                <form method="post">
                    <div class="row">
                        <div class="col-25">
                            <label for="name">Aircraft Name:</label>
                        </div>
                        <div class="col-75">
                            <input type="text" class="form-control" placeholder="Name of Aircraft" name="name" id="name" required/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="model">Aircraft Model:</label>
                        </div>
                        <div class="col-75">
                            <input type="text" class="form-control" placeholder="Aircraft Model" name="model" id="model" required/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="capacity">Aircraft Capacity:</label>
                        </div>
                        <div class="col-75">
                            <input type="text" placeholder="Aircraft Capacity" name="capacity" id="capacity" required/>
                        </div>
                    </div>
                    <div class="centerElement">
                        <input type="submit" name="create" value="Create"/>
                    </div>

                    <%
                        if (request.getMethod().equalsIgnoreCase("POST")){
                            String name = request.getParameter("name");
                            String model = request.getParameter("model");
                            int capacity = Integer.parseInt(request.getParameter("capacity"));
                            AircraftRepository aircraftRepository = new AircraftRepository();
                            boolean result = aircraftRepository.createAircraft(name,model,capacity);
                            if(result){
                                out.println(String.format("Congrats, %s creation was successful", model));
                            }else {
                                out.println(String.format("%s, creation failed", model));
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
