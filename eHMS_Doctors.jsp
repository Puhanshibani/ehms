
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String dctrId,dctrNm,sex,locality,city,state,phNo,emailId,dtOfJoin,dept,photo;
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
dctrId=request.getParameter("txtdctrid");
dctrNm=request.getParameter("txtdctrm");
sex=request.getParameter("cmbsex");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("cmbstate");
phNo=request.getParameter("txtphno");
emailId=request.getParameter("txtmlid");
dtOfJoin=request.getParameter("dtdoj");
dept=request.getParameter("cmbdept");
photo=request.getParameter("btnBrows");
System.out.println("Photo "+photo);
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tbldoctor values('"+dctrId+"','"+dctrNm+"','"+sex+"','"+locality+"','"+city+"','"+state+"','"+phNo+"','"+emailId+"','"+dtOfJoin+"','"+dept+"','"+photo+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Doctorc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>