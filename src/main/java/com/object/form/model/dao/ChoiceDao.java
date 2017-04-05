package com.object.form.model.dao;

import com.object.form.model.Choice;

public interface ChoiceDao {
		
	Choice getChoice(Integer id);
		
	Choice saveChoice(Choice choice);
		
	void delete(Choice choice);
	
}
