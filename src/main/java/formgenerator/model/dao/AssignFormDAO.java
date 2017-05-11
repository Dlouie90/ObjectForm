package formgenerator.model.dao;

import java.util.List;

import formgenerator.model.AssignedForm;

public interface AssignFormDAO {
	
	List<AssignedForm> getAssignedForms(Integer id);
	void saveAssigned(AssignedForm assigned);
	boolean removeAssignment(AssignedForm ass);
	AssignedForm getAssignment(Integer id);

}
