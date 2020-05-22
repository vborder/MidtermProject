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
import org.junit.jupiter.api.Test;

public class RecipeGrainTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeGrain grain;
		
		
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
			RecipeGrainId gid = new RecipeGrainId();
			gid.setGrainId(1);
			gid.setBeerRecipeId(1);
			grain = em.find(RecipeGrain.class, gid);
			
		}

		@AfterEach
		void tearDown() throws Exception {
			em.close();
			grain=null;
		}
		
		@Test
		void test() {
			assertNotNull(grain);
			assertEquals("alot", grain.getGrainAmount());
		}

}
