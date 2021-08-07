
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
	<div class="container text-center">
		<div id="forborders">
			<form th:action="@{/logout}" method="post">
				<p id="para">
					Welcome <b>[[${#request.userPrincipal.principal.fullName}]]</b>
				</p>
				<input id="signout" type="submit" value="Sign Out"/>
			</form>

		<div class="button-container">
		<form th:action="@{/contact_search}">
			<label id="lbl">Search by OrgType</label>
		
			<select class="test" name="medlist" id="medlist">
				<option value="null"></option>
				<option value="hospital">hospital</option>
				<option value="lab">lab</option>
				<option value="dentist">dentist</option>
				<option value="pharmacy">pharmacy</option>
			</select>
			<button id="find">Search</button>
	&nbsp;&nbsp;&nbsp;&nbsp;	
	<span style="font-weight:bold;fonnt-size:10px">OR</span>
		</form>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<form th:action="@{/contact_search}">
		
			<label id="lbl">Search by City</label>
			<select class="nm" name="medlist" id="medlist">
				<option value="null"></option>
				<option value="Arlington">Arlington</option>
				<option value="Dallas">Dallas</option>
				<option value="FortWorth">Fort Worth</option>
			</select>
			<button id="find">Search</button>
		</form>
	</div>
	</div>
		<br />
		<br />
		<br/>
		        <h3><a th:href="@{/favorite}">View Favorite Records</a></h3>
		
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
					<tr  th:each="medical: ${listMedicals}">
						<td hidden  th:text="${medical.id}"></td>
						<td th:text="${medical.orgname}"></td>
						<td th:text="${medical.phnnum}"></td>
						<td th:text="${medical.address}"></td>
						<td th:text="${medical.city}"></td>
						<td th:text="${medical.orgtype}"></td>
						<td><input class='myclass' id='btn'   type='button' value='Add to Favorite'/></td>
						

					</tr>
				</tbody>
				
			</table>
		</div>
</body>
<script type="text/javascript">
$(function() {
    var medicalValue = localStorage.getItem("medicalValue");
    if(medicalValue != null) {
        $("select[name=medlist]").val(medicalValue);
    }

    $("select[name=medlist]").on("change", function() {
        localStorage.setItem("medicalValue", $(this).val());
    });
})

$(document).on('click', '.nm', function(event ) {
   $('.test').val('null'); //select first option
});

$(document).on('click', '.test', function(event ) {
	   $('.nm').val('null'); //select first option
	});
$(document).on('click', '#signout', function(event ) {
	localStorage.removeItem('medicalValue');
	});



$("table tr input").on('click', function(){
	var passId= ($(this).closest('td').parent()[0].sectionRowIndex);
	   alert("Added to favorite");

	
	  /*  $.ajax({

		    url : '/addTask.html',
		    type : 'POST',
		    dataType:'json',
		    contentType:'json',
		    data : passId,
		    success : function(data) {              
		        //alert('Data: '+data);
		    },
		    error : function(request,error)
		    {
		        //alert("Request: "+JSON.stringify(request));
		    }
		}); */
	   
	});

</script>
</html>