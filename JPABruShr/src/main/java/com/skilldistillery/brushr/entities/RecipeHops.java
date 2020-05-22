package com.skilldistillery.brushr.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="recipe_hops")
public class RecipeHops {
	
	@EmbeddedId
	private RecipeHopsId id;
	
	@Column(name="hops_amount")
	private String hopsAmount;
	
	@ManyToOne
	@JoinColumn(name="beer_id")
	@MapsId(value="beerRecipe")
	private BeerRecipe beer;
	
	@ManyToOne
	@JoinColumn(name="hops_id")
	@MapsId(value="hops")
	private Hops hops;
	
	public RecipeHops(RecipeHopsId id, String hopsAmount) {
		super();
		this.id = id;
		this.hopsAmount = hopsAmount;
	}
	
	public RecipeHops() {
		super();
	}
	
	public RecipeHopsId getId() {
		return id;
	}

	public void setId(RecipeHopsId id) {
		this.id = id;
	}

	public String getHopsAmount() {
		return hopsAmount;
	}

	public void setHopsAmount(String hopsAmount) {
		this.hopsAmount = hopsAmount;
	}
	
	public BeerRecipe getBeer() {
		return beer;
	}

	public void setBeer(BeerRecipe beer) {
		this.beer = beer;
	}

	public Hops getHops() {
		return hops;
	}

	public void setHops(Hops hops) {
		this.hops = hops;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((hopsAmount == null) ? 0 : hopsAmount.hashCode());
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
		RecipeHops other = (RecipeHops) obj;
		if (hopsAmount == null) {
			if (other.hopsAmount != null)
				return false;
		} else if (!hopsAmount.equals(other.hopsAmount))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "RecipeHops [id=" + id + ", hopsAmount=" + hopsAmount + "]";
	}

}
