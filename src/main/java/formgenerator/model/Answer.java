package formgenerator.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;


//using table per concrete class inheritance strategy

@Entity
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(
    name="answerType",
    discriminatorType=DiscriminatorType.STRING
)
public abstract class Answer implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    //@SequenceGenerator(name="answer_id_seq",sequenceName="answer_id_seq",initialValue = 100,allocationSize=1)
	//@GeneratedValue(strategy = GenerationType.SEQUENCE, generator="answer_id_seq")	
	@Column(name = "id")
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "memberId")
	private Member user;

	@ManyToOne
	@JoinColumn(name = "formId")
	private Form form;
	
	@ManyToMany(cascade=CascadeType.ALL)
	@JoinTable(name = "formElement_answers",
		    joinColumns=@JoinColumn(name = "answer_id"),
		    inverseJoinColumns=@JoinColumn(name="formElement_id"))
	private List<FormElement> formElements;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Member getUser() {
		return user;
	}
	public void setUser(Member user) {
		this.user = user;
	}
	public List<FormElement> getFormElements() {
		return formElements;
	}
	public void setFormElements(List<FormElement> formElements) {
		this.formElements = formElements;
	}
	
}