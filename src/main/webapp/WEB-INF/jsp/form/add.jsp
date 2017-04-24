<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<form:form modelAttribute="form">
  <div class="form-group">
    <label for="formTitle">Title:</label>
    <form:input path="title" id="formTitle" placeholder="Enter Form Title" class="form-control" />
  </div>
  <div class="form-group">
    <label for="formDescription">Description:</label>
    <form:input path="description" id="formDescription" placeholder="Enter Form Description" class="form-control" />
  </div>
  <div class="form-group">
    <label for="numberOfPages">Number of Pages:</label>
    <select name="numofpages" class="form-control" id="numberOfPages">
		<c:forEach begin="1" end="15" varStatus="loop">
			<option value="${loop.index}">${loop.index}</option>
		</c:forEach>
	</select>
  </div>
  <input type="submit" class="btn btn-success" name="add" value="Save">
</form:form>