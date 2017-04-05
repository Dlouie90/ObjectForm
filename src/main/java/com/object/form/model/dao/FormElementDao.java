package com.object.form.model.dao;

import java.util.List;

import com.object.form.model.FormElement;
import com.object.form.model.Textbox;

public interface FormElementDao {

	FormElement getFormElementById(Integer id);
	
	FormElement saveFormElement(FormElement element);

	Textbox saveTextBox(Textbox element);
	
	void delete(FormElement element);
	
	List<FormElement> getFormElements();
}