# Project Sample Spring MVC with Tiles Template

**Dependecies**   
```xml
		<!-- Tiles -->
		<dependency>
			<groupId>org.apache.tiles</groupId>
			<artifactId>tiles-api</artifactId>
			<version>3.0.5</version>
		</dependency>
		<dependency>
			<groupId>org.apache.tiles</groupId>
			<artifactId>tiles-core</artifactId>
			<version>3.0.5</version>
			<exclusions>
				<exclusion>
					<groupId>org.slf4j</groupId>
					<artifactId>jcl-over-slf4j</artifactId>
				</exclusion>
			</exclusions>
		</dependency>
		<dependency>
			<groupId>org.apache.tiles</groupId>
			<artifactId>tiles-jsp</artifactId>
			<version>3.0.5</version>
		</dependency>
		<dependency>
			<groupId>org.apache.tiles</groupId>
			<artifactId>tiles-servlet</artifactId>
			<version>3.0.5</version>
		</dependency>
		<dependency>
			<groupId>org.apache.tiles</groupId>
			<artifactId>tiles-template</artifactId>
			<version>3.0.5</version>
		</dependency>
		<!-- http://mvnrepository.com/artifact/org.apache.tiles/tiles-request-api -->
		<dependency>
			<groupId>org.apache.tiles</groupId>
			<artifactId>tiles-request-api</artifactId>
			<version>1.0.6</version>
		</dependency>
		<!-- http://mvnrepository.com/artifact/commons-digester/commons-digester -->
		<dependency>
			<groupId>commons-digester</groupId>
			<artifactId>commons-digester</artifactId>
			<version>2.1</version>
		</dependency>
		<!-- http://mvnrepository.com/artifact/commons-beanutils/commons-beanutils -->
		<dependency>
			<groupId>commons-beanutils</groupId>
			<artifactId>commons-beanutils</artifactId>
			<version>1.9.2</version>
		</dependency>
```   

**Spring Context Configuration**   
```xml
    <!-- ... -->
    <beans:bean class="org.springframework.web.servlet.view.ContentNegotiatingViewResolver">
        <beans:property name="viewResolvers">
            <beans:list>
                <beans:bean class="org.springframework.web.servlet.view.UrlBasedViewResolver">
                    <beans:property name="viewClass" value="org.springframework.web.servlet.view.tiles3.TilesView"/>
                </beans:bean>
                <beans:bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
                    <beans:property name="prefix" value="/"/>
                </beans:bean>
            </beans:list>
        </beans:property>
    </beans:bean>
    
    <beans:bean id="tilesConfigurer" class="org.springframework.web.servlet.view.tiles3.TilesConfigurer">
        <beans:property name="definitions">
            <beans:list>
                <beans:value>/WEB-INF/tiles.xml</beans:value>
            </beans:list>
        </beans:property>
        <beans:property name="preparerFactoryClass" value="org.springframework.web.servlet.view.tiles3.SpringBeanPreparerFactory"/>
    </beans:bean>	 
    <!-- ... -->
```   

**tiles.xml**   
```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE tiles-definitions PUBLIC "-//Apache Software Foundation//DTD Tiles Configuration 2.1//EN"
        "http://tiles.apache.org/dtds/tiles-config_2_1.dtd">
<tiles-definitions>

    <!-- Master -->
    <definition name="master.page" template="/WEB-INF/views/template/master.jsp">
        <put-attribute name="header" value="/WEB-INF/views/template/header.jsp"/>
        <put-attribute name="footer" value="/WEB-INF/views/template/footer.jsp"/>
    </definition>

    <!--  Pages -->
    <definition name="index" extends="master.page">
        <put-attribute name="body" value="/WEB-INF/views/index.jsp"/>
    </definition>
    <definition name="login" extends="master.page">
        <put-attribute name="header" value=""/>
        <put-attribute name="body" value="/WEB-INF/views/login.jsp"/>
    </definition>
</tiles-definitions>
```   

**master.jsp**   
```html
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html lang="pt-BR">
<head>
    <title>Welcome Tiles</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
		<link href="<c:url value='/resources/css/sticky-footer.css' />" rel="stylesheet"/>
		<style type="text/css">
			body {
				margin-top: 30px;
			}
		</style>
    </head>
    <body>
        <div class="container">
            <tiles:insertAttribute name="header" />

            <tiles:insertAttribute name="body" />
        </div>

        <tiles:insertAttribute name="footer" />
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>
```   

**header.jsp**   
```html
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">
      	<img alt="Tiles" src="https://tiles.apache.org/images/logo.png" height="100%">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
        <li><a href="<c:url value='/login' />">Login</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" 
          			  data-toggle="dropdown" 
          			  role="button" 
          			  aria-haspopup="true" 
          			  aria-expanded="false">
          	<span class="badge">${ username } <span class="caret"></span> </span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#">Help</a></li>
            <li><a href="#">About</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
```   

**footer.jsp**   
```html
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<footer class="footer">
	<div class="container text-center">
    	<p class="text-muted">Project Sample with Tiles Template by e-Programar at 2016.</p>
  	</div>
</footer>
```   

**index.jsp**
```html
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="page-header">
  <h1>Example page header <small>Subtext for header</small></h1>
</div>
```   

**login**
```html
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
	body {
		margin-top: 150px;
	}
</style>
<div class="container row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<c:if test="${ not empty loginError }">
			<div class="alert alert-danger alert-dismissible" role="alert">
			  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			  ${ loginError }
			</div>
		</c:if>
		<form action="login" method="post">
		  <div class="form-group">
		    <label for="exampleInputUsername">Username:</label>
		    <input type="text" autofocus="autofocus" class="form-control" name="username" id="exampleInputUsername" placeholder="Username...">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input type="password" name="passowrd" class="form-control" id="exampleInputPassword1" placeholder="Password">
		  </div>
		  <button type="submit" class="btn btn-default">Login</button>
		</form>
	</div>
	<div class="col-md-4"></div>
</div>
```   

**IndexController.java**
```java
package com.eprogramar.sampletiles;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class IndexController {

	@RequestMapping
	public String index(){
		return "index";
	}
	
}
```   

**LoginController.java**
```java
package com.eprogramar.sampletiles;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping
	public String login(){
		return "login";
	}

	@RequestMapping(method=RequestMethod.POST)
	public String in(String username, String passowrd, HttpSession session, Model model){
		
		if ( StringUtils.isEmpty(username) || StringUtils.isEmpty(passowrd) ){
			model.addAttribute("loginError", "Invalid Login!");
			return "login";
		}
		
		session.setAttribute("username", username);
		return "redirect:/";
	}
	
}
```   

**********************
### References   

* [Apache Tiles][0] 
* [UaiContacts Project][1]


[0]: https://tiles.apache.org/framework/tutorial/basic/index.html
[1]: https://github.com/fabianogoes/uaicontacts




