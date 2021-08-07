<!DOCTYPE html>
<style>
h4{
color:red;
}
</style>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="ISO-8859-1">
    <title>Registration Success</title>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body style="background-color:#A569BD">
<br/><br></br>
    <div class="container text-center">
        <h3>You have signed up successfully!</h3>
         <h4  style="color:red"><a th:href="@{/login}">Click here to Login</a></h4>
     </div>
     
</body>
</html>