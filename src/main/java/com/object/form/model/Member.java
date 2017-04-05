/*
 * The Member java class is the class for our users that has their necessary information.
 * 
 * id: a unique identifier to differentiate between members with the same name
 * firstName: the first name of the member
 * lastName: the last name of the member
 * middleName: the middle name of the member
 * email: the email address of the member
 * address: the address object that contains where the member lives
 * passcode: an array of characters that contain the password for our member's login
 * roles: the role of the member
 */
package com.object.form.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name= "Members")
public class Member implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="Id")
	private Integer id;
	
	@Column(name="First_Name")
	private String firstName;
	
	@Column(name="Last_Name")
	private String lastName;
	
	@Column(name="Middle_Name")
	private String middleName;
	
	@Column(name="Email")
	private String email;
	
	@Column(name="Passcode", columnDefinition = "varchar(30)")
	private char[] passcode;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Address address;
			
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "member_roles",
    joinColumns=@JoinColumn(name = "member_id"),
    inverseJoinColumns=@JoinColumn(name="role_id"))
	private List<Role> roles;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}	
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public char[] getPasscode() {
		return passcode;
	}
	public void setPasscode(char[] passcode) {
		this.passcode = passcode;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}	
}
