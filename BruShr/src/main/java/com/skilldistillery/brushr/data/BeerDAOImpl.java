package com.skilldistillery.brushr.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.brushr.entities.BeerRecipe;

@Service
@Transactional
public class BeerDAOImpl implements BeerDAO{
	
	

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<BeerRecipe> getAllBeers(){
		String jpql = " SELECT beer FROM BeerRecipe beer";
		
		List<BeerRecipe> listOfBeers = em.createQuery(jpql, BeerRecipe.class).getResultList();
	
		return listOfBeers;
	}

	@Override
	public BeerRecipe getBeerById(int id) {
		return em.find(BeerRecipe.class, id);
		
	}

	@Override
	public List<BeerRecipe> getBeersByStyle(String style) {
		String jpql = "SELECT b from BeerRecipe WHERE b.type LIKE :style";
		List<BeerRecipe> recipes = em.createQuery(jpql, BeerRecipe.class)
				.setParameter("style", "%"+ style+ "%").getResultList();
		return recipes;
	}

	@Override
	public List<BeerRecipe> getBeersByNameOrDescription(String style) {
		String jpql = "SELECT b from BeerRecipe WHERE b.name LIKE :style";
		List<BeerRecipe> recipes = em.createQuery(jpql, BeerRecipe.class)
				.setParameter("style", "%"+ style+ "%").getResultList();
		return recipes;
	}

	@Override
	public boolean deleteBeer(int id) {
		boolean deletedBeer = false;
		BeerRecipe b = em.find(BeerRecipe.class, id);
		em.remove(b);
		em.flush();
		em.close();
		
		return !(em.contains(b));
	}

	@Override
	public BeerRecipe updateBeer(int id, BeerRecipe beer) {
		BeerRecipe b = em.find(BeerRecipe.class, id);
		
		b.setId(id);
		b.setBeerName(beer.getBeerName());
		b.setBeerType(beer.getBeerType());
		b.setYeast(beer.getYeast());
		b.setDescription(beer.getDescription());
		b.setEnabled(beer.getEnabled());
		b.setCreatedAt(beer.getCreatedAt());
		b.setUpdatedAt(beer.getUpdatedAt());
		b.setImgUrl(beer.getImgUrl());
		
		
		em.flush();
		em.close();
		return b;
	}

	@Override
	public BeerRecipe createBeer(BeerRecipe beer) {
		
		em.persist(beer);
		em.flush();
		em.close();
		return beer;
	}


	
	
	
	
	
}
