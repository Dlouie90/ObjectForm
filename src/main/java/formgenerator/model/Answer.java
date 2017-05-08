package formgenerator.model;

import java.io.Serializable;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;


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
	
	@OneToOne(cascade = CascadeType.ALL)
	private FormElement formElements;
	
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
	public FormElement getFormElements() {
		return formElements;
	}
	public void setFormElements(FormElement formElements) {
		this.formElements = formElements;
	}
	
}