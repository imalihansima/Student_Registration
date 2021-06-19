<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/vendors/formvalidation/dist/css/formValidation.min.css">
<title>Registration</title>
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

.registration-form {
	margin-left: 350px;
	margin-right: 100px;
	padding: 16px 16px;
	height: 100%;
}

.registration-form h3 {
	text-align: center;
	margin-top: 25px;
}
</style>
</head>
<body>
	<div class="sidebar">
		<div class="container">
			<i class="fa fa-user-circle fa-3x" aria-hidden="true"></i>
			<h4>Administrator</h4>
		</div>
		<a class="active" href="Registration.jsp">Student Registration</a> <a
			href="StudentDetails.jsp">View Student Details</a> <a
			href="Login.jsp">Log Out</a>>
	</div>
	<div class=" registration-form">
		<h3>Student Registration</h3>
		<form method="post" action="StudentRegistration" id="StuRegistration">
			<div class="col-md-16">
				<div class="form-group">
					<label for="sid">Student ID</label> <input type="text"
						class="form-control form-control-sm" name="sid" id="sid"
						placeholder="Enter Student ID" pattern="[0-9]{3}" required>
				</div>
				<br>
				<div class="form-group">
					<label for="fname">Full Name</label> <input type="text"
						class="form-control form-control-sm" name="fname" id="fname"
						placeholder="Enter Full Name" pattern="[A-Za-z]{5,}" required>
				</div>
				<br>
				<div class="form-group">
					<label for="address">Address</label> <input type="text"
						class="form-control form-control-sm" name="address" id="address"
						placeholder="Enter Student Address">
				</div>
				<br>
			</div>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="dob">Date of Birth</label> <input type="date"
						class="form-control form-control-sm" name="dob" id="dob"
						placeholder="Date of Birth">
				</div>
				<div class="form-group col-md-6">
					<label for="nic">NIC</label> <input type="text"
						class="form-control form-control-sm" name="nic" id="nic"
						placeholder="NIC number">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="InputEmail">Email</label> <input type="email"
						class="form-control form-control-sm" name="email" id="email"
						placeholder="Email"
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
				</div>
				<div class="form-group col-md-6">
					<label for="InputContactNumber">Contact Number</label> <input
						type="text" class="form-control form-control-sm" name="tel"
						id="tel" placeholder="Contact number" pattern="[0-9]{10}" required>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="form-group col-md-6">
					<label for="uname">User Name</label> <input type="text"
						class="form-control form-control-sm" name="uname" id="uname"
						placeholder="User Name" pattern=".{5,10}" required>
				</div>
				<div class="form-group col-md-6">
					<label for="password">Password</label> <input type="password"
						class="form-control form-control-sm" name="password" id="password"
						placeholder="Password" pattern=".{6,}" required>
				</div>
			</div>
			<br>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>