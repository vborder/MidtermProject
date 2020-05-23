package com.skilldistillery.brushr.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class BeerRecipeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private BeerRecipe beerRecipe;
		
		
		@BeforeAll
		static void setUpBeforeClass() throws Exception {
			emf = Persistence.createEntityManagerFactory("BruShrPU");
		}

		@AfterAll
		static void tearDownAfterClass() throws Exception {
			emf.close();
		}

		@BeforeEach
		void setUp() throws Exception {
			em = emf.createEntityManager();
			beerRecipe = em.find(BeerRecipe.class, 1);
		}

		@AfterEach
		void tearDown() throws Exception {
			em.close();
			beerRecipe = null;
		}

		@Test
		void test() {
			assertNotNull(beerRecipe);
			assertEquals(1, beerRecipe.getId());
			assertEquals("good beer", beerRecipe.getBeerName());
			assertEquals("IPA", beerRecipe.getBeerType());
			assertEquals("yeasty yeast", beerRecipe.getYeast());
			assertEquals("very yeasty", beerRecipe.getDescription());
			assertTrue(beerRecipe.isEnabled());
//			assertEquals("admin", beerRecipe.getCreatedAt());
//			assertEquals("admin", beerRecipe.getUpdatedAt());
//			assertEquals("admin", beerRecipe.getImgUrl());
		}
		
		@Test
		@DisplayName("test beer association")
		void test2() {
			/*SELECT beer_recipe.id, beer_recipe.beer_name FROM beer_recipe 
  			JOIN recipe_hops on beer_recipe.id = recipe_hops.hops_id
    		WHERE recipe_hops.hops_id = 1;
			+----+-----------+
			| id | beer_name |
			+----+-----------+
			|  1 | good beer |
			+----+-----------+*/
			assertNotNull(beerRecipe);
			assertEquals(1, beerRecipe.getRecipeHops().size());
			
		}

}
