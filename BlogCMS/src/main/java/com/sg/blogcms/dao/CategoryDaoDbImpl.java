/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.dao;

import com.sg.blogcms.dto.Category;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author darthvader
 */
public class CategoryDaoDbImpl implements CategoryDAOInterface {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
//    ==============PREPARED STATEMENTS============

    private static final String SQL_INSERT_CATEGORIES = 
            "INSERT INTO `CATEGORIES` (CategoryName) VALUES (?)";
    
    private static final String SQL_DELETE_CATEGORIES =
            "DELETE FROM `CATEGORIES` WHERE CategoryId = ?";
    
    private static final String SQL_UPDATE_CATEGORIES = 
            "UPDATE `CATEGORIES` SET CategoryName = ?"
            + " WHERE CategoryId = ?";
    
    private static final String SQL_SELECT_CATEGORIES =
            "SELECT * FROM `CATEGORIES` WHERE CategoryId = ?";
    
    private static final String SQL_SELECT_ALL_CATEGORIES = 
            "SELECT * FROM `CATEGORIES` ";
    
    
//    ==========METHODS==============
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Category addCategory(Category category) {
        jdbcTemplate.update(SQL_INSERT_CATEGORIES,
        category.getCategoryName());
        
//        this gets queries the database for the new ID that was just set to the row
        int newID = jdbcTemplate.queryForObject("select LAST_INSERT_ID()", Integer.class);        
//        this gets that ID and sets it to the specic category
        category.setCategoryId(newID);
        return category;
    }

    @Override
    public Category updateCategory(Category category) {
        jdbcTemplate.update(SQL_UPDATE_CATEGORIES,
                category.getCategoryName(),
                category.getCategoryId());
        return category;
    }

    @Override
    public void deleteCategory(int categoryId) {
        jdbcTemplate.update(SQL_DELETE_CATEGORIES, categoryId);
    }

    @Override
    public Category getCategoryById(int categoryId) {
        try{
            return jdbcTemplate.queryForObject(SQL_SELECT_CATEGORIES, new CategoryMapper(), categoryId);
        }catch (EmptyResultDataAccessException ex){
            return null;
        }
    }

    @Override
    public List<Category> getAllCategories() {
        return jdbcTemplate.query(SQL_SELECT_ALL_CATEGORIES, new CategoryMapper());
    }
    
//    ====================MAPPER=========
    private static final class CategoryMapper implements RowMapper<Category>{
        
        @Override
        public Category mapRow(ResultSet rs , int rowNum) throws SQLException{
            Category category = new Category();
            category.setCategoryId(rs.getInt("CategoryID"));
            category.setCategoryName(rs.getString("CategoryName"));
            return category;
        }
        
    }

}
