package org.partnership.category.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.partnership.employee.model.Employee;
import org.partnership.post.model.Post;

@Entity
@Table(name="category")
public class Category implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Size(min=3, max=255, message="Name have to size from 3 to 255 character.")
	private String name;
	
	@ManyToMany(mappedBy="categories")
	private List<Employee> listEmployee;

	@ManyToMany(mappedBy="categories")
	private List<Post> listPost;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Employee> getListEmployee() {
		return listEmployee;
	}

	public void setListEmployee(List<Employee> listEmployee) {
		this.listEmployee = listEmployee;
	}

	public List<Post> getListPost() {
		return listPost;
	}

	public void setListPost(List<Post> listPost) {
		this.listPost = listPost;
	}

	public Category(int id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public Category(){}
	
}
