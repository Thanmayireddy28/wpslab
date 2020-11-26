<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "assignment";
String userid = "root";
String password = "";
String roll=request.getParameter("rollno");
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1 style="color:rgb(43, 3, 43)">Student Data</h1>
<table border="1">
<tr>
<td>Roll no</td>
<td>Name</td>
<td>Gender</td>
<td>Date of Birth</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select u.rollno rollno , u.name name,u.dob , u.gender ,u.proctorid,p.name proctorName , p.phone,p.branch,a.att,m.grade from students u , proctor p,attendence a, grades m where u.proctid = p.proctid and u.rollno = a.rollno and u.rollno = m.rollno and u.rollno=roll";




resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
    <h2 style="color:rgb(118, 226, 118)">STUDENT information </h2>
<td><%=resultSet.getString("rollno") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("proctorid") %></td>
<td><%=resultSet.getString("gender") %></td>
</tr>
<tr>
    <td>Procotr name</td>
    <td>Procotr id </td>
    <td>Phone</td>
    <td>Branch</td>
    
    </tr>
<tr>
    <h2 style="color:rgb(118, 226, 118)">Proctor information </h2>
<td><%=resultSet.getString("proctorName") %></td>
<td><%=resultSet.getString("proctorid") %></td>
<td><%=resultSet.getString("phone") %></td>
<td><%=resultSet.getString("branch") %></td>
</tr>



<tr>
    <h2 style="color:rgb(118, 226, 118)">Student attendance </h2>
<td><%=resultSet.getString("att") %></td>

</tr>

<tr>
    
    <h2 style="color:rgb(118, 226, 118)">Grade </h2>
<td><%=resultSet.getString("grade") %></td>

</tr>








<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
