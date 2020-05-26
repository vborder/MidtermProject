package com.skilldistillery.brushr.data;

import java.util.List;

import com.skilldistillery.brushr.entities.BeerRecipe;
import com.skilldistillery.brushr.entities.User;

public interface BeerDAO {
	public List<BeerRecipe> getAllBeers();
	public BeerRecipe getBeerById(int id);
	public List<BeerRecipe> getBeersByStyle(String style);
	public List<BeerRecipe> getBeersByNameOrDescription(String style);
	public boolean deleteBeer(int id, User user);
	public BeerRecipe updateBeer(int id, BeerRecipe beer);
	public BeerRecipe createBeer(BeerRecipe beer, User user);
}
