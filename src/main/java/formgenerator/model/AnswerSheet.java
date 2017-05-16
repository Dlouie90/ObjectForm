package formgenerator.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "answersheet")
public class AnswerSheet implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	@Column(name = "id")
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "page_id")
	private Page page;
	
	@OneToMany(mappedBy = "answersheet", cascade = CascadeType.ALL)
	private List<Answer> answers;
	
	@ManyToOne
	@JoinColumn(name = "member_id")
	private Member member;

	public AnswerSheet() {
		
	}
	
	public AnswerSheet(Page p, Member m) {
		this.page = p;
		this.member = m;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	

}
