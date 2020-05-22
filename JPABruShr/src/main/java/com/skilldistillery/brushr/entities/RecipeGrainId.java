package com.skilldistillery.brushr.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RecipeGrainId implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name="grain_id")
	private int grainId;
	
	@Column(name="beer_id")
	private int beerRecipeId;

	public RecipeGrainId(int grainId, int beerRecipeId) {
		super();
		this.grainId = grainId;
		this.beerRecipeId = beerRecipeId;
	}

	public RecipeGrainId() {
		super();
	}

	public int getGrainId() {
		return grainId;
	}

	public void setGrainId(int grainId) {
		this.grainId = grainId;
	}

	public int getBeerRecipeId() {
		return beerRecipeId;
	}

	public void setBeerRecipeId(int beerId) {
		this.beerRecipeId = beerId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + beerRecipeId;
		result = prime * result + grainId;
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
		RecipeGrainId other = (RecipeGrainId) obj;
		if (beerRecipeId != other.beerRecipeId)
			return false;
		if (grainId != other.grainId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RecipeGrainId [grainId=" + grainId + ", beerId=" + beerRecipeId + "]";
	}

}
