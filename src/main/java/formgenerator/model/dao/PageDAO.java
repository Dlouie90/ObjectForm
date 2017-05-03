package formgenerator.model.dao;

import java.util.List;

import formgenerator.model.Page;

public interface PageDAO {
	Page getPage(Integer id);
	Page savePage(Page page);	
	boolean delete(Page page);
	List<Page> getPages(Integer formId);
	List<Page> getPages();
}
