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
			assertEquals("admin", beerRecipe.getId());
			assertEquals("admin", beerRecipe.getBeerName());
			assertEquals("admin", beerRecipe.getBeerType());
			assertEquals("admin", beerRecipe.getYeast());
			assertEquals("admin", beerRecipe.getDescription());
			assertTrue( beerRecipe.isEnabled());
//			assertEquals("admin", beerRecipe.getCreatedAt());
//			assertEquals("admin", beerRecipe.getUpdatedAt());
//			assertEquals("admin", beerRecipe.getImgUrl());
			assertEquals("admin", beerRecipe.getUserId());
		}

}
