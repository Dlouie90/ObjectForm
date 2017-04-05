package com.object.form.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.Member;
import com.object.form.model.dao.MemberDAO;

@Repository
public class MemberDaoImpl implements MemberDAO{
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Member getMember(Integer id)
	{
		//entityManager.find(Member.class, id);
		return entityManager.find(Member.class, id);
	}
	
	@Override
	public List<Member> getMembers()
	{
		 return entityManager.createQuery( "from Member order by id", Member.class )
		            .getResultList();
	}
	
	@Override
	@Transactional
	public Member saveMember(Member member)
	{

		return entityManager.merge(member);		
	}
	
	@Override
	@Transactional
	public boolean delete(Member member)
	{
		entityManager.remove(member);
		return true;
	}
	
}
