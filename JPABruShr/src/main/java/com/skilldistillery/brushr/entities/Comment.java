package com.skilldistillery.brushr.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="updated_at")
	private LocalDateTime updatedAt;
	
	@Column(name="created_at")
	private LocalDateTime createdAt;
	
	private Boolean enabled;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BeerRecipe getBeer() {
		return beer;
	}

	public void setBeer(BeerRecipe beer) {
		this.beer = beer;
	}

	private String content;
	
	private int rating;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="beer_id")
	private BeerRecipe beer;


	public Comment(int id, LocalDateTime updatedAt, LocalDateTime createdAt, Boolean enabled, String content,
			int rating, User user, BeerRecipe beer) {
		super();
		this.id = id;
		this.updatedAt = updatedAt;
		this.createdAt = createdAt;
		this.enabled = enabled;
		this.content = content;
		this.rating = rating;
		this.user = user;
		this.beer = beer;
	}

	public Comment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
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
		Comment other = (Comment) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", updatedAt=" + updatedAt + ", createdAt=" + createdAt + ", enabled=" + enabled
				+ ", content=" + content + ", rating=" + rating + ", user=" + user + ", beer=" + beer + "]";
	}
	
}
