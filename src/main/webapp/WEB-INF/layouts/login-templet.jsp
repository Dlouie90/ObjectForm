<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html> 
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="<c:url value="/webjars/jquery/1.11.1/jquery.js" />"></script>
		<script type="text/javascript" src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.min.js" />"></script>
		<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.2.0/css/bootstrap.css" />">					
		<title><tiles:getAsString name="title"/></title>
		<style>
			.form-signin {
				max-width: 330px;
				padding: 15px;
				margin: 0 auto;
			}
			
			.form-signin .form-signin-heading, .form-signin .checkbox {
				margin-bottom: 10px;
			}
			
			.form-signin .checkbox {
				font-weight: normal;
			}
			
			.form-signin .form-control {
				position: relative;
				font-size: 16px;
				height: auto;
				padding: 10px;
				-webkit-box-sizing: border-box;
				-moz-box-sizing: border-box;
				box-sizing: border-box;
			}
			
			.form-signin .form-control:focus {
				z-index: 2;
			}
			
			.form-signin input[type="text"] {
				margin-bottom: -1px;
				border-bottom-left-radius: 0;
				border-bottom-right-radius: 0;
			}
			
			.form-signin input[type="password"] {
				margin-bottom: 10px;
				border-top-left-radius: 0;
				border-top-right-radius: 0;
			}
			
			.account-wall {
				margin-top: 20px;
				padding: 40px 0px 20px 0px;
				background-color: #f7f7f7;
				-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
				-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
				box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
			}
			
			.login-title {
				color: #555;
				font-size: 18px;
				font-weight: 400;
				display: block;
			}
			
			.profile-img {
				width: 96px;
				height: 96px;
				margin: 0 auto 10px;
				display: block;
				-moz-border-radius: 50%;
				-webkit-border-radius: 50%;
				border-radius: 50%;
			}
			
			.need-help {
				margin-top: 10px;
			}			
		</style>
	</head>
	<body>
		 <nav class="navbar navbar-default">
		 	<div class="container-fluid">
		 		<div class="navbar-header">		 			
		 			<a class="navbar-brand" href="#">Object Form</a>
		 		</div> 		
		 	</div>
		 </nav>
		<div class="container">
			<div class="row-fluid">
				<tiles:insertAttribute name="body" />
			</div>
		</div>				
	</body>
</html>