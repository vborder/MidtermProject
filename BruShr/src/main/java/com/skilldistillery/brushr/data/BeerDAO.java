package com.skilldistillery.brushr.data;

import java.util.List;

public interface BeerDAO {
	public List<Beer> getAllBeers();
	public Beer beer getBeerById(int id);
	public List<Beer> getBeersByStyle(String style);
	public List<Beer> getBeersByNameOrDescription(String style);
	public boolean deleteBeer(int id);
	public Beer updateBeer(int id, Beer beer);
	public Beer createBeer(Beer beer);
}
