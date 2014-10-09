<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<%
		if (request.getParameter("success").equals("invalidpassword")) {
	%>
	<script type="text/javascript">
		alert('Invalid Username or Password');
		location = "index.jsp";
	</script>
	<%
		} else if (request.getParameter("success").equals("invaliduser")) {
	%>
	<script type="text/javascript">
		alert('Invalid Username or Password');
		location = "index.jsp";
	</script>
	<%
		} else if (request.getParameter("success").equals("loginerror")) {
	%>
	<script type="text/javascript">
			alert('<%=session.getAttribute("error")%>
		');
		location = "index.jsp";
	</script>
	<%
		} else if (request.getParameter("success").equals("uploaded")) {
	%>
	<script type="text/javascript">
		alert('Menu Successfully Uploaded!');
		location = "menu.jsp"
	</script>
	<%
		} else if (request.getParameter("success").equals("notuploaded")) {
	%>
	<script type="text/javascript">
		alert('Menu not uploaded!');
		location = "menu.jsp"
	</script>
	<%
		} else if (request.getParameter("success").equals("logout")) {
			session.invalidate();
	%>
	<script type="text/javascript">
		alert('You are now logging out from the Admin Kitchen');
		location = "index.jsp"
	</script>
	<%
		} else if (request.getParameter("success").equals("useradded")) {
	%>
	<script type="text/javascript">
		alert('User Successfully added!');
		location = "viewusers.html?action=viewusers";
	</script>
	<%
		} else if (request.getParameter("success").equals("usernotadded")) {
	%>
	<script type="text/javascript">
		alert('User not added!');
		location = "displayusers.jsp"
	</script>
	<%
		} else if (request.getParameter("success").equals("usernotdeleted")) {
	%>
	<script type="text/javascript">
		alert('User not deleted');
		location = "viewusers.html?action=viewusers"
	</script>
	<%
		} else if (request.getParameter("success").equals("userdeleted")) {
	%>
	<script type="text/javascript">
		alert('User deleted!');
		location = "viewusers.html?action=viewusers"
	</script>
	<%
		} else if (request.getParameter("success").equals("useredited")) {
	%>
	<script type="text/javascript">
		alert('User edited!');
		location = "viewusers.html?action=viewusers"
	</script>
	<%
		} else if (request.getParameter("success").equals("usernotedited")) {
	%>
	<script type="text/javascript">
		alert('User not edited!');
		location = "viewusers.html?action=viewusers"
	</script>
	<%
		} else if (request.getParameter("success").equals("printed")) {
	%>
	<script type="text/javascript">
		alert('Order sent to kitchen!');
		location = "home.jsp"
	</script>
	<%
		} else if (request.getParameter("success").equals("unabletoprint")) {
	%>
	<script type="text/javascript">
		alert('Order not sent to kitchen. Please');
		location = "vieworders.jsp"
	</script>
	<%
		}
	%>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>
