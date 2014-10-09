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
<link href="css/bootstrap-form-helpers.min.css" rel="stylesheet" media="screen">


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
			<jsp:useBean id="newdetails" type="java.sql.ResultSet"
				scope="session" />
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
						<div class="">
							<%
								String cat = session.getAttribute("cat").toString();
								while (newdetails.next()) {
									Blob blob = newdetails.getBlob("image");
									int length = (int) blob.length();
									byte[] blobbyte = blob.getBytes(1, length);
									byte[] encodedBytes = Base64.encodeBase64(blobbyte);
									String src = "data:image/png;base64,"
											+ new String(encodedBytes);
									System.out.println("encodedBytes " + new String(encodedBytes));
							%>
							<center>
								<form action="processorder.html?id=<%=newdetails.getInt("menu_id")%>&action=addorder&name=<%=newdetails.getString("name")%>&code=<%=newdetails.getString("code")%>" method="post">
									<img class="img-responsive" src=<%=src%> alt="Image 1"
										width="150" height="150">
									<h3 style="color: white;"><%=newdetails.getString("name")%></h3>
									<h3 style="color: white;"><%=newdetails.getString("description")%></h3>
									<h3 style="color: white;">
										Php<%=newdetails.getDouble("price")%></h3>
									<h3>
										Quantity: <input type="text" name="qty" value="0" min="0" size="2">
									</h3>
										<button class="btn btn-success" type="submit">BACK</button>
								</form>
							</center>
							<%
								}
							%>
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
	
	<script src="js/bootstrap-formhelpers.min.js"></script>
</body>
</html>