package org.partnership.category.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
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
	
	@ManyToOne
	@JoinColumn(name="parent_id", nullable=true)
	private Category parent;
	
	@OneToMany(mappedBy="parent")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Category> children;
	
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
	
	
	public Category getParent() {
		return parent;
	}

	public void setParent(Category parent) {
		this.parent = parent;
	}

	public List<Category> getChildren() {
		return children;
	}

	public void setChildren(List<Category> children) {
		this.children = children;
	}

	public Category(){}
	
}
