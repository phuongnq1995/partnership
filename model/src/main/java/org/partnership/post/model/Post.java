package org.partnership.post.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Future;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.partnership.category.model.Category;
import org.partnership.company.model.Company;
import org.partnership.location.model.Location;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="post")
public class Post implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@Size(min=3, max=100, message="Title have to size from 3 to 100 character.")
	private String title;
	
	@NotEmpty
	private String position;
	
	@Email
	@NotEmpty
	@Column(name="email_apply")
	private String emailApply;
	
	@ManyToOne
	@JoinColumn(name = "company_id")
	@NotNull(message = "Company can not be empty.")
	private Company company;
	
	@ManyToOne
	@JoinColumn(name = "level_id")
	@NotNull(message = "Level can not be empty.")
	private Level level;
	
	@ManyToMany
	@JoinTable(name = "post_location", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "location_id"))
	@NotNull(message = "Location can not be empty.")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Location> locations;
	
	@ManyToMany
	@JoinTable(name = "post_category", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
	@NotNull(message = "Category can not be empty.")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Category> categories;
	
	@ManyToMany
	@JoinTable(name = "post_type", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "type_id"))
	@NotNull(message = "Types can not be empty.")
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<WorkType> types;
	
	private long minsalary;
	
	private long maxsalary;
	
	@Size(max = 1450, message = "Description have to max size 1450 character.")
	private String description;
	
	@Size(max = 1450, message = "Requirement have to max size 1450 character.")
	private String requirement;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date daypost;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	@Future
	private Date dayend;
	
	@Min(0)@Max(3)
	private int status;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Level getLevel() {
		return level;
	}

	public void setLevel(Level level) {
		this.level = level;
	}

	public List<Location> getLocations() {
		return locations;
	}

	public void setLocations(List<Location> locations) {
		this.locations = locations;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<WorkType> getTypes() {
		return types;
	}

	public void setTypes(List<WorkType> types) {
		this.types = types;
	}

	public long getMinsalary() {
		return minsalary;
	}

	public void setMinsalary(long minsalary) {
		this.minsalary = minsalary;
	}

	public long getMaxsalary() {
		return maxsalary;
	}

	public void setMaxsalary(long maxsalary) {
		this.maxsalary = maxsalary;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getRequirement() {
		return requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	public Date getDaypost() {
		return daypost;
	}

	public void setDaypost(Date daypost) {
		this.daypost = daypost;
	}

	public Date getDayend() {
		return dayend;
	}

	public void setDayend(Date dayend) {
		this.dayend = dayend;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
