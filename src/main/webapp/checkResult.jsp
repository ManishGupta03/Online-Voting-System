<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager" %>    
<%@page import="java.sql.ResultSet" %>    
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Results</title>
<link rel="stylesheet" type="text/css" href="style.css">
<%
String a[] = new String[100];
for(int i=0;i<100;i++) a[i]="0";
Class.forName("com.mysql.cj.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinevotingdb2","root","Manursh@987@789");

PreparedStatement preparedStatement = con.prepareStatement("select party,count(party) as votecount from vote group by party");
ResultSet rs = ((java.sql.Statement) preparedStatement).executeQuery("select party,count(party) as votecount from vote group by party");

int i=0;
while(rs.next()){
	if(rs.getString("party").equals("AAP"))
		a[0] =rs.getString("votecount");
	if(rs.getString("party").equals("BJP"))
		a[1] =rs.getString("votecount");
	if(rs.getString("party").equals("BSP"))
		a[2] =rs.getString("votecount");
	if(rs.getString("party").equals("Congress"))
		a[3] =rs.getString("votecount");
	if(rs.getString("party").equals("CPI"))
		a[4] =rs.getString("votecount");
}
%>
</head>
<%@include file="adminNavbar.jsp" %>
<body>
<div class= "checkTable form-container">
<table>
<tr>
<th>
Parties
</th>

<th>
Names
</th>
<th>
Votes
</th>
</tr>
<tr>
<td>
<img src="images/Aap.jpg" class="party_img" alt="AAP">
</td>
<td>AAP</td>
<td><%=a[0] %></td>
</tr>
<tr>
<td>
<img src="images/Bjp.jpg" class="party_img" alt="BJP">
</td>
<td>BJP</td>
<td><%=a[1] %></td>
</tr>
<tr>
<td>
<img src="images/Bsp.jpg" class="party_img" alt="BSP">
</td>
<td>BSP</td>
<td><%=a[2] %></td>
</tr>
<tr>
<td>
<img src="images/Congress.jpg" class="party_img"alt="CONGRESS">
</td>
<td>Congress</td>
<td><%=a[3] %></td>
</tr>
<tr>
<td>
<img src="images/Cpi.jpg"class="party_img" alt="CPI">
</td>
<td>CPI</td>
<td><%=a[4] %></td>
</tr>
</table>
</div>
</body>
</html>