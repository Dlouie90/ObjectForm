package com.object.form.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.Choice;
import com.object.form.model.dao.ChoiceDao;

@Repository
public class ChoiceDaoImpl implements ChoiceDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Choice getChoice(Integer id) {
		return entityManager.find(Choice.class, id);
	}

	@Override
	@Transactional
	public Choice saveChoice(Choice choice) {
		return entityManager.merge(choice);
	}

	@Override
	@Transactional
	public void delete(Choice choice) {
		entityManager.remove(choice);
		
	}

}
