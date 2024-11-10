<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="com.course.Course" %>
    <%@ page import="com.course.courseDBUtil" %>
    <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Course</title>
<link rel="stylesheet" type="text/css" href="HeaderFooter.css">
<style>
  h1{
  	text-align: center;
  }
  
  body {
    font-family: Arial, sans-serif;
  }
  
  form {
    width: 500px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #f9f9f9;
    margin: auto;
    overflow: auto;
  }
  
  input[type="text"],
  input[type="number"] {
    width: calc(100% - 22px);
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 16px;
  }
  
  textarea {
    height: 100px;
  }
  
  input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    text-align: center;
    float: right;
  }
  
  input[type="submit"]:hover {
    background-color: #45a049;
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
	String courseId = request.getParameter("u");
	List<Course> courses = courseDBUtil.viewCourse();
	
	Course course = null;
    for (Course c : courses) {
        if (c.getCourseId().equals(courseId)) {
            course = c;
            break;
        }
    }
     %>
	<h1>Update Course</h1>
	
	<form action="courseUpdate" method="post" >
        Course ID: <input type="text" name="cID" value="<%= course.getCourseId() %>" readonly><br>
        Course Name: <input type="text" name="cName" value="<%= course.getCourseName() %>"><br>
        Course Description: <input type="text" name="cDes" value="<%= course.getCourseDes() %>"><br>
        Course Fee: <input type="number" name="cFee" value="<%= course.getcFee() %>"><br>
        <input type="submit" name="submit" value="Update Course Details">
	</form>
	
</body>
</html>