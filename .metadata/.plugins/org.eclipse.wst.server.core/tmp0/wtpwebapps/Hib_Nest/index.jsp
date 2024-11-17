<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<style>
*{
margin:0;
padding:0;
box-sizing: border-box;

}
body {
display:grid;
place-items:center;
	background-color: #5acdcd;
	gap: 2rem;
	height: 100vh;
}

.container{
padding:2rem;
	background-color: white;
	height: 25rem;
	width:50vw;
}

form {
    width: 30rem;
    margin: 0 auto;
    padding: 3rem 1rem;
}

label {
    display: block;
    margin: 10px 0 5px;
    font-size:1rem;
    font-weight:bolder;
    
}

input[type="text"],
input[type="number"] {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
}

input[type="submit"] ,a{
    background-color: #4CAF50;
    color: white;
    font-size:1rem;
    font-weight:bolder;
    padding: 1rem;
    border: none;
    cursor: pointer;
    text-decoration: none;
}

input[type="submit"]:hover {
    background-color: #45a049;
}
.btns{
width: 100%;
display: flex;
gap:2rem;
justify-content:center;
}
</style>
</head>
<body>
<div class="container">
	<h1 style="text-align: center">TODO-LIST</h1>

	<form action="Register" method="get">
		<label>Title:</label><input type="text" name="title"> <label>Message:
		</label><input type="text" name="msg">
		<div class="btns"> <input type="submit"
			value="ADD">
			<a href="Display.jsp">View All</a></div>
	</form>
	</div>
</body>
</html>
