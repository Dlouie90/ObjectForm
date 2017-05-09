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
									<c:forEach items="${element.groupFormElements}" var="gElement"
										varStatus="loop2">
										<c:if test="${gElement.type == 'Textbox'}">

											<tr>
												<c:forEach items="${elements}" var="element2"
													varStatus="loop3">
													<c:if test="${gElement.id == element2.id}">
														<td>${gElement.title}<form:input
																path="elements[${loop3.index}].answers[0].value"
																type="text" name="${gElement.name}"
																maxlength="gElement.maxLength" /></td>
													</c:if>
												</c:forEach>
											</tr>
										</c:if>
										<c:if test="${gElement.type == 'DateText'}">
											<tr>
												<c:forEach items="${elements}" var="element3"
													varStatus="loop4">
													<c:if test="${gElement.id == element3.id}">
														<td>${gElement.title}<form:input
																path="elements[${loop4.index}].answers[0].date"
																type="date" name="${gElement.name}" /></td>
													</c:if>
												</c:forEach>
											</tr>
										</c:if>
										<c:if test="${gElement.type == 'MultipleChoice'}">
											<tr>
												<td>${gElement.title}</td>
											</tr>
											<c:forEach items="${gElement.choices}" var="choice">
												<tr>
													<c:forEach items="${elements}" var="element4"
														varStatus="loop5">
														<c:if test="${gElement.id == element4.id}">
															<c:forEach items="${gElement.answers}" var="answer">
																<c:forEach items="${answer.choiceAnswers}" var="canswer">
																	<c:choose>
																		<c:when test="${canswer.id == choice.id}">
																			<form:radiobutton class="checkbox"
																				style="display: inline;"
																				path="elements[${loop4.index}].answers[0].choiceAnswers[0]"
																				value="${choice.text}" checked="checked" />${choice.text}
													</c:when>
																		<c:otherwise>
																			<form:radiobutton class="checkbox"
																				style="display: inline;"
																				path="elements[${loop4.index}].answers[0].choiceAnswers[0]"
																				value="${choice.text}" />${choice.text}
													</c:otherwise>
																	</c:choose>
																</c:forEach>
															</c:forEach>
														</c:if>
													</c:forEach>
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
													path="elements[${loop.index}].answers[0].value" type="text"
													name="${element.name}" maxlength="gElement.maxLength" /></td>
										</tr>
									</c:if>
									<c:if test="${element.type == 'DateText'}">
										<tr>
											<td>${element.title}<form:input
													path="elements[${loop.index}].answers[0].date" type="date"
													name="${element.name}" /></td>
										</tr>
									</c:if>
									<c:if test="${element.type == 'MultipleChoice'}">
										<tr>
											<td>${element.title}<c:forEach
													items="${element.choices}" var="choice">
													<c:forEach items="${element.answers}" var="answer">
														<c:forEach items="${answer.choiceAnswers}" var="canswer">
															<c:choose>
																<c:when test="${canswer.id == choice.id}">
																	<form:radiobutton class="checkbox"
																		style="display: inline;"
																		path="elements[${loop.index}].answers[0].choiceAnswers[0]"
																		value="${choice.text}" checked="checked" />${choice.text}
													</c:when>
																<c:otherwise>
																	<form:radiobutton class="checkbox"
																		style="display: inline;"
																		path="elements[${loop.index}].answers[0].choiceAnswers[0]"
																		value="${choice.text}" />${choice.text}
													</c:otherwise>
															</c:choose>
														</c:forEach>
													</c:forEach>
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