/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.controller;

import com.sg.blogcms.dao.CategoryDAOInterface;
import com.sg.blogcms.dto.Category;
import java.util.List;
import javax.inject.Inject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author darthvader
 */
@CrossOrigin
@Controller
public class RESTController {

    private CategoryDAOInterface categoryDao;

    @Inject
    public RESTController(CategoryDAOInterface categoryDao) {
        this.categoryDao = categoryDao;
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Category getCategory(@PathVariable("id") int id) {
        return categoryDao.getCategoryById(id);
    }

    @RequestMapping(value = "/category", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    @ResponseBody
    public Category createCategory(@RequestBody Category category) {
        return categoryDao.addCategory(category);
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void deleteCategory(@PathVariable("id") int id) {
        categoryDao.deleteCategory(id);
    }

    @RequestMapping(value = "/category/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void updateContact(@PathVariable("id") int id, @RequestBody Category category) {
        // favor the path variable over the id in the object if they differ
        category.setCategoryId(id);
        categoryDao.updateCategory(category);
    }

    @RequestMapping(value = "/categories", method = RequestMethod.GET)
    @ResponseBody
    public List<Category> getAllCategories() {
        return categoryDao.getAllCategories();
    }

}
