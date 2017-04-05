package com.object.form.model.dao;

import java.util.List;

import com.object.form.model.FormElement;
import com.object.form.model.Page;

public interface PageDao {
		
	Page getPage(Integer id);
		
	Page savePage(Page page);
		
	void delete(Page page);
	
	List<FormElement> getElementsByPageId(Integer id);
		
	List<Page> getPages();

	List<Page> getPagesByFormID(Integer id);
}
