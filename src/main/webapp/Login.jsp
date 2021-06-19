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
<style>
.login-container {
	margin-top: 5%;
	margin-bottom: 5%;
}

.login-form-1 {
	padding: 5%;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-1:hover {
	background: #EDF2F7;
	border-radius: 15px;
}

.login-form-1 h3 {
	text-align: center;
	color: #40668F;
}

.login-form-2 {
	padding: 5%;
	background: #40668F;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-2:hover {
	background: #38597D;
	border-radius: 15px;
}

.login-form-2 h3 {
	text-align: center;
	color: #fff;
}

.login-container form {
	padding: 10%;
}

.btnSubmit {
	width: 50%;
	border-radius: 1rem;
	padding: 1.5%;
	border: none;
	cursor: pointer;
}

.login-form-1 .btnSubmit {
	font-weight: 600;
	color: #fff;
	background-color: #40668F;
}

.login-form-2 .btnSubmit {
	font-weight: 600;
	color: #40668F;
	background-color: #fff;
}

.login-form-2 .invaliPw {
	color: #fff;
	font-weight: 600;
	text-decoration: none;
}

.login-form-1 .invaliPw {
	color: #0062cc;
	font-weight: 600;
	text-decoration: none;
}
}
</style>
<title>Login Form</title>
</head>
<body>
	<div class="container login-container">
		<div class="row">
			<div class="col-md-6 login-form-1">
				<h3>Login for Administrator</h3>
				<form method="get" action="Login">
					<div class="form-group">
						<input type="text" class="form-control" name="uname"
							placeholder="Your username *" value="" required />
						<div id="validationServerUsernameFeedback"
							class="invalid-feedback">Please choose a username.</div>
					</div>
					<br>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Your Password *" value="" required />
					</div>
					<br>
					<div class="form-group">
						<input type="submit" class="btnSubmit" value="Login" />
					</div>
					<div class="form-group">
						<label for="message" class="invaliPw"></label>
					</div>
				</form>
			</div>
			<div class="col-md-6 login-form-2">
				<h3>Login for Student</h3>
				<form method="post" action="LoginStudent">
					<div class="form-group">
						<input type="text" class="form-control" name="uname"
							placeholder="Your username *" value="" required />
					</div>
					<br>
					<div class="form-group">
						<input type="password" class="form-control" name="password"
							placeholder="Your Password *" value="" required />
					</div>
					<br>
					<div class="form-group">
						<input type="submit" class="btnSubmit" value="Login" />
					</div>
					<br>
					<div class="form-group">
						<label for="message" class="invaliPw"></label>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>