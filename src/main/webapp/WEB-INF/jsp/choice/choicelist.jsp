<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Add Options</title>
</head>
<body>
	<h3>Add Options</h3>
	<table class="table">
		<thead class="thead-default">
			<tr>
				<th>Options</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${choices}" var="choice">

				<tr>
					<td>${choice.text}</td>
					<td><a
						href="deletechoice.html?cid=${choice.id}&id=${id}&pid=${pid}"><button
								type="button" class="btn btn-danger">Delete</button></a></td>
				</tr>
			</c:forEach>
			<form:form modelAttribute="newchoice" class="form-horizontal"
				method="post">
				<tr>
					<td><form:input path="text" class="form-control"
							id="choiceText" /></td>
					<td><input type="submit" name="add" value="Add"
						class="btn btn-info">
				</tr>
			</form:form>
		</tbody>
	</table>
</body>
</html>