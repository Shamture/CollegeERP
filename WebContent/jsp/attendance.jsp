<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, college_erp.dbutil.*,java.net.URLEncoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/college_erp/css/style.css">
<script>
function check()
{
	var st=document.getElementById("sem").value;
	if(st=="def")
		{
		alert("Please select one value");
		return false;
		}
	return true;
	}
</script>
</head>
<body>
<div style="margin-left:150px;margin-top:80px;float:left;">
<u>VIEW ATTENDANCE</u>
<form method="get" action="/college_erp/jsp/viewatt.jsp" style="margin-top:30px">
From :
<input type="date" name="frm" required="required">
&nbsp &nbsp &nbspTo :
<input type="date" name="to" required="required">
&nbsp &nbsp &nbspSemester :
<select name="sem" id="sem">
<option value="def">Select Semester</option>
<%
HttpSession hs=null;
hs=request.getSession(false);
String uid=(String)hs.getAttribute("uinfo");
String str="select distinct s.sem from subjects s,student st where st.rollno=? and st.course_id=s.courseid ORDER BY s.sem";
ResultSet rs=CrudOperation.getData(str, uid);
try
{
	while(rs.next())
	{
%>
<option value='<%=rs.getInt("sem") %>'><%=rs.getInt("sem") %></option>
<%
	}
}
	catch(Exception e)
	{
		
	}
%>
</select>
<input type="submit" value="GO" style="margin-left:20px" onclick="return check()">
</form>
${param.message}
</div>
</body>
</html>