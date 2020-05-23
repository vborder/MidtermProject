package com.skilldistillery.brushr.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RecipeHopsId implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="beer_id")
	private int beerRecipeId;
	
	@Column(name="hops_id")
	private int hopsId;

	public RecipeHopsId(int beerRecipeId, int hopsId) {
		super();
		this.beerRecipeId = beerRecipeId;
		this.hopsId = hopsId;
	}

	public RecipeHopsId() {
		super();
	}

	public int getBeerRecipeId() {
		return beerRecipeId;
	}

	public void setBeerRecipeId(int beerRecipeId) {
		this.beerRecipeId = beerRecipeId;
	}

	public int getHopsId() {
		return hopsId;
	}

	public void setHopsId(int userId) {
		this.hopsId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + beerRecipeId;
		result = prime * result + hopsId;
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
		RecipeHopsId other = (RecipeHopsId) obj;
		if (beerRecipeId != other.beerRecipeId)
			return false;
		if (hopsId != other.hopsId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "FavoritesId [beerRecipeId=" + beerRecipeId + ", userId=" + hopsId + "]";
	}
	
	

}
