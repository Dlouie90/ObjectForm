/*
 * The Page class is used to contain an individual page of the form.
 * 
 * id: a unique identifier for the page
 * isSubmited: a boolean value that determines if that page has been submitted.
 * number: the page number of the form.
 * form: a reference to the Form object where this page belongs to
 * elements: a list of form elements that are in this page
 */

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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;

@Entity
@Table(name="pages")
public class Page implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="Page_Id")
	private Integer id;
	
	@Column(name="Page_Number")
	private Byte number;
	
	@Column(name="Description")
	private String description;
	
	@ManyToOne
	@JoinColumn(name="Form_Id")
	private Form form;
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "page_formElements",
    joinColumns=@JoinColumn(name = "page_id"),
    inverseJoinColumns=@JoinColumn(name="formElement_id"))
	@OrderBy(value="id")
	private List<FormElement> elements;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Byte getNumber() {
		return number;
	}
	public void setNumber(Byte number) {
		this.number = number;
	}
	public Form getForm() {
		return form;
	}
	public void setForm(Form form) {
		this.form = form;
	}
	public List<FormElement> getElements() {
		return elements;
	}
	public void setElements(List<FormElement> elements) {
		this.elements = elements;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}	
	
	
}
