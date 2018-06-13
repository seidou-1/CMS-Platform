/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.blogcms.controller;

import com.sg.blogcms.dto.Category;
import com.sg.blogcms.service.CategoryServiceInterface;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author darthvader
 */
@Controller
public class CategoryController {

    CategoryServiceInterface categoryService;

    @Inject
    public CategoryController(CategoryServiceInterface categoryService) {
        this.categoryService = categoryService;
    }

    @RequestMapping(value = {"/categories"}, method = RequestMethod.GET)
    public String category(Model model, HttpServletRequest request) {
        List<Category> categoryList = categoryService.getAllCategories();
        model.addAttribute("categoryList", categoryList);
        return "categories";

    }
    
//    Gets you to the addCategoryForm
    @RequestMapping(value = {"/displayAddCategoryPage"}, method = RequestMethod.GET)
    public String displayCatPage(HttpServletRequest request) {

        return "addCategory";
    }
    

    @RequestMapping(value = {"/addCategory"}, method = RequestMethod.GET)
    public String addCategory(HttpServletRequest request) {
//      get values from a form to make a new contact
        Category category = new Category();
        category.setCategoryName(request.getParameter("categoryName"));
//        category.setCategoryName("Ultimate Frisbee");
//      persist the values
        categoryService.addCategory(1, category);

        //fill correct page here
        return "addCategory";
    }

    @RequestMapping(value = {"/submitCategory"}, method = RequestMethod.GET)
    public String sumbitCategory(HttpServletRequest request, Model model) {

//      making a new category
        Category currentCategory = new Category();

//      get the informationfrom the from to set it in the new category
        currentCategory.setCategoryName(request.getParameter("categoryName"));

//      persist the values
        categoryService.addCategory(0, currentCategory);

//      go back to the blog post page
        return "redirect:/addPost";
    }

    @RequestMapping(value = {"/updateCategory"}, method = RequestMethod.POST)
    public String updateCategory(HttpServletRequest request) {

        Category cat = categoryService.getCategoryById(Integer.parseInt("category"));

        String[] categoryIds = request.getParameterValues("categoryName");

        List<Category> categoryList = new ArrayList();

        if (categoryIds != null) {
            for (String categoryId : categoryIds) {
                Category c = categoryService.getCategoryById(Integer.parseInt(categoryId));
                categoryList.add(c);
            }
        }
//        need to persist updated category from form

        return "redirect:?addPost";

    }
    
    
//    @RequestMapping(value = {"/updateCategory"}, method = RequestMethod.POST)
//    public String updateCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
//
//        if (result.hasErrors()) {
//            return "editPost";
//        }
//
//        postServiceInterface.updatePost(0, post); //Update this method to replace the first parameter with userId
//
//        return "redirect:?addPost";
//    }

    @RequestMapping(value = {"/deleteCategory"}, method = RequestMethod.GET)
    public String deleteCategory(HttpServletRequest request) {
        categoryService.deleteCategory(0, 0);
//        categoryDao.deleteCategory(Integer.parseInt(request.getParameter("categoryId")));
        return "redirect:categories";
    }

}
