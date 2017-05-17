package formgenerator.model;

import java.io.Serializable;
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
import javax.persistence.Transient;


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
	@Column(name = "id")
	private Integer id;
	
	@ManyToOne
	@JoinColumn(name = "memberId")
	private Member user;

	@ManyToOne
	@JoinColumn(name = "formId")
	private Form form;
	
	@ManyToOne
	@JoinColumn(name = "answersheetId")
	private AnswerSheet answersheet;
	
	@Transient
	@Column(name = "answerType", insertable = false, updatable = false)
	private String type;
	
	public Answer() {
		this.setType(this.getClass().getSimpleName());
	}
	
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
	public AnswerSheet getAnswersheet() {
		return answersheet;
	}
	public void setAnswersheet(AnswerSheet answersheet) {
		this.answersheet = answersheet;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}