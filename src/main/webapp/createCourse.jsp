<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Course</title>
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
  input[type="number"],
  textarea {
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
	<script>
        function validateForm() {
            var courseID = document.getElementById("cid").value;
            var regex = /^[A-Z]{2}[0-9]{3}$/;
            if (!regex.test(courseID)) {
                alert("Please enter a valid Course ID (First two characters must be letters and other 3 must be numbers).");
                return false;
            }
            return true;
        }
    </script>
	
	<h1>Add a new Course</h1>
	
	<form action="insert" method="post" onsubmit="return validateForm()">
		Course ID <input type="text" id="cid" name="cid" required><br>
		Course Name <input type="text" name="cName" required><br>
		Course Description <textarea name="cDes" required></textarea><br>
		Course Fee <input type="number" name="cFee" required><br>
		<input type="submit" name="cSubmit" value="Create Course">
	</form>

</body>
</html>