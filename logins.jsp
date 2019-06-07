<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> e-Hospital Management System </title>
</head>
<body>
<%!
String usrNm,pwd,username,password;
Statement stmtreadvalues;
ResultSet rssetvalues;
Connection conn;
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
<%
usrNm=request.getParameter("txtusrnm");
pwd=request.getParameter("txtpwd");
%>
<%
doConnect();
try{
stmtreadvalues=conn.createStatement();
rssetvalues=stmtreadvalues.executeQuery("select * from eHMS_tblLogin where UserName='"+usrNm+"'and Password='"+pwd+"'");
if(rssetvalues.next()){
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Welcome To Hospital Management System'"+");\n");
	out.println("setTimeout(function(){window.location.href='Menu2.html'},100);");
	out.println("</script>\n");
}
else{
out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Invalid Username or Password'"+");\n");
	out.println("setTimeout(function(){window.location.href='loginc.html'},100);");
	out.println("</script>\n");
}
}
catch(SQLException se){
	      out.println("Unable to delete"+se);
	  }
%>