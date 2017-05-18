<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
	$(function() {
		$('tbody').sortable();
		$('tbody').disableSelection();
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
				<form:form modelAttribute="answersheet" method="POST">
					<table class="table">
						<tbody>
							<c:forEach items="${elements}" var="element" varStatus="loop">
								<c:if test="${element.type == 'GroupElement'}">
									<th>${element.title}</th>
									<c:forEach items="${element.groupFormElements}" var="gElement"
										varStatus="loop2">
									</c:forEach>
								</c:if>
								<c:if
									test="${element.isInGroup == false || empty element.isInGroup}">
									<c:if test="${element.type == 'Textbox'}">
										<tr>
											<td>${element.title}<form:input
													path="answers[${loop.index}].value" type="text"
													name="${element.name}" maxlength="element.maxLength" /></td>
										</tr>
									</c:if>
									<c:if test="${element.type == 'MultipleChoice'}">
										<tr>
											<td>${element.title}<c:forEach
													items="${element.choices}" var="choice">
													<form:checkbox path="answers[${loop.index}].choiceAnswers" value="${choice}"/>${choice.text}
												</c:forEach>
											</td>
										</tr>
									</c:if>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					<input type="submit" name="Save" value="Save"
						class="btn btn-primary btn-lg">
				</form:form>
			</c:if>
		</div>
	</div>
</div>