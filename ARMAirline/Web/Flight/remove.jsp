<%@ page import="Repositories.FlightRepository" %>
<%@ page import="model.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Time" %>
<%@ page import="model.Aircraft" %>
<%@ page import="Repositories.SeatRepository" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 11/4/2020
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Flight</title>
</head>
<body>
<div>
    <div>
        <form method="get">
            <div>
                <label>Search</label>
                <input type="text" placeholder="Enter query" name="query"/>
            </div>
            <button type="submit">Search Aircraft</button>

        </form>
    </div>

    <div>
        <table>
            <caption>Results</caption>
            <tr>
                <th>Select</th>
                <th>Model</th>
                <th>Departure</th>
                <th>Destination</th>
                <th>Departure Time</th>
                <th>Departure Date</th>
                <th>Seat</th>
                <th>Price</th>
            </tr>
            <%
                FlightRepository flightRepository = new FlightRepository();
                if (request.getMethod().equalsIgnoreCase("GET")){
                    String query = request.getParameter("query");
                    List<Flight> flightList = flightRepository.searchFlight(query);
                    if (flightList == null){
                        out.println("Flight does not exist");
                    }else{
                    for (Flight f : flightList ) {
                        Aircraft aircraft = f.getAircraft();
            %>
            <form ACTION="remove.jsp">
                <div>
                    <tr>
                        <td>
                            <input type = "checkbox" name="id" value="<%=aircraft.getModel()%>"/>
                        </td>
                        <td><%=aircraft.getModel()%></td>
                        <td>
                            <%=f.getDeparture()%>
                        </td>
                        <td>
                            <%=f.getDestination()%>
                        </td>
                        <td>
                           <%=f.getDepartureTime()%>
                        </td>
                        <td>
                            <%=f.getDate()%>
                        </td>
                        <td>
                            <%=f.getCapacity()%>
                        </td>
                        <td>
                            <%=f.getPrice()%>
                        </td>
                    </tr>
                </div>
                <%}}}%>
                <div>
                    <tr>
                        <td colspan="4">
                            <input type="submit" value="Delete"/>
                        </td>
                    </tr>
                </div>
            </form>


        </table>
    </div>
</div>
</body>
</html>
<%
String[] select = request.getParameterValues("id");
if (select != null && select.length != 0){
for (String s:select) {
boolean result = flightRepository.deleteFlight(s);
if (result) {
    SeatRepository seatRepository = new SeatRepository();
    seatRepository.deleteSeat(s);
out.println(String.format("%s, deleted successfully", s));
} else {
out.println(String.format("Unable to delete,%s", s));
}
}

}
%>
