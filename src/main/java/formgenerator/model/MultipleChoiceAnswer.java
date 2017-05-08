package formgenerator.model;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

@Entity
@DiscriminatorValue("MultipleChoice")
public class MultipleChoiceAnswer extends Answer{
	
	private static final long serialVersionUID = 1L;
	
	@OneToOne
	private Choice choice;

	public Choice getChoice() {
		return choice;
	}

	public void setChoice(Choice choice) {
		this.choice = choice;
	}
}