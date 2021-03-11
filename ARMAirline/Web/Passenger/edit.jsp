<%@ page import="Repositories.PassengerRepository" %>
<%@ page import="model.Passenger" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/6/2020
  Time: 3:15 PM
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

    <title>Edit Record</title>
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
<div class="main_container">
    <div class="col1">
        <div class="centerElement" style="vertical-align: middle">
            <header class="header">Search</header>
        </div>
        <form method="get">
            <div>
                <label>Search</label>
                <input type="text" placeholder="Enter UserId" name="query"/>
            </div>
            <button type="submit">Search Record</button>

        </form>
    </div>
    <div class="col2">
        <table>
            <caption>User Details</caption>
            <tr>
                <th>Edit</th>
                <th>UserId</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Address</th>
            </tr>
            <%
                PassengerRepository passengerRepository = new PassengerRepository();
                if (request.getMethod().equalsIgnoreCase("GET")){
                    String query = request.getParameter("query");
                    Passenger pass = passengerRepository.getPassengerById(query);
                    if (pass != null){
            %>
            <form ACTION="edit.jsp">
                <tr>
                    <td>

                        <input type="checkbox" name="id" value="<%=pass.getId()%>"/>
                    </td>
                    <td><%=pass.getId()%></td>
                    <td>
                        <input type="text" name="name" value="<%=pass.getName()%>" readonly/>
                    </td>
                    <td>
                        <input type="text" name="mobile" value="<%=pass.getMobile()%>"/>
                    </td>
                    <td>
                        <input type="text" name="email" value="<%=pass.getEmail()%>"/>
                    </td>
                    <td>
                        <input type="text" name="address" value="<%=pass.getAddress()%>"/>
                    </td>
                    <td>
                        <label>Enter Password</label>
                        <input type="password" name="password" required/>
                    </td>
                </tr>
                <%}else{
                        out.println(String.format("%s,not found", query));
                }}

                %>
                <tr>
                    <td colspan="4">
                        <input type="submit" value="Edit"/>
                    </td>
                </tr>
            </form>

        </table>
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
<%
    String select = request.getParameter("id");
    if (select != null ){
        String name = request.getParameter("name");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        boolean result = passengerRepository.updatePassenger(select,mobile,email,address, password);
            if (result) {
                out.println(String.format(" Dear, %s record updated successfully", name ));
            } else {
                out.println(String.format("Unable to update,%s, invalid password",name ));
            }


    }


%>
