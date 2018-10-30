/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.service;

import com.sg.blogcms.dto.Category;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface CategoryServiceInterface {
 
    public Category addCategory (int loginUserId, Category category);
    
    public Category updateCategory (int loginUserId, Category category);
    
    public void deleteCategory (int loginUserId, int categoryId);
    
    public Category getCategoryById (int categoryId);
    
    public List <Category> getAllCategories();

    public List<Category> getCategoriesByUser(int userId);
    
}
