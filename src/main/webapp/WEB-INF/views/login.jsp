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