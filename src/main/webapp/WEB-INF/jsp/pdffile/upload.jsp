<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="body" ignore="true"></tiles:insertAttribute>
<form action="../pdffile/upload.html?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	<div class="form-group">
	    <label for="PDFFile">PDF File:</label>
	    <input type="file" class="form-control-file" name="PDFFile" id="PDFFile" aria-describedby="fileHelp">
	    <c:if test="${not empty errorMessage}"><p>${errorMessage}</p></c:if>
	    <c:if test="${empty errorMessage}"><small id="fileHelp" class="form-text text-muted">Can Upload only PDF Files.</small></c:if>
	</div>
	<input type="submit" name="upload" value="Upload" class="btn btn-primary">
</form>
