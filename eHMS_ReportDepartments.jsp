<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Department Profile</title>
</head>
<body background="tile.jpg" style="background-size:cover">
<%!
Connection conn;
Statement stmtSelect;
ResultSet rsData;
String dcode,dname,dhead;
int slno;
public void doConnect(){
      try{
	      Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	  }
	  catch(ClassNotFoundException cnfe){
	     System.out.println("Unable to connect");
	  }
       try{
	      conn=DriverManager.getConnection("jdbc:odbc:localserver","sa","root");
	  }
	  catch(SQLException se){
	      System.out.println("Unable to connect"+se);
	  }
}
%>

<table width="100%">
<tr>
	<td align="center"><font color="black" size="7"><U>D<font color="white" size="6">epartment <font color="black" size="7">&nbsp;<U>I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td><font size="4" color="white">Sl No.</td>
<td><font size="4" color="white">Department Code</td>
<td><font size="4" color="white">Department Name</td>
<td><font size="4" color="white">Head Of Department</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
dname=request.getParameter("cmbdeptnm");
rsData=stmtSelect.executeQuery("select * from eHMS_tbldepartment where DepartmentName='"+dname+"'");
slno=1;
while(rsData.next()){
dcode=rsData.getString("DepartmentCode");
dname=rsData.getString("DepartmentName");
dhead=rsData.getString("HeadOfDepartment");
if(slno%2==1)
out.println("<tr bgcolor=\"lightblue\">");
else
out.println("<tr bgcolor=\"white\">");
%>
<td><%=slno%></td>
<td><%=dcode%></td>
<td><%=dname%></td>
<td><%=dhead%></td>
</tr>
<%
slno=slno+1;
}
}
catch(SQLException se){
out.println("Error");
}
%>
</table>
</body>
</html>








