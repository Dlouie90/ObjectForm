<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<title>${page.form.title}</title>
</head>
<body>
<h3>${page.form.title}</h3>
	<c:forEach items="${elements}" var="element">
		<c:if test="${element.type == 'textbox'}">
		${element.name} <input type="text" class="form-control"><br/>
		</c:if>
		<c:if test="${element.type == 'checkbox'}">
			${element.name} <br/>
			<c:forEach items="${element.choices}" var="choice">
				<input type="checkbox">${choice.text}<br/>
			</c:forEach>
			<br/>
		</c:if>
	</c:forEach>
</body>
</html>