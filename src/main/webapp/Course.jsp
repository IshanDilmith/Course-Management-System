<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@page import="java.io.IOException" %>
    <%@ page import="java.util.List" %>
    <%@ page import="com.course.Course" %>
	<%@ page import="com.course.retrieveCoursesServlet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course</title>
<link rel="stylesheet" type="text/css" href="HeaderFooter.css">
<style>
	table{
		background-color: #DEDEDE;
	}
	
	.tbl-pad { 
		border-collapse: collapse; width: 80%;
		margin: 0 auto;
		font: 20px Sans-serif;
	}
		
	.tbl-pad td, .tbl-pad th {  
	  	border: 1px solid #302ea3;
	  	text-align: center;
	  	padding: 10px;
	}
	
	.tbl-pad th{
		font-size:25px;
		text-align: center;
	}
	
	.ud-up{
		text-align: center;
	  	background-color: #32de84;
		border: none;
		padding: 15px 10px;
		text-align: center;
		display: inline-block;
		border-radius: 10px;
		font-size: 20px;
		margin: 0
	}
	
	input[type="submit"]{
		text-align: center;
	  	background-color: #fe5757;
		border: none;
		padding: 15px 10px;
		text-align: center;
		display: inline-block;
		border-radius: 10px;
		font-size: 20px;
	}
	
	input:hover[type="submit"] {
		background-color: #FF0000;
		color: #fff;
	}
	
	.container2 {
	  	position: relative;
	  	width: 100%;
	  	height: 10vh;
	}
	
	button {
	    font: 20px Sans-serif;
	    position: absolute;
	    top: 20px;
	    right: 20px;
	    padding: 10px 20px;
	    background-color: #3457D5;
	    color: #fff;
	    border: none;
	    border-radius: 5px;
	}
	
	button:hover {
		background-color: #00008B;
	    cursor: pointer;
	    transition: background-color 0.3s ease;
	}


</style>
</head>
<body>
	<div class="getleft">	<!--logo-->
		<div class="image">
			<img src="images/logo.jpg" alt="ParkX logo" class="logo">
		</div>
	</div>
	<div class="container colornav topBotomBordersIn">	<!--navigation bar start-->
        <a href="Course.jsp">Manage Course</a>
		<a href="Reportin.jsp">Generate Reports</a>
        <a href="searchstudent.jsp">Search Student</a>
	</div>
	<%
		retrieveCoursesServlet retServ = new retrieveCoursesServlet();
		List<Course> courses = retServ.getAllCourses();
	%>
	<div class="container2">
		<a href="createCourse.jsp"> <button>Add a new Course</button> </a>
	</div>
	
	<div>
		<table class="tbl-pad">
			<thead>
				<tr>
			    	<th>Course ID</th>
			      	<th>Course Name</th>
			      	<th>Course Description</th>
			      	<th>Course Fee</th>
			      	<th>Update</th>
			      	<th>Delete</th>
			    </tr>
			</thead>
			<tbody>
				<% for (Course course : courses) { %>
					<tr align="center">
						<td><%= course.getCourseId() %></td>
	                    <td class="cen"><%= course.getCourseName() %></td>
	                    <td class="cen"><%= course.getCourseDes() %></td>
	                    <td><%= course.getcFee() %></td>
							
						<td>
							<div class="ud-up">
								<a href='updateCourse.jsp?u=<%= course.getCourseId() %>'>Edit Course Details</a>
							</div>
						</td>
							
						<td>
							<div class="ud-de">
								<form action='deleteCourse' method="post">
							        <input type="hidden" name="cID" value="<%= course.getCourseId() %>">
							        <input type="submit" name="delete" value="Delete Course">
							    </form>
							</div>
						</td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	

</body>
</html>