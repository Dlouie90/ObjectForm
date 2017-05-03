<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="body" ignore="true"></tiles:insertAttribute>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form modelAttribute="pdfFile">
	<form:hidden path="fileId" />
	<div class="form-group row">
		<label for="fileName" class="col-sm-2 col-form-label">PDF File Name:</label>
		<div class="col-sm-10">
			<form:input path="fileName" class="form-control" id="fileName" />
		</div>
	</div>
	<input type="submit" name="rename" value="Rename" class="btn btn-primary">
</form:form>
