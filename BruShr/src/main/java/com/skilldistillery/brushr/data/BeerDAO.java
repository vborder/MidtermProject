package com.skilldistillery.brushr.data;

import java.util.List;

public interface BeerDAO {
	public List<BeerRecipe> getAllBeers();
	public BeerRecipe beer getBeerById(int id);
	public List<BeerRecipe> getBeersByStyle(String style);
	public List<BeerRecipe> getBeersByNameOrDescription(String style);
	public boolean deleteBeer(int id);
	public BeerRecipe updateBeer(int id, Beer beer);
	public BeerRecipe createBeer(BeerRecipe beer);
}
