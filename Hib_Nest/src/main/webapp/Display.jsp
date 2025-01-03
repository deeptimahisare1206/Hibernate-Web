
<%@page import="com.mypackage.Todo"%>
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

a , input[type="submit"]{
	background-color: #000000;
	color: white;
	padding: 0.5rem 1rem;
	border: none;
	cursor: pointer;
	text-decoration: none;
}
input[type="text"] {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
}
</style>
</head>
<body>
<%@include file="Khojo.jsp" %>

	<h1>All Lists</h1>
	<table border="1">
		<thead>
			<th>ID</th>
			<th>Title</th>
			<th>Details</th>
			<th>Action</th>
			<th>Action</th>
		</thead>
		<%
		
		Configuration cfg = new Configuration();
		cfg.configure();
		SessionFactory sf = cfg.buildSessionFactory();
		Session sess = sf.openSession();
	int i=0 , j=3;
	if (request.getParameter("i") != null) {
		i = Integer.parseInt(request.getParameter("i"));
	}	
	
	Query q = sess.createQuery("from Todo");
		q.setFirstResult(i);
    	q.setMaxResults(j);
    	

		List<Todo> li = q.list();

		for (Todo st : li) {
		%>
		<tr>
			<td><%=st.getId()%></td>
			<td><%=st.getTitle()%></td>
			<td><%=st.getMessage()%></td>
			<td><a href="Update.jsp?id=<%=st.getId()%>">Update</a></td>
			<td><a href="Delete.jsp?id=<%=st.getId()%>">Delete</a></td>

		</tr>
		<%
		}
		%>


	</table>
	
	<div> <a href="Display.jsp?i=<%=i+j%>">NEXT</a></div>
<div> <a href="Display.jsp?i=<%=i-j%>">PREVIOUS</a></div>

</body>
</html>