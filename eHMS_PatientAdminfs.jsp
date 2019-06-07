
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String refNo,date,regdNo,ptntName,age,sex,maritalSts,locality,city,phoneNo,state,treatment,hospital,prevDctrNm,remark,trmntFor,doctorsNm,dept,roomNo,btnUp,btnDlt;
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
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");

doConnect();
if(btnUp!=null){
  
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblPatientAdmin set Date='"+date+"',RegdNo='"+regdNo+"',PatientName='"+ptntName+"',Age='"+age+"',Sex='"+sex+"',MaritalStatus='"+maritalSts+"',Locality='"+locality+"',City='"+city+"',PhoneNo='"+phoneNo+"',State='"+state+"',Treatment='"+treatment+"',Hospital='"+hospital+"',PrevDoctorsName='"+prevDctrNm+"',Remark='"+remark+"',TreatmentFor='"+trmntFor+"',DoctorsName='"+doctorsNm+"',Department='"+dept+"',RoomNo='"+roomNo+"' where RefNo='"+refNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Successfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientAdminfc.jsp'},100);");
	out.println("</script>\n");
	}
 catch(SQLException se){
	      System.out.println("Unable to update"+se);
	  }
	  
	  }
	  else
	  if(btnDlt!=null){
    
	try{
    stmtdelete=conn.createStatement();
	stmtdelete.executeUpdate("delete from eHMS_tblPatientAdmin where RefNo='"+refNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Successfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientAdminfc.jsp'},100);");
	out.println("</script>\n");
	    }
      catch(SQLException se){
	      System.out.println("Unable to delete"+se);
	                         }
	  	             }

%>
</body>
</html>