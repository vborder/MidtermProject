package com.skilldistillery.brushr.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class RecipeHopsTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeHops rHops;
		
		
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
			RecipeHopsId rid = new RecipeHopsId();
			rid.setHopsId(1);
			rid.setBeerRecipeId(1);
			rHops = em.find(RecipeHops.class, rid);
			
		}

		@AfterEach
		void tearDown() throws Exception {
			em.close();
			rHops=null;
		}
		
		@Test
		void test1() {
			assertNotNull(rHops);
			assertEquals("alot", rHops.getHopsAmount());
			
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
			assertNotNull(rHops);
//			assertEquals(1, rHops.getBeer().size());
			
		}

}
