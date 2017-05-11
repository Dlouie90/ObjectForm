package formgenerator.model.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import formgenerator.model.FileUploadForm;
import formgenerator.model.Form;

public interface FormDAO {
	Form getForm(Integer id);
	Form saveForm(Form form);
	boolean delete(Form form);
	List<Form> getForms();
	Set<Form> findByNamedQuery(String query, Map<String, String> param);
	FileUploadForm saveFormFile(FileUploadForm formFile);
	FileUploadForm getFormFile(Integer fileId);
	FileUploadForm getFormFile(Integer formId, Integer userId);
}
