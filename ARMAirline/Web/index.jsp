<%@ page import="Repositories.PassengerRepository" %>
<%@ page import="Repositories.LogInRepository" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 10/29/2020
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta name = "viewport" content = "width = device-width, initial-scale = 1, shrink-to-fit = no">
    <meta name = "author" content="Muhammad AmotulRahman O.">



    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" href="images/icon.JPG" type="images/x-icon">
    <link rel="stylesheet" type="text/css" href="CSS/style.css">

    <title>HomePage ARMAirline</title>
  </head>
  <body class="body_container">

  <div class = "nav_container" id = "myNavbar">
    <nav class="navbar">
      <a href="index.jsp">
        <img class="logo_img" src="images/homeLogo.JPG" alt="Homepage logo"/>
      </a><span><sub><em>Satisfaction at its peak!!!!</em></sub></span>

      <ul>
        <li><a href="index.jsp">Home</a></li>

        <li><a href="Passenger/create.jsp">Register</a></li>

        <li><a href="Admin/LogIn.jsp">Admin logIn</a></li>

        <li>
          <div class="dropdown">
            <button class="dropbtn">About Us</button>
            <div class="dropdown-content">
              <a>Vission & Mission</a>
              <a>Contact Us</a>
            </div>
          </div>
        </li>
      </ul>

    </nav>
  </div>

  <div>

    <div class="main_container">
      <div class="centerElement" style="vertical-align: middle"> <header class="header">Log In</header></div>
      <div class="mainBoard">
          <div class="form_container">
            <form action="Passenger/index.jsp" method="get">
            <div class="row">
              <div class="col-25">
                <label for="email">Email:</label>
              </div>

              <div class="col-75">
                <input type="email" placeholder="Email here" name="email" id="email" required/>
              </div>
            </div>

            <div class="row">
              <div class="col-25">
                <label for="password">Password:</label>
              </div>

              <div class="col-75">
                <input type="password" placeholder="Password" name="password" id="password" required />
              </div>
            </div>

            <div class="centerElement">
              <div class="col1">
                <input type="submit" name="signIn" value="SignIn"/>
              </div>
              <div class="col2">
                <span><a href="Passenger/create.jsp">Forgot password</a> </span>
              </div>
            </div>
          </form>
          </div>
        </div>

      <div class="clear"></div>

    </div>

    <div class="footer_container">
      <div class="contact_us"><p>Contact US</p></div>

      <footer class="footer_distributed">
        <div class="footer_left">
          <h3>ARMAirline <span><img src="images/icon.JPG"></span></h3>
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

  </div>
  </body>
</html>

<%
    if (request.getMethod().equalsIgnoreCase("get")){
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String type = "user";
        LogInRepository logInRepository = new LogInRepository();
        boolean log = logInRepository.logIn(email,password,type);
        if (log){
            out.println("Login Successful");
            response.sendRedirect("Passenger/index.jsp");
        }else{
            out.println("Invalid login details");
        }
    }
%>
