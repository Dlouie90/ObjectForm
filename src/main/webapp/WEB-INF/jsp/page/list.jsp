<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="center-block">
	<c:if test="${empty pages}">
		<div class="jumbotron">
			<h1>
				Uh-Oh! <small>There are no Pages to display.</small>
			</h1>
		</div>
	</c:if>
	<c:if test="${not empty pages}">
		<div class="panel panel-primary">			
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th style="text-align:center;">Page No.</th>
							<th style="text-align:center;">Description</th>
							<th style="text-align:center;">Manage</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pages}" var="page">
							<tr>					
								<td style="text-align:center;">${page.number}</td>
								<td style="text-align:center;">${page.description}</td>
								<td style="text-align:center;">
									<a href="../element/list.html?formId=${formId }&pageId=${page.id}"><button
											type="button" class="btn btn-info">Elements</button></a> <a
									href="edit.html?pageId=${page.id}&formId=${formId }"><button
											type="button" class="btn btn-warning">Edit</button></a> <a
									href="delete.html?pageId=${page.id}&formId=${formId }"><button
											type="button" class="btn btn-danger">Delete</button></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>				
			</div>			
		</div>
	</c:if>
	<a href="add.html?formId=${formId }">
		 <button type="button" class="btn">Add New Page</button>
	</a>
</div>
	