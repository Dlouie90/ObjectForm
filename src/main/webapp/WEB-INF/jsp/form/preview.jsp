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
		<h4>${pageLinks}</h4>
		<div class="panel-body">
			<c:if test="${empty elements}">
				<div class="jumbotron">
					<h1>
						Uh-Oh! <small>There are no Elements to display.</small>
					</h1>
				</div>
			</c:if>
			<c:if test="${not empty elements}">
				<form:form modelAttribute="page" method="post">
					<table class="table">
						<tbody>
							<c:forEach items="${elements}" var="element" varStatus="loop">
								<c:if test="${element.type == 'GroupElement'}">
									<th>${element.title}</th>
									<c:forEach items="${element.groupFormElements}" var="gElement">
										<c:if test="${gElement.type == 'Textbox'}">
											<tr>
												<td>${gElement.title}<form:input
														path="elements[${loop.index}].answers[0]" type="text"
														name="${gElement.name}" maxlength="gElement.maxLength" /></td>
											</tr>
										</c:if>
										<c:if test="${gElement.type == 'DateText'}">
											<tr>
												<td>${gElement.title}<input type="date"
													name="${gElement.name}" value="${gElement.answers}"></td>
											</tr>
										</c:if>
										<c:if test="${gElement.type == 'MultipleChoice'}">
											<tr>
												<td>${gElement.title}</td>
											</tr>
											<c:forEach items="${gElement.choices}" var="choice">
												<tr>
													<td><input type="checkbox" class="checkbox"
														name="${gElement.name}" value="${choice.text}" />${choice.text}</td>
												</tr>
											</c:forEach>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if
									test="${element.isInGroup == false || empty element.isInGroup}">
									<c:if test="${element.type == 'Textbox'}">
										<tr>
											<td>${element.title}<form:input
													path="elements[${loop.index}].answers" type="text"
													name="${gElement.name}" maxlength="gElement.maxLength" /></td>
										</tr>
									</c:if>
									<c:if test="${element.type == 'DateText'}">
										<tr>
											<td>${element.title}<input type="date"
												name="${element.name}" value="${element.answers}"></td>
										</tr>
									</c:if>
									<c:if test="${element.type == 'MultipleChoice'}">
										<tr>
											<td>${element.title}<c:forEach
													items="${element.choices}" var="choice">
													<c:choose>
														<c:when test="${not empty element.answers}">
															<input type="radio" name="${element.name}"
																value="${choice.text}" class="checkbox"
																style="display: inline;" checked="checked" />${choice.text}
													</c:when>
														<c:otherwise>
															<input type="radio" name="${element.name}"
																value="${choice.text}" class="checkbox"
																style="display: inline;" />${choice.text}
													</c:otherwise>
													</c:choose>
												</c:forEach>
											</td>
										</tr>
									</c:if>
								</c:if>
							</c:forEach>
							<!--  
							<input type="submit" name="Save Form" value="Save"
								class="btn btn-primary btn-lg"> -->
						</tbody>
					</table>
				</form:form>
			</c:if>
		</div>
	</div>
</div>