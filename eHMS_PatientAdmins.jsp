
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String refNo,date,regdNo,ptntName,age,sex,maritalSts,locality,city,phoneNo,state,treatment,hospital,prevDctrNm,remark,trmntFor,doctorsNm,dept,roomNo;
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
refNo=request.getParameter("txtrefno");
date=request.getParameter("dt");
regdNo=request.getParameter("cmbregdno");
ptntName=request.getParameter("txtptntnm");
age=request.getParameter("txtage");
sex=request.getParameter("txtsex");
maritalSts=request.getParameter("txtmrtlsts");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
phoneNo=request.getParameter("txtphno");
state=request.getParameter("txtstatenm");
treatment=request.getParameter("txttreatment");
hospital=request.getParameter("txthospital");
prevDctrNm=request.getParameter("txtdctrnm");
remark=request.getParameter("txtremark");
trmntFor=request.getParameter("txttrmntfor");
doctorsNm=request.getParameter("cmbdctrname");
dept=request.getParameter("txtdept");
roomNo=request.getParameter("txtroom");

doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblPatientAdmin values('"+refNo+"','"+date+"','"+regdNo+"','"+ptntName+"','"+age+"','"+sex+"','"+maritalSts+"','"+locality+"','"+city+"','"+phoneNo+"','"+state+"','"+treatment+"','"+hospital+"','"+prevDctrNm+"','"+remark+"','"+trmntFor+"','"+doctorsNm+"','"+dept+"','"+roomNo+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientAdminc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>