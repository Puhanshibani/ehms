
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String  refNo,date,ptntID,ptntName,sex,age,locality,city,state,phoneNo,trmntFor,roomNo,dept,doctorsNm,roomChrg,medicineChrg,otherChrg,totalChrg;
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
date=request.getParameter("dtdate");
ptntID=request.getParameter("cmbregdno");
ptntName=request.getParameter("txtptntnm");
sex=request.getParameter("txtsex");
age=request.getParameter("txtage");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("txtstatenm");
phoneNo=request.getParameter("txtphno");
trmntFor=request.getParameter("txttreatmentfor");
roomNo=request.getParameter("txtroom");
dept=request.getParameter("txtdept");
doctorsNm=request.getParameter("txtdctrnm");
roomChrg=request.getParameter("txtroomchrg");
medicineChrg=request.getParameter("txtmdcnchrg");
otherChrg=request.getParameter("txtotherchrg");
totalChrg=request.getParameter("txttotalchrg");
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblPatientDischarge values('"+refNo+"','"+date+"','"+ptntID+"','"+ptntName+"','"+sex+"','"+age+"','"+locality+"','"+city+"','"+phoneNo+"','"+state+"','"+trmntFor+"','"+roomNo+"','"+dept+"','"+doctorsNm+"','"+roomChrg+"','"+medicineChrg+"','"+otherChrg+"','"+totalChrg+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientDischargec.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>