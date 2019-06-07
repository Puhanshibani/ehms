
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String srlno,date,regdNo,ptntName,age,sex,locality,city,phoneNo,state,trmntFor,roomNo,crntStatus,doctorsNm,dept,dctrsAdvc,btnUp,btnDlt;
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
srlno=request.getParameter("cmbsrlno");
date=request.getParameter("dtdate");
regdNo=request.getParameter("cmbregno");
ptntName=request.getParameter("txtptntnm");
age=request.getParameter("txtage");
sex=request.getParameter("txtsex");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
phoneNo=request.getParameter("txtphno");
state=request.getParameter("txtstatenm");
trmntFor=request.getParameter("txttreatmentfor");
roomNo=request.getParameter("txtroom");
crntStatus=request.getParameter("txtcrntsts");
doctorsNm=request.getParameter("cmbdctrname");
dept=request.getParameter("txtdept");
dctrsAdvc=request.getParameter("txtdctradvc");
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");

doConnect();
if(btnUp!=null){
  
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblPatientProgress set Date='"+date+"',PatientRegNo='"+regdNo+"',PatientName='"+ptntName+"',Sex='"+sex+"',Age='"+age+"',Locality='"+locality+"',City='"+city+"',State='"+state+"',PhoneNo='"+phoneNo+"',TreatmentFor='"+trmntFor+"',RoomNo='"+roomNo+"',CurrentStatus='"+crntStatus+"',DoctorsName='"+doctorsNm+"',Department='"+dept+"',DoctorsAdvice='"+dctrsAdvc+"' where SerialNo='"+srlno+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Successfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientProgressfc.jsp'},100);");
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
	stmtdelete.executeUpdate("delete from eHMS_tblPatientProgress where SerialNo='"+srlno+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Successfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_PatientProgressfc.jsp'},100);");
	out.println("</script>\n");
	    }
      catch(SQLException se){
	      System.out.println("Unable to delete"+se);
	                         }
	  	             }

%>
</body>
</html>