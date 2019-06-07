
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String  refNo,date,ptntID,ptntName,sex,age,locality,city,state,phoneNo,trmntFor,roomNo,dept,doctorsNm,roomChrg,medicineChrg,otherChrg,totalChrg,btnUp,btnDlt;
Connection conn;
Statement stmtupdate,stmtdelete;
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
refNo=request.getParameter("cmbrefno");
date=request.getParameter("dtdate");
ptntID=request.getParameter("txtptntid");
ptntName=request.getParameter("txtptntnm");
sex=request.getParameter("txtsex");
age=request.getParameter("txtage");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("txtstatenm");
phoneNo=request.getParameter("txtphno");
trmntFor=request.getParameter("txttreatment");
roomNo=request.getParameter("txtroom");
dept=request.getParameter("txtdept");
doctorsNm=request.getParameter("txtdctrnm");
roomChrg=request.getParameter("txtroomchrg");
medicineChrg=request.getParameter("txtmdcnchrg");
otherChrg=request.getParameter("txtotherchrg");
totalChrg=request.getParameter("txttotalchrg");
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");
doConnect();
if(btnUp!=null){
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblPatientDischarge set Date='"+date+"',PatientId='"+ptntID+"',PtientName='"+ptntName+"',Sex='"+sex+"',Age='"+age+"',Locality='"+locality+"',City='"+city+"',State='"+state+"',PhoneNo='"+phoneNo+"',Treatment='"+trmntFor+"',RoomNo='"+roomNo+"',Department='"+dept+"',DoctorsName='"+doctorsNm+"',RoomCharge='"+roomChrg+"',MedicineCharge='"+medicineChrg+"',OtherCharge='"+otherChrg+"',TotalCharge='"+totalChrg+"' where RefNo='"+refNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientDischargefc.jsp'},100);");
	out.println("</script>\n");
	  }
 catch(SQLException se){
	      out.println("Unable to update"+se);
	  }
	  }
	
else
if(btnDlt!=null){
 
try{
    stmtdelete=conn.createStatement();
	stmtdelete.executeUpdate("delete from eHMS_tblPatientDischarge where RefNo='"+refNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientDischargefc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to delete"+se);
	  }
	  }
	  
%>
</body>
</html>