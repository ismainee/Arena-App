<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<head>
<link href="css/toggle.css" rel="stylesheet">
<link href="css/image_properties.css" rel="stylesheet">
<link href="css/menu.css" rel="stylesheet">

<style>
#dvLoading
{
   background:url(images/loader.gif) no-repeat center center;
   height: 100px;
   width: 100px;
   position: fixed;
   z-index: 1000;
   left: 50%;
   top: 50%;
   margin: -25px 0 0 -25px;
}
</style>
<script>
$(window).load(function(){
  $('#dvLoading').fadeOut(2000);
});
</script>
</script>
</head>


<body background="images/Arena_Background.jpg">
	<ul class="navigation">
		<li></li>
		<div class="arena_logo">
			<img src="images/Arena_Logo.png">
		</div>
		</li>
		<li class="nav-item" style="color: white;">Welcome, <%=session.getAttribute("fname")%></li>
		<li class="nav-item"><a href="orderlogs.html">Order Logs</a></li>
		<li class="nav-item"><a href="actionstatus.jsp?success=logout">Log Out</a></li>
	</ul>


	<input type="checkbox" id="nav-trigger" class="nav-trigger" />
	<label for="nav-trigger"></label>

	<div class="site-wrap">

		<div class="moa_arena">
			<img class="img-responsive" src="images/Moa_Arena.png">
		</div>
		<div class="small">
			<a href="displayfood.html?action=food"><img
				src="images/Meal_2.png" class="img-responsive"
				alt="Responsive image"></a> 
			<a
				href="displayfood.html?action=drink"><img
				src="images/Drinks_2.png" class="img-responsive"
				alt="Responsive image"></a> 
			<a
				href="displayfood.html?action=dessert"><img
				src="images/Dessert_2.png" class="img-responsive"
				alt="Responsive image"></a>
		</div>

	</div>

</body>
</html>
























