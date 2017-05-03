<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="body" ignore="true"></tiles:insertAttribute>
<sec:authorize access="hasAuthority('Admin') || hasAuthority('Staff')">
	<a href="../pdffile/upload.html"><button type="button" class="btn btn-success">Upload New PDF File</button></a>
</sec:authorize>
<c:if test="${empty pdfFiles}">
	<div class="jumbotron">
		<h1>
			<small>There are no uploaded PDF Files.</small>
		</h1>
	</div>
</c:if>
<c:if test="${not empty pdfFiles}">
	<table class="table">
		<thead>
			<tr>
				<th>File Name</th>
				<th>Uploaded On</th>
				<th>Last Modified On</th>
				<th>Uploaded By</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
		<sec:authorize access="hasAuthority('Admin') || hasAuthority('Staff')">
				<c:forEach items="${pdfFiles}" var="pdfFile">
					<tr>
						<td>
							<a href="download.html?fileId=${pdfFile.fileId}">${pdfFile.fileName}</a>
						</td>
						<td>
							<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${pdfFile.createdDate}" />
						</td>
						<td>
							<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium"  value="${pdfFile.modifiedDate}" />
						</td>
						<td>${pdfFile.ownedBy.username}</td>
						<td>
							<a href="view.html?fileId=${pdfFile.fileId}"><button type="button" class="btn btn-info">View</button></a>
							<a href="rename.html?fileId=${pdfFile.fileId}"><button type="button" class="btn btn-warning">Rename</button></a>
							<a href="delete.html?fileId=${pdfFile.fileId}"><button type="button" class="btn btn-danger">Delete</button></a>
						</td>
					</tr>
				</c:forEach>
			</sec:authorize>
		</tbody>
	</table>
</c:if>