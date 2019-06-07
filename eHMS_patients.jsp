
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String regdNo,dtofregd,ptntNm,age,sex,maritalStatus,locality,city,state,phNo;
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
regdNo=request.getParameter("txtregno");
dtofregd=request.getParameter("dtdor");
ptntNm=request.getParameter("txtptntrm");
age=request.getParameter("txtage");
sex=request.getParameter("cmbsex");
maritalStatus=request.getParameter("cmbmaritalstatus");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("cmbstate");
phNo=request.getParameter("txtphno");
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblPatient values('"+regdNo+"','"+dtofregd+"','"+ptntNm+"','"+age+"','"+sex+"','"+maritalStatus+"','"+locality+"','"+city+"','"+state+"','"+phNo+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Patientc.html'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>