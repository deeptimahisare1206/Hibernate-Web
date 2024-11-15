<%@page import="java.util.List"%>
<%@page import="com.mypackage.Student"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #5acdcd;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

h1 {
	color: #333;
	text-align: center;
}

table {
	width: 80%;
	margin-top: 20px;
	border-collapse: collapse;
	background-color: white;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #4CAF50;
	color: white;
}

a {
	background-color: #000000;
	color: white;
	padding: 0.5rem 1rem;
	border: none;
	cursor: pointer;
	text-decoration: none;
}
</style>
</head>
<body>
	<h1>All Students</h1>
	<table border="1">
		<thead>
			<th>Roll no</th>
			<th>Name</th>
			<th>Percent</th>
			<th>Action</th>
			<th>Action</th>
		</thead>
		<%
		Configuration cfg = new Configuration();
		cfg.configure();
		SessionFactory sf = cfg.buildSessionFactory();
		Session sess = sf.openSession();

		Query q = sess.createQuery("from Student");
		List<Student> li = q.list();

		for (Student st : li) {
		%>
		<tr>
			<td><%=st.getRoll()%></td>
			<td><%=st.getName()%></td>
			<td><%=st.getPercent()%></td>
			<td><a href="Update.jsp?id=<%=st.getRoll()%>">Update</a></td>
			<td><a href="Delete.jsp?id=<%=st.getRoll()%>">Delete</a></td>

		</tr>
		<%
		}
		%>


	</table>

</body>
</html>