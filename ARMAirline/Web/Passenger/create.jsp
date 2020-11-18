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
    <title>Sign Up</title>
</head>
<body>
<div>
    <header>Sign Up</header>
</div>
<form method="post">
    <div>
    <div>
        <label>Name:</label>
    </div>

    <div>
        <input type="text" placeholder="Name" name="name" required/>
    </div>

</div>
    <div>
    <div>
        <label>Mobile:</label>
    </div>

    <div>
        <input type="text" placeholder="Mobile Number" name="mobile" required/>
    </div>

</div>
    <div>
    <div>
        <label>Email:</label>
    </div>

    <div>
        <input type="email" placeholder="Email Address" name="email" required/>
    </div>

</div>
    <div>
    <div>
        <label>Address:</label>
    </div>

    <div>
        <input type="text" placeholder="Address" name="address" required/>
    </div>

</div>
    <div>
    <div>
        <label>Password:</label>
    </div>

    <div>
        <input type="password" placeholder="Password" name="password" required/>
    </div>

</div>
    <div>
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


</body>
</html>
