/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dao.CategoryDAOInterface;
import com.sg.blogcms.dto.Category;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author darthvader
 */
public class CategoryServiceImpl implements CategoryServiceInterface {

    CategoryDAOInterface categoryDao;

    @Inject
    public CategoryServiceImpl(CategoryDAOInterface categoryDao){
        this.categoryDao = categoryDao;
    }

    @Override
    public Category addCategory(int loginUserId, Category category) {
        return categoryDao.addCategory(category);
    }

    @Override
    public Category updateCategory(int loginUserId, Category category) {
        return categoryDao.updateCategory(category);
    }

    @Override
    public void deleteCategory(int loginUserId, int categoryId) {
        categoryDao.deleteCategory(categoryId);
    }

    @Override
    public Category getCategoryById(int categoryId) {
        return categoryDao.getCategoryById(categoryId);
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryDao.getAllCategories();
    }
}
