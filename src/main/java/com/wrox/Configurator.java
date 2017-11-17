package com.wrox;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class Configurator implements ServletContextListener {
  @Override
  public void contextInitialized(ServletContextEvent sce) {
    ServletContext context = sce.getServletContext();
    
    FilterRegistration.Dynamic registration = context.addFilter("authenticationFilter", new AuthenticationFilter());
    registration.setAsyncSupported(true);
    registration.addMappingForUrlPatterns(null, false, "/tickets", "/chat", "/sessions");
  }

  @Override
  public void contextDestroyed(ServletContextEvent sce) { }
}