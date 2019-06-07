
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String  serielNo,date,regdNo,ptntName,sex,age,locality,city,state,phoneNo,trmntFor,roomNo,currentStatus,doctorsNm,dept,doctorsAdvc;
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
serielNo=request.getParameter("txtsrlno");
date=request.getParameter("dtdate");
regdNo=request.getParameter("cmbregdno");
ptntName=request.getParameter("txtptntnm");
sex=request.getParameter("txtsex");
age=request.getParameter("txtage");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("txtstatenm");
phoneNo=request.getParameter("txtphno");
trmntFor=request.getParameter("txttreatmentfor");
roomNo=request.getParameter("txtroom");
currentStatus=request.getParameter("txtcrntsts");
doctorsNm=request.getParameter("cmbdctrname");
dept=request.getParameter("txtdept");
doctorsAdvc=request.getParameter("txtdctradvc");
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblPatientProgress values('"+serielNo+"','"+date+"','"+regdNo+"','"+ptntName+"','"+sex+"','"+age+"','"+locality+"','"+city+"','"+phoneNo+"','"+state+"','"+trmntFor+"','"+roomNo+"','"+currentStatus+"','"+doctorsNm+"','"+dept+"','"+doctorsAdvc+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientProgressc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>