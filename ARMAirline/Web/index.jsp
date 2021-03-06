<%--
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
    <link rel="stylesheet" type="text/css" href="CSS/app.css">

    <title>Home ARMAirline</title>
  </head>
  <body class="bg-image">
  <div >
      <nav class="navbar responsive" id="myNavbar">
    <div class="container">
      <div>
      <a class = "" href="#">
        <img  class="logo-img" src="images/homeLogo.JPG" alt="home logo" title="home-logo" ></a>
      <span class=""> ARMAirline International<sub><i>....Satisfaction at its peak.......</i></sub></span>
      </div>

      <div class="" id="">
        <ul>
          <li>
            <a href = "index.jsp" class="">Home</a>
          </li>
          <li>
            <a href="Passenger/create.jsp">Register</a>
          </li>
          <li>
            <div class="dropdown">
              <button class="dropbtn">
                About Us<i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">
                <a href="#">Vision & Mission</a>
                <a href="#contact us">Contact Us</a>
              </div>
            </div>
          </li>
          <li>
            <div class="dropdown">
              <button class="dropbtn">
                Manage Aircraft<i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">
                <a href="Aircraft/create.jsp">New Aircraft</a>
                <a href="Aircraft/list.jsp">Edit Aircraft</a>
                <a href="Aircraft/list.jsp">Delete Aircraft</a>
                <a href="Aircraft/list.jsp">Aircraft Lists</a>
              </div>
            </div>
          </li>
          <li>
            <div class="dropdown">
              <button class="dropbtn">
                Manage Flight<i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">
                <a href="Flight/create.jsp">New Flight</a>
                <a href="Flight/edit.jsp">Edit Flight</a>
                <a href="Flight/remove.jsp">Delete Flight</a>
                <a href="Flight/list.jsp">Flight List</a>
                <a href="Flight/search.jsp">Search Flight</a>
              </div>
            </div>
          </li>
          <li>
            <div class="dropdown">
              <button class="dropbtn">
                Manage Booking<i class="fa fa-caret-down"></i>
              </button>
              <div class="dropdown-content">
                <a href="Flight/search.jsp">Book Flight</a>
                <a href="Booking/edit.jsp">Edit Booking</a>
                <a href="Booking/remove.jsp">Delete Booking</a>
                <a href="Booking/list.jsp">Booking List</a>
                <a href="Booking/search.jsp">Search Booking</a>
              </div>
            </div>
          </li>
          <li>
            <a href = "#" class="">Log In</a>
          </li>


        </ul>

      </div>
    </div>
  </nav>
    </div>
  <div class = "mainBody">
    <div class="column1">column 1</div>
    <div class="column2">column 2</div>

  </div>
  <div class="foot">
    <section class="section" id="contact us">Contact Us </section>
    <footer class="footer-distributed">
      <div class="footer-left">
        <h3>ARMAirline<span><img src="images/icon.JPG"></span></h3>

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
  <script src = "js/aircraft.js"></script>
  </body>
</html>
