package org.partnership.post.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

@Entity
@Table(name="worktype")
public class WorkType implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Size(min=3, max=55, message="Name have to size from 3 to 55 character.")
	private String name;
	
	@ManyToMany(mappedBy="types")
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
	public List<Post> getListPost() {
		return listPost;
	}
	public void setListPost(List<Post> listPost) {
		this.listPost = listPost;
	}
	
}
