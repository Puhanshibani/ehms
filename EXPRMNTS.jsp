
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String regNo,hosNm,contPerson,locality,city,state,phNo,faxNo,emailId,webSite;
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
regNo=request.getParameter("txtregno");
hosNm=request.getParameter("txthosnm");
contPerson=request.getParameter("txtcntprs");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("cmbstate");
phNo=request.getParameter("telphno");
faxNo=request.getParameter("txtfaxno");
emailId=request.getParameter("txtmlid");
webSite=request.getParameter("txtwbstnm");
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblHospital values('"+regNo+"','"+hosNm+"','"+contPerson+"','"+locality+"','"+city+"','"+state+"','"+phNo+"','"+faxNo+"','"+emailId+"','"+webSite+"')");
	out.println("Saved Succesfuly");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>