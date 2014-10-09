<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@ page import="com.mysql.jdbc.StringUtils"%>
<%@ page import="com.arena.app.OrderBean"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Arena Ordering App</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/toggle.css" rel="stylesheet">
<link href="css/image_properties.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style>
.order_form {
	float: center;
	position: relative;
	margin-left: auto;
	margin-right: auto;
	background-color: #2c4968;
	padding: 5em;
}

.table_class {
	float: center;
	position: relative;
	margin-left: auto;
	margin-right: auto;
	color: white;
}

.a
{
	color: black;
}

</style>
</head>


<body background="images/Arena_Background.jpg">
	<%!ArrayList<OrderBean> Order;%>
	<!-- 	<ul class="navigation">
		<li>
			<a href="Order_Logs.html">Order Logs</a>
		</li>
		</li>
			<a href="Log_In.html">Log Out</a>
		</li>
	</ul> -->

	<!-- <input type="checkbox" id="nav-trigger" class="nav-trigger" />
<label for="nav-trigger"></label> -->

	<div class="site-wrap">

		<div class="moa_arena_log">
			<img class="img-responsive" src="images/Arena_Logo.png">
		</div>

		<br> <br> <br>

		<div class="order_form">
			<!-- ORDERS -->
			<table class="table_class" border="5">
				<tr>
					<th>Product</th>
					<th>Qty</th>
				</tr>
				<%
					int x = 0;
					if (session.getAttribute("orderlist") != null) {

						Order = (ArrayList<OrderBean>) session
								.getAttribute("orderlist");
						for (int i = 0; i < Order.size(); i++) {
							x = i;
				%>

				<tr>
					<td><%=Order.get(i).getName()%></td>
					<%-- 					<td><%=Order.get(i).getQty()%></td> --%>
					<form action="processorder.html?id=<%=x%>&action=updateorder"
						method="post">
						<td><input class="a" type="text" name="newq" size="2"
							value=<%=Order.get(i).getQty()%>></td>
						<td><input type="submit" value="Update"
							class="btn btn-warning"></td>
					</form>
					<td><a href="processorder.html?id=<%=x%>&action=deleteorder"><button
								class="btn btn-danger">Delete</button></a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
			<div class="table_class">
			<center>
				<a href="displayfood.html?action=<%=session.getAttribute("cat")%>"><button
						class="btn btn-success" type="submit">BACK</button></a>
			</center>
			</div>
			<!-- ORDERS -->
		</div>



		<a href="home.jsp"><img src="images/Home_Button.png" class="home"></a>
		<img data-toggle="modal" data-target="#myModal" class="print"
			src="images/Print.png" alt="Responsive image">


	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">PRINT</h4>
				</div>
				<form action="processpassword.html" method="post">
					<%
						session.setAttribute("finalorder", Order);
					%>
					<div class="modal-body">
						<input type="text" class="form-control" name="room"
							placeholder="Room" required="" autofocus="" /> <input
							type="text" class="form-control" name="custname"
							placeholder="Customer Name" required autofocus /> <input
							type="password" class="form-control" name="password"
							placeholder="Password" required="" autofocus="" />
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary">Print</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- jQuery Version 1.11.0 -->
	<script src="js/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-1.10.1.min.js"></script>
	<script src="js/idangerous.swiper.min.js"></script>
</body>
</html>
