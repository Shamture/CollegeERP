<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, college_erp.dbutil.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/college_erp/css/style.css">
<title>Insert title here</title>
</head>
<body>
<%

HttpSession hs=request.getSession(false);
String ui=(String)hs.getAttribute("uinfo");
String strsql="select * from message where receiver_id=? and rstatus='false'";
ResultSet rs1=CrudOperation.getData(strsql,ui);
%>
<div style="margin-left:100px"><h2>INBOX</h2></div>
<form method="post" action="/college_erp/DeleteSender">
<table border="15" style="border-style:inherit;margin-top:50px;margin-left:100px;width:900px">
<tr style="background-color:#b1b1b1"><th style="width:100px">Delete</th><th>Sender's id</th><th style="width:450px">Subject</th></tr>
<%while(rs1.next())
	{
	%>
	<tr><td><input type="checkbox" name="chk" value='<%=rs1.getInt("message_id")%>'></td>
	<td><%=rs1.getString("sender_id") %></td>
	<td><a href='/college_erp/jsp/showmessage.jsp?msgid=<%=rs1.getInt("message_id") %>'><%=rs1.getString("subject") %></a></td></tr>
	<%
	}%>
	<tr><td colspan=3 align=center><button type=submit>Delete</button>
	</table>
</form>
</body>
</html>