/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms;

import com.sg.blogcms.dao.CategoryDAOInterface;
import com.sg.blogcms.dto.Category;
import javax.inject.Inject;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author darthvader
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/test-applicationContext.xml"})
//Rollback - when each test is complete, roll back all the changes performed
@Rollback
//Transactional - keeps all the tests in one transaction so it can roll back the entire test as one transaction
@Transactional

public class CategoryDAOUnitTest {

    @Inject
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
    }

    @Test
    public void createCategoryTest() {

        //Arrange
        Category testCategory1 = createCategory();

        //Act
        testCategory1 = categoryDao.addCategory(testCategory1);

        //Assert
        //this is to make sure that there is an ID to get back, so it persiste
        assert testCategory1.getCategoryId() != 0;
    }

    @Test
    public void testGetCategoryById() {

        //Arrange
        Category testCategory1 = createCategory();

        //Act
        Category testCategoryId = categoryDao.getCategoryById(testCategory1.getCategoryId());

        //Assert
        assert testCategoryId.getCategoryId() == testCategory1.getCategoryId();
    }

    @Test
    public void testDeleteCategory() {

        //Arrange
        Category testCategory1 = createCategory();

        //Act
        categoryDao.deleteCategory(testCategory1.getCategoryId());

        //Assert
        assert categoryDao.getCategoryById(testCategory1.getCategoryId()) == null;
    }

    @Test
    public void testUpdateCategory() {

        //Arrange
        Category testCategory1 = createCategory();

        //Act
        testCategory1.setCategoryName("Lottery");
        categoryDao.updateCategory(testCategory1);
        Category updatedCategory = categoryDao.getCategoryById(testCategory1.getCategoryId());

        //Assert
        assert updatedCategory.getCategoryName().equals("Lottery");
    }

    @After
    public void tearDown() {
    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
    private Category createCategory() {
        Category testCategory1 = new Category();
        testCategory1.setCategoryName("skydiving");
        testCategory1 = categoryDao.addCategory(testCategory1);

        return testCategory1;

    }
}
