/*
 * Textbox takes care all the standard textbox elements in the form.
 * Value: The Value of the textbox
 * defaultValue: The default value of the textbox as a string
 * maxLength: the maximum length of the textbox as an Integer object
 * size: The size of the textbox as an Integer object
 */
package formgenerator.model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("TextBox")
public class Textbox extends FormElement{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "default_value")
	private String defaultValue;
	
	@Column(name = "max_length")
	private Integer maxLength;
	
	@Column(name = "size")
	private Integer size;	
	
	public String getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
	public Integer getMaxLength() {
		return maxLength;
	}
	public void setMaxLength(Integer maxLength) {
		this.maxLength = maxLength;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
}
