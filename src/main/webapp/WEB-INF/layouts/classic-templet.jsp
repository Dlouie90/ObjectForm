<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib  prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html> 
	<head>
		<meta charset="UTF-8">
		<script type="text/javascript" src="<c:url value="/webjars/jquery/1.11.1/jquery.js" />"></script>
		<script type="text/javascript" src="<c:url value="/webjars/bootstrap/3.2.0/js/bootstrap.min.js" />"></script>
		<link rel="stylesheet" href="<c:url value="/webjars/bootstrap/3.2.0/css/bootstrap.css" />">			
		<title><tiles:getAsString name="title"/></title>
	</head>
	<body>
		<tiles:insertAttribute name="menu" defaultValue="/WEB-INF/layouts/menu.jsp" defaultValueType="template" />
		<div class="container">
			<div class="row-fluid">
				<tiles:insertAttribute name="body" />
			</div>
		</div>				
	</body>
</html>