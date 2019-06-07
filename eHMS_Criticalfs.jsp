<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>e-Hospital Management System</title>
</head>
<body>
<%!
String serielno,departmentnm,hospitalnm,city,state,rank,btnUp,btnDlt;

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
serielno=request.getParameter("cmbslno"); 
departmentnm=request.getParameter("cmbdeptnm");
hospitalnm=request.getParameter("txthospitalname");
city=request.getParameter("txtcity");
state=request.getParameter("cmbstate");
rank=request.getParameter("cmbrank");
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");
doConnect();
if(btnUp!=null){
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblCritical set DepartmentName='"+departmentnm+"',HospitalName='"+hospitalnm+"',City='"+city+"',State='"+state+"',Rank='"+rank+"' where SlNo='"+serielno+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Criticalfc.jsp'},100);");
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
	stmtdelete.executeUpdate("delete from eHMS_tblCritical where SlNo='"+serielno+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Criticalfc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to delete"+se);
	  }
	  }
	  
%>	



</body>
</html>
