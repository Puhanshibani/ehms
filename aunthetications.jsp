<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> e-Hospital Management System </title>
</head>
<body>
<%!
String usrNm,pwd,newusername,newpwd;
Statement stmtreadvalues,stmtupdate;
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
newusername=request.getParameter("txtnewusrnm");
newpwd=request.getParameter("txtnewpwd");
%>
<%
doConnect();
try{
stmtreadvalues=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
rssetvalues=stmtreadvalues.executeQuery("select * from eHMS_tblLogin where UserName='"+usrNm+"'and Password='"+pwd+"'");
if(rssetvalues.next()){

    stmtupdate=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
	stmtupdate.executeUpdate("update eHMS_tblLogin set UserName='"+newusername+"',Password='"+newpwd+"' where UserName='"+usrNm+"'and Password='"+pwd+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'UserName and Password Updated Successfully.'"+");\n");
	out.println("setTimeout(function(){window.location.href='auntheticationc.html'},100)");
	out.println("</script>\n");
	
}
else{
out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Invalid Username or Password'"+");\n");
	out.println("setTimeout(function(){window.location.href='auntheticationc.html'},100);");
	out.println("</script>\n");
}
}
catch(SQLException se){
	      out.println("Unable to update"+se);
	  }
%>