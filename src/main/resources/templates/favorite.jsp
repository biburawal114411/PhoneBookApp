
<!DOCTYPE html>
<style>
#signout {
	color: blue;
	margin-left: 90%;
	margin-bottom:20px;
}

#medlist {
	width: 14%;
}

#forborders {
	border-style:double;
	background-color:#E8F8F5;
	
}

#para {
	font-size: 20px;
}
.button-container form,
.button-container form div {
    display: inline;
}

.button-container button {
    display: inline;
    vertical-align: middle;
}
#lbl{
font-weight:bold;
}
#find{
	height:25px;
}
</style>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="ISO-8859-1">
<title>List Users</title>
<link rel="stylesheet" type="text/css"
	href="/webjars/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<br />
	<br>
	<div>
	<div id="favr" class="container text-center">
	        <form th:action="@{/contact_favorite}" 
            method="post" style="max-width: 600px; margin: 0 auto;"></form>
		<div id="forborders">
			<form th:action="@{/logout}" method="post">
				<p id="para">
					Your Favorite Records</b>
				</p>
				<input id="signout" type="submit" value="Sign Out"/>
			</form>

		
	</div>
		<br />
		<br />
		<br/>
		        <h3><a th:href="@{/login}">View Favorite Records</a></h3>
		
		<div>
			<h1>List of Records</h1>
		</div>
		<div id="tabl">
			<table  id="tata" class="table table-striped table-bordered">
				<thead class="thead-dark">
					<tr>
						<th hidden>ID</th>
						<th>Org Name</th>
						<th>Phone Num</th>
						<th>Address</th>
						<th>City</th>
						<th>Org Type</th>
						<th></th>
					</tr>
				</thead>

				<tbody>
					<tr  th:each="medical: ${favoriteList}">
						<td hidden  th:text="${medical.id}"></td>
						<td th:text="${medical.orgname}"></td>
						<td th:text="${medical.phnnum}"></td>
						<td th:text="${medical.address}"></td>
						<td th:text="${medical.city}"></td>
						<td th:text="${medical.orgtype}"></td>
						

					</tr>
				</tbody>
				
			</table>
		</div>
</body>

<script type="text/javascript">
<script>
function doSubmit(){
var form = document.getElementById("favr");

  form.submit();

}
</script>
</script>
</html>