<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Success</title>
</head>
<body>
	<script>
		window.onload = function() {
			if (confirm("Operation Successful!! Click OK to navigate to Course Page")) {
				window.location.href = "Course.jsp";
  			}
		};
	</script>
</body>
</html>