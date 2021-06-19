<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.*"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="Service.DBConnector"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

<title>Student Details</title>
<style>
body {
	margin: 0;
	font-family: "Lato", sans-serif;
}

.sidebar {
	margin: 0;
	padding: 0;
	width: 250px;
	background-color: #40668F;
	position: fixed;
	height: 100%;
	overflow: auto;
}

.container {
	text-align: center;
	display: block;
	color: white;
	padding: 30px;
	text-decoration: none;
}

.sidebar a {
	display: block;
	color: white;
	padding: 20px;
	text-decoration: none;
}

.sidebar a.active {
	background-color: #EDF2F7;
	color: black;
}

.sidebar a:hover:not(.active) {
	background-color: #203347;
	color: white;
}

.view-form {
	margin-left: 350px;
	margin-right: 100px;
	padding: 16px 16px;
	height: 100%;
}

.view-form h3 {
	text-align: center;
	margin-top: 25px;
}

.open-button {
	background-color: #555;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	opacity: 0.8;
	position: fixed;
	bottom: 23px;
	right: 28px;
	width: 280px;
}

.form-popup {
	display: none;
	position: fixed;
	bottom: 0;
	right: 15px;
	border: 3px solid #f1f1f1;
	z-index: 9;
	border-radius: 20px;
}

.form-container {
	max-width: 300px;
	padding: 10px;
	background-color: white;
}

.form-container .StudentId{
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	border: none;
	background: #f1f1f1;
}

.form-container .btn {	
	color: white;
	border-radius: 10;
	cursor: pointer;
	width: 100%;
	margin-bottom: 10px;
	opacity: 0.8;
}
.form-container #status{
    border-radius: 10;
    width: 75%;
    height: 20%;

}

</style>
</head>
<%
Connection conn = DBConnector.createDBConnection();
%>
<body>
	<div class="sidebar">
		<div class="container">
			<i class="fa fa-user-circle fa-3x"></i>
			<h4>Administrator</h4>
		</div>
		<a href="Registration.jsp">Student Registration</a> <a class="active"
			href="StudentDetails.jsp">View Student Details</a> <a
			href="Login.jsp">Log Out</a>>
	</div>
	<div class="view-form">
		<form method="get" action="GetStudentDetails">
			<h3>Student Details</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">id</th>
						<th scope="col">Name</th>
						<th scope="col">Address</th>
						<th scope="col">Email</th>
						<th scope="col">Contact_Number</th>
						<th scope="col">Date_of_Birth</th>
						<th scope="col">NIC</th>
						<th scope="col">Status</th>
					</tr>
				</thead>
				<tbody>
					<%
					try {
						ResultSet GetStudentData = conn.createStatement().executeQuery("SELECT *  FROM student");
						while (GetStudentData.next()) {
					%>
					<tr>
						<td><%=GetStudentData.getString("sid")%></td>
						<td><%=GetStudentData.getString("name")%></td>
						<td><%=GetStudentData.getString("address")%></td>
						<td><%=GetStudentData.getString("email")%></td>
						<td><%=GetStudentData.getString("tel")%></td>
						<td><%=GetStudentData.getString("dob")%></td>
						<td><%=GetStudentData.getString("nic")%></td>
						<td><%=GetStudentData.getString("status")%></td>
						<td><input class="btn btn-outline-success" type="button"
							id="btnApprove"
							onclick="getTaskId(<%=GetStudentData.getString("sid")%>);"
							value="edit" /></td>
					</tr>
					<%
					}

					} catch (Exception e) {
					e.printStackTrace();
					}
					%>
				</tbody>
			</table>
		</form>
	</div>
	<script type="text/javascript">
    function getTaskId(id){
       // var id = document.getElementById('getTaskId').value;
        document.getElementById("myForm").style.display = "block";
        document.getElementById("StudentId").value = id;
    }
</script>
	<script>

function closeForm() {
  document.getElementById("myForm").style.display = "none";
}
</script>

	<div class="form-popup" id="myForm">
		<form method="post" action="SetStudentStatus" class="form-container">

			<h3 align="center">Change Status</h3><br>
			student id is: <input type="text" class="StudentId" id="StudentId" name="StudentId"> 
			status: &nbsp;&nbsp; 
			<select 
				id="status" name="status">
				<option value="1">Enable</option>
				<option value="0">Disable</option>
			</select><br><br>
			 <input type="submit" class="btn btn-primary" value="set status"><br>
			<button type="button" class="btn btn-secondary" onclick="closeForm()">Close</button>
		</form>
	</div>
</body>
</html>