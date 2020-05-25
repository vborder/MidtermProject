package com.skilldistillery.brushr.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale.Category;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY )
	private int id;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;

	private String password;
	
	private Boolean enabled;
	
	private String role;
	
	@Column(name="user_email")
	private String email;
	
	@Column(name="created_at")
	private LocalDateTime createdAt;
	
	@Column(name="updated_at")
	private LocalDateTime updatedAt;
	
	@Column(name="login_name")
	private String loginName;
	
	@OneToMany(mappedBy="user", cascade=CascadeType.PERSIST , fetch=FetchType.EAGER)
	private List<BeerRecipe> beers;

	public User() {
		super();
		
	}
	
	public User(int id, String firstName, String lastName, String password, Boolean enabled, String role,
			LocalDateTime createdAt, LocalDateTime updatedAt, String loginName, List<BeerRecipe> beers) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.password = password;
		this.enabled = enabled;
		this.role = role;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.loginName = loginName;
		this.beers = beers;
	}

	
	
	public List<BeerRecipe> getBeers() {
		return beers;
	}

	public void setBeers(List<BeerRecipe> beers) {
		this.beers = beers;
	}

	// methods
	public int getId() {
		return id;
	}

	public void setId(int id) {
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
	public void addBeer(BeerRecipe beerRecipe) {
		if (beers == null) {
			beers = new ArrayList<>();
		}
		if (!beers.contains(beerRecipe)) {
			beers.add(beerRecipe);
			beerRecipe.addUser(this);
		}
	}
	public void deleteBeer(BeerRecipe beerRecipe) {
		if (beers != null && beers.contains(beerRecipe)) {
			beers.remove(beerRecipe);
			beerRecipe.deleteUser(this);
		}
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", password=" + password
				+ ", enabled=" + enabled + ", role=" + role + ", createdAt=" + createdAt + ", updatedAt=" + updatedAt
				+ ", loginName=" + loginName + "]";
	}
	
}
