<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>e-Hospital Management System</title>
</head>
<body>
<%!
String slno,departmentnm,hospitalnm,city,state,rank;
Connection conn;
Statement stmtInsert;
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
slno=request.getParameter("txtslno");
departmentnm=request.getParameter("cmbdeptnm");
hospitalnm=request.getParameter("txthospitalname");
city=request.getParameter("txtcity");
state=request.getParameter("cmbstate");
rank=request.getParameter("cmbrank");
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblCritical values('"+slno+"','"+departmentnm+"','"+hospitalnm+"','"+city+"','"+state+"','"+rank+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Criticalc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to Save"+se);
	  }
%>
</body>
</html>
