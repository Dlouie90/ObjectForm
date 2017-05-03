package formgenerator.model.dao.jpa;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public abstract class AbstractObjectFormDAO<T extends Serializable>  {
	
	@PersistenceContext
	private EntityManager em;
		
	public T findByCriteria(Map<String, String> params, Class<T> c) {
		
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<T> q = cb.createQuery(c);
		List<Predicate> predicates = new ArrayList<Predicate>();
		Root<T> t = q.from(c);

		params.forEach((k, v) -> predicates.add(cb.equal(t.get(k), v)));
		q.select(t).where(predicates.toArray(new Predicate[] {}));
		T result = em.createQuery(q).getSingleResult();		

		return result;
	}
}
