<%@ page import="Repositories.PassengerRepository" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/6/2020
  Time: 12:48 PM
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

    <title>Sign Up</title>
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
<div class="centerElement" style="vertical-align: middle">
    <header class="header">Sign Up</header>
</div>
    <div class="main_container">
        <div class="mainBoard">
            <div class="form_container">
                <form method="post">
                <div class="row">
                    <div class="col-25">
                        <label>Name:</label>
                    </div>

                    <div class="col-75">
                        <input type="text" placeholder="Name" name="name" required/>
                    </div>

                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Mobile:</label>
                    </div>

                    <div class="col-75">
                        <input type="text" placeholder="Mobile Number" name="mobile" required/>
                    </div>

                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Email:</label>
                    </div>

                    <div class="col-75">
                        <input type="email" placeholder="Email Address" name="email" required/>
                    </div>

                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Address:</label>
                    </div>

                    <div class="col-75">
                        <input type="text" placeholder="Address" name="address" required/>
                    </div>

                </div>
                <div class="row">
                    <div class="col-25">
                        <label>Password:</label>
                    </div>

                    <div class="col-75">
                        <input type="password" placeholder="Password" name="password" required/>
                    </div>

                </div>
                <div class="centerElement">
                    <input type="submit" name="signUp" value="Sign Up"/>
                </div>
                <%
                    if (request.getMethod().equalsIgnoreCase("POST")){
                        String name = request.getParameter("name");
                        String mobile = request.getParameter("mobile");
                        String email = request.getParameter("email");
                        String address = request.getParameter("address");
                        String password = request.getParameter("password");

                        PassengerRepository passengerRepository = new PassengerRepository();
                        String id = passengerRepository.createPassenger(name,mobile,email,address,password);
                        if(id != null){
                            out.println(String.format("Congratulation, %s your UserId is, %s",name,id ));
                        }else {
                            out.println(String.format("%s, Registration failed", name));
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
