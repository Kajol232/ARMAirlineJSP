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
        <link rel="stylesheet" type="text/css" href="../CSS/app.css">
        <link rel="stylesheet" type="text/css" href="../CSS/aircraft.css">

        <title>New Aircraft</title>
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
        <div class="centerbtn">
            <header class="header">Create New Aircraft</header>
        </div>
        <div class="form-container">
            <form class = "" method="post">
            <div class="row">
                <div class="col-25">
                    <label>Aircraft Name:</label>
                </div>
                <div class="col-75">
                    <input type="text" class="form-control" placeholder="Name of Aircraft" name="name" required/>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Aircraft Model:</label>
                </div>
                <div class="col-75">
                    <input type="text" class="form-control" placeholder="Aircraft Model" name="model" required/>
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label>Aircraft Capacity:</label>
                </div>
                <div class="col-75">
                    <input type="text" placeholder="Aircraft Capacity" name="capacity" required/>
                </div>
            </div>
            <div class="centerbtn">
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
    </body>


</html>
