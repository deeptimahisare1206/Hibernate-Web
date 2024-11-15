<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="com.mypackage.Student"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	display: grid;
	place-items: center;
	background-color: #5acdcd;
	gap: 2rem;
	height: 100vh;
}

div {
	padding: 2rem;
	background-color: white;
	height: 25rem;
	width: 50vw;
}

form {
	width: 300px;
	margin: 0 auto;
}

label {
	display: block;
	margin: 10px 0 5px;
}

input[type="text"], input[type="number"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
}

input[type="submit"], a {
	background-color: #4CAF50;
	color: white;
	padding: 10px;
	border: none;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #45a049;
}
</style>
</head>
<body>
	<div>
		<%
		int did = Integer.parseInt(request.getParameter("id"));
		%>
		<h2>Update Information</h2>

		<form action="Update" method="get">

			<%
		Configuration cfg = new Configuration();
		cfg.configure();
		SessionFactory sf = cfg.buildSessionFactory();
		Session sess = sf.openSession();

		Student st = (Student)sess.get(Student.class, did);
		
		
		%> 

			<label>Roll No.: </label> <input type="number" name="rolln"
				value="<%=did%>"> <label>Name:</label><input type="text"
				name="name" value="<%=st.getName()%>"><label>Percent: </label><input type="number"
				name="percent"  value="<%=st.getPercent()%>"> <input type="submit" value="Submit">
			<%-- <%
		}
		%> --%>
		</form>

	</div>
</body>
</html>
