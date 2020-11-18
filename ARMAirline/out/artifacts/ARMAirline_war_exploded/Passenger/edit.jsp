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
    <title>Edit Record</title>
</head>
<body>
<div>
    <div>
        <form method="get">
            <div>
                <label>Search</label>
                <input type="text" placeholder="Enter UserId" name="query"/>
            </div>
            <button type="submit">Search Record</button>

        </form>
    </div>
    <div>
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
