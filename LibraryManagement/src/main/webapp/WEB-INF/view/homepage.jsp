<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>library management</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/style.css" rel="stylesheet">
</head>
<body>


<c:choose>
<c:when test="${mode=='MODE_HOME' }">
<div style="background-color: yellow">
<div role="navigation">
<a href="/home" class="navbar-brand">HOME</a> || <a href="/logout" class="navbar-brand">LOGOUT</a> || <a href="/register" class="navbar-brand">ADD BOOK</a> || <a href="/show-user" class="navbar-brand">BOOK LIST</a>
</div>
</div>
<div class="container" id ="homediv">
<div class="jumbotron text-center">
<h1>welcome to library management website</h1>
</div>
</div>
</c:when>

<c:when test="${mode=='MODE_REGISTER' }">
<div style="background-color: yellow">
<div role="navigation">
<a href="/home" class="navbar-brand">HOME</a> || <a href="/logout" class="navbar-brand">LOGOUT</a> || <a href="/register" class="navbar-brand">ADD BOOK</a> || <a href="/show-user" class="navbar-brand">BOOK LIST</a>
</div>
</div>


<div class="container text-center">
<h1>new registration</h1>
<hr>
<form class="form-horizontal" method="POST" action="save-user">
<div class="form-group">
<div class="col-md-7">
<input type="text" name="id" value="${user.id }"
placeholder="Enter Id"/>
</div>
</div>
<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="username" value="${user.username }"
placeholder="Enter User name"/>
</div>
</div>

<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="bookname" value="${user.bookname }"
placeholder="Enter Book name"/>
</div>
</div>

<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="authorname" value="${user.authorname }"
placeholder="Enter Author name"/>
</div>
</div>

<div class="form-group">
<div class="col-md-7">
<input type="password" class="form-control" name="password" value="${user.password }"
placeholder="Enter password"/>
</div>
</div>

<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="date" value="${user.date }"
placeholder="Enter date"/>
</div>
</div>

<div class="form-group">
<input type="submit" class="btn btn-primary" value="Register"/>
</div>
</form>
</div>
</c:when>

<c:when test="${mode=='MODE_EDIT' }">
<div style="background-color: yellow">
<div role="navigation">
<a href="/home" class="navbar-brand">HOME</a> || <a href="/logout" class="navbar-brand">LOGOUT</a> || <a href="/register" class="navbar-brand">ADD BOOK</a> || <a href="/show-user" class="navbar-brand">BOOK LIST</a>
</div>
</div>


<div class="container text-center">
<h1>update</h1>
<hr>
<form class="form-horizontal" method="POST" action="save-user">
<div class="form-group">
<div class="col-md-7">
<input type="text" name="id" value="${user.id }"
placeholder="Enter Id"/>
</div>
</div>
<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="username" value="${user.username }"
placeholder="Enter User name"/>
</div>
</div>

<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="bookname" value="${user.bookname }"
placeholder="Enter Book name"/>
</div>
</div>

<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="authorname" value="${user.authorname }"
placeholder="Enter Author name"/>
</div>
</div>

<div class="form-group">
<div class="col-md-7">
<input type="password" class="form-control" name="password" value="${user.password }"
placeholder="Enter password"/>
</div>
</div>

<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="date" value="${user.date }"
placeholder="Enter date"/>
</div>
</div>

<div class="form-group">
<input type="submit" class="btn btn-primary" value="update"/>
</div>
</form>
</div>
</c:when>

<c:when test="${mode=='MODE_LOGIN' }">



<div class="container text-center">
<h3>User Login</h3>
<hr>
<form class="form-horizontal" method="POST" action="/login-user">
<c:if test="${not empty error }">
<div class="alert alert-danger">
<c:out value="${error }"></c:out>
</div>
</c:if>
<div class="form-group">
<div class="col-md-7">
<input type="text" class="form-control" name="username"
value="${user.username }" placeholder="Enter Username"/>
</div>
</div>
<div class="form-group">
<div class="col-md-7">
<input type="password" class="form-control" name="password"
value="${user.password }"placeholder="Enter password"/>
</div></div>
<div class="form-group">
<input type="submit" class="btn btn-primary" value="Login"/>
</div>
</form>
</div>
</c:when>




<c:when test="${mode=='ALL_USERS' }">
<div style="background-color: yellow">
<div role="navigation">
<a href="/home" class="navbar-brand">HOME</a> || <a href="/logout" class="navbar-brand">LOGOUT</a> || <a href="/register" class="navbar-brand">ADD BOOK</a> || <a href="/show-user" class="navbar-brand">BOOK LIST</a>
</div>
</div>
<div class="container text-center" id="tasksDiv">
<h3>All Books<h3/>
<hr>
<div class="table-responsive">
<table class="table table-strioed table-bordered">
<thead>
<tr>
	<th>Id</th>
	<th>book name</th>
	<th>author name</th>
	<th>date</th>
	<th>delete</th>
	<th>edit</th>
</tr>
</thead>
<tbody>
<c:forEach var="user" items="${users}">
<tr>
<td>${user.id}</td>
<td>${user.bookname}</td>
<td>${user.authorname}</td>
<td>${user.date}</td>
<td><a href="/delete-user?id=${user.id}"><span class="glyphicon glyphicon-trash">Delete</span></a></td>
<td><a href="/edit-user?id=${user.id}"><span class="glyphicon glyphicon-pencil">Edit</span></a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</c:when>
</c:choose>


<!-- optional javaScript -->
<!-- jQueryfirst,then Propper.js,then Bootstrap JS -->
<script type="static/js/jquery-1.11.1.min.js"></script>
<script type="static/js/bootstrap.min.js"></script>
</body>
</html>