/*
 * MultipleChoice class is used to handle radio buttons or check boxes.
 * 
 * numberOfAllowedSelect: an Integer object that tells us how many choices you are able to select
 * choiceType: determines if this object is a radio button or a check box
 * choices: a list of Choice objects from the radio button/check box.
 * 
 */
package formgenerator.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("MultipleChoice")
public class MultipleChoice extends FormElement{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "number_of_allowed_select")
	private int numberOfAllowedSelect;
	
	@Column(name = "multiple_choice_type")
	private int choiceType;
	
	@OneToMany(cascade={CascadeType.ALL})
	private List<Choice> choices;
	
	public Integer getNumberOfAllowedSelect() {
		return numberOfAllowedSelect;
	}
	public void setNumberOfAllowedSelect(Integer numberOfAllowedSelect) {
		this.numberOfAllowedSelect = numberOfAllowedSelect;
	}
	public List<Choice> getChoices() {
		return choices;
	}
	public void setChoices(List<Choice> choices) {
		this.choices = choices;
	}

	public String toString()
	{
		String s="<table border=0 cellspaccing=5>";
		s = s+"<tr><td>"+this.getTitle()+"</td><tr>";
		for(Choice c : this.choices)
		{
			s = s + "<tr><td><input type='checkbox' name='"+this.getName()+"' value='"+c.getId()+"'>"+c.getText()+"<tr><td>";
		}

		s = s + "</table><br/>";
		
		return s;
	}
}