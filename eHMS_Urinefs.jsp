
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String refno,date,regdno,ptntname,age,sex,mrtlsts,phno,docnm,dept,app,rctn,spcfc,albmn,wall,lumen,remark,btnUp,btnDlt;
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
refno=request.getParameter("cmbrefno");
date=request.getParameter("dt");
regdno=request.getParameter("cmbregdno");
ptntname=request.getParameter("txtptntnm");
age=request.getParameter("txtage");
sex=request.getParameter("txtsex");
mrtlsts=request.getParameter("txtmrtlsts");
phno=request.getParameter("txtphno");
docnm=request.getParameter("txtdctrsnm");
dept=request.getParameter("txtdept");
app=request.getParameter("txtapp");
spcfc=request.getParameter("txtspc");
rctn=request.getParameter("txtrctn");
albmn=request.getParameter("txtalb");
wall=request.getParameter("txtwall");
lumen=request.getParameter("txtlumen");
remark=request.getParameter("txtremark");
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");
doConnect();
if(btnUp!=null){
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblUrine set Date='"+date+"',RegdNo='"+regdno+"',PatientName='"+ptntname+"',Age='"+age+"',Sex='"+sex+"',MaritalStatus='"+mrtlsts+"',PhNo='"+phno+"',DoctorName='"+docnm+"',Department='"+dept+"',Appearance='"+app+"',SpecificGravity='"+spcfc+"',Reaction='"+rctn+"',Albumin='"+albmn+"',WallThickness='"+wall+"',Lumen='"+lumen+"',Remark='"+remark+"' where RefNo='"+refno+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Urinefc.jsp'},100);");
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
	stmtdelete.executeUpdate("delete from eHMS_tblUrine where RefNo='"+refno+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Urinefc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to delete"+se);
	  }
	  }
	  
%>
</body>
</html>