package formgenerator.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import formgenerator.model.Page;
import formgenerator.model.dao.PageDAO;
@Repository
public class PageDaoImpl implements PageDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	@Override
	public Page getPage(Integer id)
	{
		return entityManager.find(Page.class, id);
	}
	@Override
	@Transactional
	public Page savePage(Page page)
	{
		return entityManager.merge(page);
	}
	@Override
	@Transactional
	public boolean delete(Page page)
	{
		entityManager.remove(page);
		return true;
	}
	@Override
	public List<Page> getPages(Integer formId)
	{
		 return entityManager.createQuery( "select p from Page p where p.form.id= :formId order by id", Page.class ).setParameter("formId", formId)
		            .getResultList();
	}
	@Override
	public List<Page> getPages()
	{
		 return entityManager.createQuery( "select Page order by id", Page.class ).getResultList();
	}
	
}
