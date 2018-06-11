/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms;

import com.sg.blogcms.dao.CategoryDAOInterface;
import com.sg.blogcms.dto.Category;
import java.util.List;
import org.junit.After;
import org.junit.AfterClass;
import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 *
 * @author darthvader
 */
public class CategoryDAOUnitTest {

    private CategoryDAOInterface categoryDao;

    public CategoryDAOUnitTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");

        categoryDao = ctx.getBean("categoryDao", CategoryDAOInterface.class);

        //Selects and clears all Categopry data
        List<Category> categories = categoryDao.getAllCategories();
        for (Category currentCategory : categories) {
            categoryDao.deleteCategory(currentCategory.getCategoryId());
        }
    }
    
    @Test
    public void addGetdeleteCategory() {
        //add a new category
        Category testCategory1 = new Category();
        testCategory1.setCategoryName("Skydiving");
        categoryDao.addCategory(testCategory1);

        Category testCategory2 = new Category();
        testCategory1.setCategoryName("PaintBall");
        categoryDao.addCategory(testCategory2);

        Category testCategory3 = new Category();
        testCategory1.setCategoryName("Magic");
        categoryDao.addCategory(testCategory3);

        //retrieve a category
        Category categoryIdFromDB = categoryDao.getCategoryById(testCategory1.getCategoryId());
        assertEquals(categoryIdFromDB, testCategory1);

        //Detele category test and get all categories test
        categoryDao.deleteCategory(testCategory1.getCategoryId());
        List<Category> categories = categoryDao.getAllCategories();
        assertEquals(categories.size(), 2);
    }

    @Test
    public void addGetUpdate() {
        //add a new category
        Category testCategory1 = new Category();
        testCategory1.setCategoryName("Skydiving");
        categoryDao.addCategory(testCategory1);
        
        //Get the category just created
        Category categoryIdFromDB = categoryDao.getCategoryById(testCategory1.getCategoryId());
        assertEquals(categoryIdFromDB, testCategory1);
        
        //Change the name of the category
        testCategory1.setCategoryName("Rollercoaster");
        
        //Call the method
        categoryDao.updateCategory(testCategory1);
        
        assertEquals(testCategory1.getCategoryName(), "Rollercoaster");
    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
