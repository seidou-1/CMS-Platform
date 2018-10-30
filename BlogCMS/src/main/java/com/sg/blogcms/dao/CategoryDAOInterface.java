/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Category;
import java.util.List;

/**
 *
 * @author laptop
 */
public interface CategoryDAOInterface {
    
    public Category addCategory (Category category);
    
    public Category updateCategory (Category category);
    
    public void deleteCategory (int categoryId);
    
    public Category getCategoryById (int categoryId);
    
    public List <Category> getAllCategories();

    public List<Category> getCategoryByUser(int userId);
    
}
