<!DOCTYPE html>
<style>
#landingp{
border-style:double;
padding-bottom:20%;
border-bottom:10px double;
background-color:#D5D8DC ;

}
body{
border-style:double;
 background-image: url("test.jpg");

}
</style>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title>Welcome Home</title>
<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />

<body>
<div id= "outerdiv">
<br/><br/>

	<div  id="landingp" class="container text-center">
	<br/>
        <h1>PhoneBook App</h1>
<!--         <h3><a th:href="/@{/users}">List of Users</a></h3>
 -->        <h3><a th:href="@{/register}">Register</a></h3>
        <h3><a th:href="@{/login}">Login</a></h3>
    </div>
    </div>
</body>
</html>