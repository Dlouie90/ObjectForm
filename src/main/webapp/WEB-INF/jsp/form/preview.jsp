<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value="/js/jquery.iframe-transport.js" />"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>   
$(function() {
    $('#sortable').sortable({
        placeholder: "ui-state-highlight",
               for(var i=1;i < $(".class").length; i++){
                    $('.order').val(i);
                }
            })

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
				<form:form modelAttribute="page" method="post">
					<table class="table">
						<tbody id="sortable">
							<c:forEach items="${elements}" var="element" varStatus="loop">
								<c:if test="${element.type == 'GroupElement'}">
									<th>${element.title}<form:input
											path="elements[${loop.index}].orderId" type="hidden"
											name="${element.name}" class="order" /></th>
									<c:forEach items="${element.groupFormElements}" var="gElement"
										varStatus="loop2">
										<c:if test="${gElement.type == 'Textbox'}">
											<c:forEach items="${elements}" var="element2"
												varStatus="loop2">
												<c:if test="${gElement.id == element2.id}">
													<tr>
														<form:input path="elements[${loop2.index}].orderId"
															type="hidden" name="${gElement.name}" class="order" />
														<td>${gElement.title}<form:input
																path="elements[${loop.index}].answers[0].value"
																type="text" name="${gElement.name}"
																maxlength="gElement.maxLength" /></td>
													</tr>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${gElement.type == 'DateText'}">
											<c:forEach items="${elements}" var="element3"
												varStatus="loop3">
												<c:if test="${gElement.id == element3.id}">
													<tr>
														<form:input path="elements[${loop3.index}].orderId"
															type="hidden" name="${gElement.name}" class="order" />
														<td>${gElement.title}<form:input
																path="elements[${loop.index}].answers[0].date"
																type="date" name="${gElement.name}" /></td>
													</tr>
												</c:if>
											</c:forEach>
										</c:if>
										<c:if test="${gElement.type == 'MultipleChoice'}">
											<%-- <c:forEach items="${elements}" var="element4"
												varStatus="loop3">
												<c:if test="${gElement.id == element4.id}">
													<tr>
														<form:input path="elements[${loop.index}].orderId"
															type="hidden" name="${gElement.name}" class="order" />
														<td>${gElement.title}<c:forEach
																items="${gElement.choices}" var="choice">
																<c:forEach items="${gElement.choices}" var="choice">
																	<c:forEach items="${gElement.answers}" var="answer">
																		<c:forEach items="${answer.choiceAnswers}"
																			var="canswer">
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
															</c:forEach></td>
													</tr>
												</c:if>
											</c:forEach> --%>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if
									test="${element.isInGroup == false || empty element.isInGroup}">
									<c:if test="${element.type == 'Textbox'}">
										<tr>
											<form:input path="elements[${loop.index}].orderId"
												type="hidden" name="${element.name}" class="order" />
											<td>${element.title}<form:input
													path="elements[${loop.index}].answers[0].value" type="text"
													name="${element.name}" maxlength="gElement.maxLength" /></td>
										</tr>
									</c:if>
									<c:if test="${element.type == 'DateText'}">
										<tr>
											<form:input path="elements[${loop.index}].orderId"
												type="hidden" name="${element.name}" class="order" />
											<td>${element.title}<form:input
													path="elements[${loop.index}].answers[0].date" type="date"
													name="${element.name}" /></td>
										</tr>
									</c:if>
									<c:if test="${element.type == 'MultipleChoice'}">
										<%-- <tr>
											<form:input path="elements[${loop.index}].orderId"
												type="hidden" name="${element.name}" class="order" />
											<td>${element.title}<c:forEach
													items="${element.choices}" var="choice">
													<c:forEach items="${element.choices}" var="choice">
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
												</c:forEach>
											</td>
										</tr> --%>
									</c:if>
									<c:if test="${element.type == 'FormFile'}">
										<tr>
											<form:input path="elements[${loop.index}].orderId"
												type="hidden" name="${element.name}" class="order" />
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
					<input type="submit" name="Save" value="Save"
						class="btn btn-primary btn-lg">
				</form:form>
			</c:if>
		</div>
	</div>
</div>