package formgenerator.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import formgenerator.model.AnswerSheet;
import formgenerator.model.dao.AnswerSheetDAO;


@Repository
public class AnswerSheetDaoImpl implements AnswerSheetDAO{

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public AnswerSheet getAnswerSheet(Integer id) {
		return entityManager.find(AnswerSheet.class, id);
	}

	@Override
	@Transactional
	public AnswerSheet saveAnswerSheet(AnswerSheet answersheet) {
		return entityManager.merge(answersheet);
	}

	@Override
	@Transactional
	public void deleteSheet(AnswerSheet answersheet) {
		entityManager.remove(answersheet);
		
	}

}
