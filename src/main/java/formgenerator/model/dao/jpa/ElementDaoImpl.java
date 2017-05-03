package formgenerator.model.dao.jpa;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import formgenerator.model.FormElement;
import formgenerator.model.MultipleChoice;
import formgenerator.model.dao.ElementDAO;

@Repository
public class ElementDaoImpl implements ElementDAO {
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public FormElement getElement(Integer id) {
		// TODO Auto-generated method stub
		return entityManager.find(FormElement.class, id);
	}

	@Override
	@Transactional
	public FormElement saveElement(FormElement element) {
		
		return entityManager.merge(element);	
	}
	
	@Override
	@Transactional
	public FormElement saveFormElement(FormElement element) {
		
		MultipleChoice m = new MultipleChoice();
		m.setChoices(new ArrayList());
		if (element.getId() != null && element.getId() > 0) {
			
			m = (MultipleChoice)this.getElement(element.getId());
			List choices = m.getChoices();
			
			List removedList = new ArrayList();
			if(choices instanceof ArrayList){
				removedList = (List)((ArrayList)choices).clone();
			}
			choices.clear();

			for(int i=0;i<removedList.size();i++){
				entityManager.remove(removedList.get(i));
			}

		}
		
		BeanUtils.copyProperties(element, m);
		entityManager.merge(m);		
		return entityManager.merge(element);	
	}

	@Override
	@Transactional
	public boolean delete(FormElement element) {
		
		entityManager.remove(element); 
		return true;
	}

	@Override
	public List<FormElement> getElements(Integer pageId) {
		// TODO Auto-generated method stub
		 return entityManager.createQuery( "SELECT fe FROM FormElement fe JOIN fe.pages p WHERE p.id=:pageId ORDER BY fe.id ASC", FormElement.class ).setParameter("pageId", pageId)
		            .getResultList();
	}
	
	
}
