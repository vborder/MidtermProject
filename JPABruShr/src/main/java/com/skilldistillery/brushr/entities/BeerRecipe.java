package com.skilldistillery.brushr.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="beer_recipe")
public class BeerRecipe {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="beer_name")
	private String beerName;
	
	@Column(name="beer_type")
	private String beerType;
	
	private String yeast;
	
	private String description;
	
	private Boolean enabled;
	
	@Column(name="created_at")
	private LocalDateTime createdAt;
	
	@Column(name="updated_at")
	private LocalDateTime updatedAt;
	
	@Column(name="img_url")
	private String imgUrl;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToMany(mappedBy = "beer")
	private List<RecipeHops> recipeHops;
	
	@OneToMany(mappedBy = "beer")
	private List<RecipeGrain> recipeGrains;
	
	public BeerRecipe(int id, String beerName, String beerType, String yeast, String description, Boolean enabled,
			LocalDateTime createdAt, LocalDateTime updatedAt, String imgUrl, User user, List<RecipeHops> recipeHops,
			List<RecipeGrain> recipeGrains) {
		super();
		this.id = id;
		this.beerName = beerName;
		this.beerType = beerType;
		this.yeast = yeast;
		this.description = description;
		this.enabled = enabled;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.imgUrl = imgUrl;
		this.user = user;
		this.recipeHops = recipeHops;
		this.recipeGrains = recipeGrains;
	}
	
	public BeerRecipe() {
		super();
	}

	// methods
	public List<RecipeGrain> getRecipeGrains() {
		return recipeGrains;
	}
	
	public void setRecipeGrains(List<RecipeGrain> recipeGrains) {
		this.recipeGrains = recipeGrains;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBeerName() {
		return beerName;
	}

	public void setBeerName(String beerName) {
		this.beerName = beerName;
	}

	public String getBeerType() {
		return beerType;
	}

	public void setBeerType(String beerType) {
		this.beerType = beerType;
	}

	public String getYeast() {
		return yeast;
	}

	public void setYeast(String yeast) {
		this.yeast = yeast;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	
	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<RecipeHops> getRecipeHops() {
		return recipeHops;
	}

	public void setRecipeHops(List<RecipeHops> recipeHops) {
		this.recipeHops = recipeHops;
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
		BeerRecipe other = (BeerRecipe) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "BeerRecipe [id=" + id + ", beerName=" + beerName + ", beerType=" + beerType + ", yeast=" + yeast
				+ ", description=" + description + ", enabled=" + enabled + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + ", imgUrl=" + imgUrl + ", user=" + user + ", recipeHops=" + recipeHops + ", recipeGrains="
				+ recipeGrains + "]";
	}

}
