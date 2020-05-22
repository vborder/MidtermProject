package com.skilldistillery.brushr.entities;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="recipe_grain")
public class RecipeGrain {
	
	@EmbeddedId
	private RecipeGrainId id;
	
	@Column(name="grain_amount")
	private String grainAmount;
	
	@ManyToOne
	@JoinColumn(name="beer_id")
	@MapsId(value="beerRecipe")
	private BeerRecipe beer;
	
	@ManyToOne
	@JoinColumn(name="grain_id")
	@MapsId(value="grain")
	private Grain grain;

	public RecipeGrain(RecipeGrainId id, String grainAmount) {
		super();
		this.id = id;
		this.grainAmount = grainAmount;
	}
	
	public RecipeGrain() {
		super();
	}
	
	public BeerRecipe getBeer() {
		return beer;
	}

	public void setBeer(BeerRecipe beer) {
		this.beer = beer;
	}

	public Grain getGrain() {
		return grain;
	}

	public void setGrain(Grain grain) {
		this.grain = grain;
	}

	public RecipeGrainId getId() {
		return id;
	}

	public void setId(RecipeGrainId id) {
		this.id = id;
	}

	public String getGrainAmount() {
		return grainAmount;
	}

	public void setGrainAmount(String grainAmount) {
		this.grainAmount = grainAmount;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
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
		RecipeGrain other = (RecipeGrain) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RecipeGrain [id=" + id + ", grainAmount=" + grainAmount + ", beer=" + beer + ", grain=" + grain + "]";
	}
	
}
