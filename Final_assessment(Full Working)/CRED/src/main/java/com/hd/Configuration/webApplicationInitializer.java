package com.hd.Configuration;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class webApplicationInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null;  
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { webConfiguration.class };  
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }
}
