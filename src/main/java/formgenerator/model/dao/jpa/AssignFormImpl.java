package formgenerator.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import formgenerator.model.AssignedForm;
import formgenerator.model.dao.AssignFormDAO;

@Repository
public class AssignFormImpl implements AssignFormDAO {
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<AssignedForm> getAssignedForms(Integer id) {
		return entityManager.createQuery( " FROM AssignedForms WHERE Id = :id", AssignedForm.class ).setParameter("id", id)
	            .getResultList();
	}

	@Override
	@Transactional
	public void saveAssigned(AssignedForm assigned) {
		entityManager.merge(assigned);
	}

	@Override
	@Transactional
	public boolean removeAssignment(AssignedForm ass) {
		entityManager.remove(ass);
		return true;		
	}

	@Override
	public AssignedForm getAssignment(Integer id) {		
		return entityManager.find(AssignedForm.class, id);
	}

}
