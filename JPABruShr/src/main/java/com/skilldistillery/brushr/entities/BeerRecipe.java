package com.skilldistillery.brushr.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
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
	
	@Column(name="user_id")
	private int userId;

	public BeerRecipe(int id, String beerName, String beerType, String yeast, String description, boolean enabled,
			LocalDateTime createdAt, LocalDateTime updatedAt, String imgUrl, int userId) {
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
		this.userId = userId;
	}

	public BeerRecipe() {
		super();
	}
	
	// methods
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "BeerRecipe [id=" + id + ", beerName=" + beerName + ", beerType=" + beerType + ", yeast=" + yeast
				+ ", description=" + description + ", enabled=" + enabled + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + ", imgUrl=" + imgUrl + ", userId=" + userId + "]";
	}
}
