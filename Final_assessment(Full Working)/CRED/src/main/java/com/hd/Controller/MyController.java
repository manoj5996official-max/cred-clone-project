package com.hd.Controller;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.hd.model.Mymodel;
import com.zaxxer.hikari.HikariDataSource;


@Controller
public class MyController 
{
	public JdbcTemplate Jdbctemplate;
	
	@Autowired
	public void setJdbctemplate(HikariDataSource Datasource){
		Jdbctemplate = new JdbcTemplate(Datasource);
	}
	
	@Autowired
	public Mymodel md;
	
	
	@RequestMapping(value = {"/First_Page","/"}, method = RequestMethod.GET)
    public ModelAndView showFirst_Page(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
    	ModelAndView mv = new ModelAndView();
 
    	mv.setViewName("First_Page");
        return mv;
	}
	
	
	@RequestMapping(value = {"/Second_page"}, method = RequestMethod.GET)
    public ModelAndView showSecond_page(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
    	ModelAndView mv = new ModelAndView();
 
    	mv.setViewName("Second_page");
        return mv;
	}
	
	
	@RequestMapping(value = "/Firstt_page", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	   public @ResponseBody String Test_Service(@RequestBody String Message, HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException
	   {
	    JsonObject two = new JsonObject();
	    //Mymodel md = new Mymodel();
	    System.out.println(Message);
	        md.a(Message);
	    return two.toString();
	   }
	
	
	@RequestMapping(value = "/view", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody String view(HttpServletRequest request,HttpServletResponse response, HttpSession session) throws IOException 
    {
    	JsonObject details = new JsonObject();
    	details = md.view();
    	return details.toString();
    }
	
	
	
}
	   




