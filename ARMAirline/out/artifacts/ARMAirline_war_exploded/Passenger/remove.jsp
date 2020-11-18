<%@ page import="Repositories.PassengerRepository" %>
<%@ page import="model.Passenger" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/6/2020
  Time: 3:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Record</title>
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
            <form ACTION="remove.jsp">
                <tr>
                    <td>

                        <input type="checkbox" name="id" value="<%=pass.getId()%>"/>
                    </td>
                    <td><%=pass.getId()%></td>
                    <td>
                        <%=pass.getName()%>
                    </td>
                    <td>
                        <%=pass.getMobile()%>
                    </td>
                    <td>
                        <%=pass.getEmail()%>
                    </td>
                    <td>
                        <%=pass.getAddress()%>
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
                        <input type="submit" value="Delete Record"/>
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
    String password = request.getParameter("password");
    if (select != null){
            boolean result = passengerRepository.deletePassenger(select, password);
            if (result) {
                out.println(String.format("%s, deleted successfully", select));
            } else {
                out.println(String.format("Unable to delete,%s", select));
            }

    }


%>
