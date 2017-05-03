<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="center-block">
	<c:if test="${empty forms}">
		<div class="jumbotron">
			<h1>
				Uh-Oh! <small>There are no Forms to display.</small>
			</h1>
		</div>
	</c:if>
	<c:if test="${not empty forms}">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2>Manage Forms</h2>
			</div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>Title</th>
							<th>Created Date</th>
							<th>Last Modified</th>
							<th>Created By</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${forms}" var="form">
							<tr>
								<td>${form.title}</td>
								<td>${form.createdDate}</td>
								<th>${form.modifiedDate}</th>
								<td>${form.ownedBy.username}</td>
								<td><a href="preview.html?formId=${form.id}"><button
											type="button" class="btn btn-info">Preview</button></a> <sec:authorize
										access="hasAuthority('Admin') || hasAuthority('Staff')">
										<a href="edit.html?id=${form.id}"><button type="button"
												class="btn btn-primary">Edit</button></a>
										<a href="delete.html?formId=${form.id}"><button
												type="button" class="glyphicon glyphicon-trash 
												                     btn btn-danger">Delete</button></a>
										<a href="../page/list.html?formId=${form.id}"><button
												type="button" class="btn btn-warning">Pages</button></a>
									</sec:authorize></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
</div>