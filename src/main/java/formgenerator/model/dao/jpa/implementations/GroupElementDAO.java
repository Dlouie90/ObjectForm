package formgenerator.model.dao.jpa.implementations;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import formgenerator.model.GroupElement;
import formgenerator.model.dao.ObjectFormDAOI;
import formgenerator.model.dao.jpa.AbstractObjectFormDAO;

@Repository
@Scope(BeanDefinition.SCOPE_PROTOTYPE )
public class GroupElementDAO extends AbstractObjectFormDAO<GroupElement> implements ObjectFormDAOI<GroupElement>{

}
