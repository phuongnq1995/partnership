package org.partnership.employee.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.partnership.location.model.Location;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="employee")
public class Employee implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@Size(min=3, max=255, message="Name have to size from 3 to 255 character.")
	private String fullname;
	
	@DateTimeFormat(pattern="dd-MMM-yyyy")
	private Date birthday;
	
	@Pattern(regexp = "[0-9]{11}")
	private String phone;
	
	@Lob
	private byte[] avatar;
	
	@Size(max=1450, message="Description have to size from 10 to 1450 character.")
	private String description;
	
	@Lob
	private byte[] cv;
	
	@ManyToOne
	@JoinColumn(name="location_id", nullable = false)
	private Location location;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public byte[] getAvatar() {
		return avatar;
	}

	public void setAvatar(byte[] avatar) {
		this.avatar = avatar;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getCv() {
		return cv;
	}

	public void setCv(byte[] cv) {
		this.cv = cv;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}
	
}
