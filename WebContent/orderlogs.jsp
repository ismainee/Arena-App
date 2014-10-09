<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@ page import="com.mysql.jdbc.StringUtils"%>
<%@ page import="com.arena.app.OrderBean"%>
<%@ page import="com.arena.app.MenuBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">


<!-- Custom CSS -->
<link href="css/simple-sidebar.css" rel="stylesheet">
<link href="css/image_properties.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div id="page-content-wrapper" class="container">
		<div class="container-fluid">
			<div class="row">

				<div class="sidebar_menu">
					<a href="#menu-toggle" id="menu-toggle"> <img
						class="img-responsive" src="images/Sidebar_Menu.png">
					</a>
				</div>

				<div class="moa_arena">
					<img class="img-responsive" src="images/Moa_Arena.png">
				</div>
				<br /> <br />
				<div class="container">
					<div class="">
						<div class="" style="color: white;">
							<jsp:useBean id="or" type="java.sql.ResultSet" scope="session" />
							<h2>Here are the logs!</h2>
							<table class="table table-bordered">
								<tr>
									<th>Order ID</th>
									<th>Room</th>
									<th>Date/Time</th>
									<th>Customer</th>
									<th>Orders</th>
								</tr>
								<%
									while (or.next()) {
										String data = or.getString("orders_list");
										System.out.println(data);
										String[] data2 = data.split(",", data.length());
										String newdata = data2[3].toString();
										String[] data4 = newdata.split("_", newdata.length());%>
																		<tr>
									<td><%=or.getInt("order_id")%></td>
									<td><%=data2[0]%></td>
									<td><%=data2[1]%></td>
									<td><%=data2[2]%></td>
									<td>
									<%	for (int i = 0; i < data4.length; i++) {
											System.out.println(data4[i]);
								%>
									<%=data4[i]%>
									<%
										}
										}
									%>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /#page-content-wrapper -->
	</div>
	<!-- /#wrapper -->
	<!-- jQuery Version 1.11.0 -->
	<script src="js/jquery-1.11.0.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<script src="js/jquery-ui-1.9.0.custom.min.js"></script>
</body>
</html>