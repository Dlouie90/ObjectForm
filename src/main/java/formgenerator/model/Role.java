/*
 * The Role class serves as a way to distinguish between regular members and administrators.
 * 
 * id: a unique identifier for the role
 * name: the name of the role.
 */

package formgenerator.model;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Roles")
public class Role implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)  
	@Column(name="Role_Id")
	private Integer id;
	
	@Column(name="Name",nullable = false)
	private String name;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name.replace(",", "");
	}
	
	public static Map<String, String> getRoles(){
		Map<String, String> roles = null;
		
		if(roles == null){
			roles = new HashMap<>();		
			roles.put("Admin", "Administrator");
			roles.put("Staff", "Staff");
			roles.put("User", "Regular User");
		}
		
		return roles;
	}
}
