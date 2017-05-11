<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/js/jquery.iframe-transport.js" />"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
	$(function() {
		$('tbody').sortable();
	});
</script>

<div class="center-block">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h2>${form.title}-Preview</h2>
		</div>

		<div class="form-group">
			<div class="col-sm-5">
				<div aria-label="Page navigation">
					<ul id="page" class="pagination">
						<c:forEach items="${pageLinks}" var="pageLink" varStatus="count">
							<li><a href="${pageLink}">${count.index+1}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>

		<div class="panel-body">
			<c:if test="${empty elements}">
				<div class="jumbotron">
					<h1>
						Uh-Oh! <small>There are no Elements to display.</small>
					</h1>
				</div>
			</c:if>
			<c:if test="${not empty elements}">
				<table class="table">
					<tbody>
						<c:forEach items="${elements}" var="element">
							<c:if test="${element.type == 'GroupElement'}">
								<th id="${element.orderId}">${element.title}</th>
								<c:forEach items="${element.groupFormElements}" var="gElement">
									<c:if test="${gElement.type == 'Textbox'}">
										<tr id="${gElement.orderId}">
											<td>${gElement.title}<input type="text"
												name="${gElement.name}" maxlength="gElement.maxLength" /></td>
										</tr>
									</c:if>
									<c:if test="${gElement.type == 'DateText'}">
										<tr id="${gElement.orderId}">
											<td>${gElement.title}<input type="date"
												name="${gElement.name}"></td>
										</tr>
									</c:if>
									<c:if test="${gElement.type == 'MultipleChoice'}">
										<tr id="${gElement.orderId}">
											<td>${gElement.title}<c:forEach
													items="${element.choices}" var="choice">
													<input type="radio" name="${gElement.name}"
														value="${choice.text}" class="checkbox"
														style="display: inline;" />${choice.text}								
										</c:forEach>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if
								test="${element.isInGroup == false || empty element.isInGroup}">
								<c:if test="${element.type == 'Textbox'}">
									<tr id="${element.orderId}">
										<td>${element.title}<input type="text"
											name="${element.name}" maxlength="gElement.maxLength" /></td>
									</tr>
								</c:if>
								<c:if test="${element.type == 'DateText'}">
									<tr id="${element.orderId}">
										<td>${element.title}<input type="date"
											name="${element.name}"></td>
									</tr>
								</c:if>
								<c:if test="${element.type == 'MultipleChoice'}">
									<tr id="${element.orderId}">
										<td>${element.title}<c:forEach items="${element.choices}"
												var="choice">
												<input type="radio" name="${element.name}"
													value="${choice.text}" class="checkbox"
													style="display: inline;" />${choice.text}								
										</c:forEach>
										</td>
									</tr>
								</c:if>
								<c:if test="${element.type == 'FormFile'}">
									<tr id="${element.orderId}">
										<td>
											<div class="form-group">
												<fieldset>
													<legend>File Upload</legend>
													<label for="fileupload">${element.title}</label>
													<form
														action="upload.html?${_csrf.parameterName}=${_csrf.token}"
														method="post" enctype="multipart/form-data">
														<input id="fileupload" type="file" name="files"
															class="form-control-file" aria-describedby="fileHelp"
															multiple> <input type="hidden" name="formId"
															value="${form.id}"> <input type="hidden"
															name="elementId" value="${element.id}"> <input
															type="submit" name="upload" value="Upload"
															class="btn btn-primary">
													</form>
												</fieldset>
											</div>
										</td>
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
	</div>
</div>