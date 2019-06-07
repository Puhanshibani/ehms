
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String regdNo,ptntNm,sex,locality,city,state,phNo,dtofregd,age,maritalStatus,btnUp,btnDlt;
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
regdNo=request.getParameter("cmbregno");  
dtofregd=request.getParameter("dtdor"); 
ptntNm=request.getParameter("txtptntrm"); 
age=request.getParameter("txtage");  
sex=request.getParameter("cmbsex");
maritalStatus=request.getParameter("cmbmaritalstatus");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("cmbstate");
phNo=request.getParameter("txtphno");
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");

doConnect();
if(btnUp!=null){
  
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblPatient set DtOfRegd='"+dtofregd+"',PatientName='"+ptntNm+"',Age='"+age+"',Sex='"+sex+"',MaritalStatus='"+maritalStatus+"',Locality='"+locality+"',City='"+city+"',State='"+state+"',PhoneNo='"+phNo+"' where RegistrationNo='"+regdNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Successfully.'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Patientfc.jsp'},100)");
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
	stmtdelete.executeUpdate("delete from eHMS_tblPatient where RegistrationNo='"+regdNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Successfully.'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Patientfc.jsp'},100)");
	out.println("</script>\n");
	}


 catch(SQLException se){
	      System.out.println("Unable to delete"+se);
	                    }
	  	}

%>
</body>
</html>