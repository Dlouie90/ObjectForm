<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="center-block">
	<div class="page-header">
		<h3>Forms</h3>
	</div>

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
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
							<th style="text-align: center;">Title</th>
							<th style="text-align: center;">Created Date</th>
							<th style="text-align: center;">Last Modified</th>
							<th style="text-align: center;">Created By</th>
							<th style="text-align: center;">Actions</th>
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
												type="button" class="glyphicon glyphicon-trash">Delete</button></a>
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