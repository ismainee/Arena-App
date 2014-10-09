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

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Simple Sidebar - Start Bootstrap Template</title>

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
	<%! ArrayList<OrderBean>Order; 
		boolean match;
	%>
	<div id="wrapper" class="toggled">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<br>
				<li class="sidebar-brand">
					<div class="small">
						<img src="images/Arena_Logo.png">
					</div>
				</li>
				<br>
				<br>
				<li><a href="orderlogs.html">Order Logs</a></li>
				<li><a href="actionstatus.jsp?success=logout">Log Out</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->

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

					<!-- JSP STARTS HERE -->
					<jsp:useBean id="menu" type="java.sql.ResultSet" scope="session" />
					<div class="row">
						<br /> <br />
						<%
							while (menu.next()) {
								Blob blob = menu.getBlob("image");
								int length = (int) blob.length();
								byte[] blobbyte = blob.getBytes(1, length);
								byte[] encodedBytes = Base64.encodeBase64(blobbyte);
								String src = "data:image/png;base64,"
								+ new String(encodedBytes);
								System.out.println("encodedBytes " + new String(encodedBytes));
						%>
						<!-- DISPLAY -->
						<div class="col-lg-4 col-md-4 col-xs-5 thumb">
							<center>
								<a href="mdetails.html?id=<%=menu.getInt("menu_id")%>&action=getdetails">
									<img class="img-responsive addbtn" src=<%=src%>
										alt="Image 1" width="150" height="150">
								</a>
								<h3 style="color: white;">
									<%=menu.getString("name")%>
								</h3>
								<h3 style="color: white;">
									Php<%=menu.getDouble("price")%>
								</h3>
							</center>
						</div>
						<!-- DISPLAY -->
						<%
							}
						%>
						<!-- 						<table border="2"> -->
						<!-- 							<tr> -->
						<!-- 								<th>Product</th> -->
						<!-- 								<th>Qty.</th> -->
						<!-- 							</tr> -->
						<%-- 							<% --%>
						<!-- // 							if(session.getAttribute("arraylist") != null) -->
						<!-- // 							{ -->
						<!-- // 								Order = (ArrayList<OrderBean>)session.getAttribute("arraylist"); -->
						<!-- // 								for (int i=0; i<Order.size(); i++) -->
						<!-- // 								{ -->
						<%-- 						%> --%>
						<!-- 							<tr> -->
						<%-- 								<td style="color: white;"><%=Order.get(i).getCode()%></td> --%>
						<%-- 								<td style="color:white;"><%=Order.get(i).getQty()%></td> --%>
						<%-- 								<td><input type="text" value=<%=Order.get(i).getQty()%>></td> --%>
						<!-- 							</tr> -->
						<%-- 							<% --%>
						<!-- // 								} -->
						<!-- // 							} -->
						<%-- 						%> --%>
						<!-- 						</table> -->
						<div class="print">
							<a href="vieworders.jsp"><img src="images/View_Order.png"
								class="img-responsive" alt="Responsive image"></a>
						</div>
						<div class="home">
							<a href="home.jsp"><img src="images/Home_Button.png"
								class="img-responsive" alt="Responsive image"></a>
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

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>
	<script>
		var count = 0;
		var countEl = document.getElementById("count");
		function plus() {
			count++;
			countEl.value = count;
		}
		function minus() {
			count--;
			countEl.value = count;
		}
	</script>
</body>
</html>