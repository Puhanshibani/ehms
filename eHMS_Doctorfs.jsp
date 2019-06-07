
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String dctrId,dctrNm,sex,locality,city,state,phNo,emailId,dtOfJoin,dept,image,btnUp,btnDlt;
Connection conn;
Statement  stmtupdate,stmtdelete;
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
dctrId=request.getParameter("cmbdctrid");
dctrNm=request.getParameter("txtdctrm");
sex=request.getParameter("cmbsex");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("cmbstate");
phNo=request.getParameter("txtphno");
emailId=request.getParameter("txtmlid");
dtOfJoin=request.getParameter("dtDOJ");
dept=request.getParameter("cmbdept");
image=request.getParameter("btnBrows");;
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");
doConnect();
if(btnUp!=null){
      
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tbldoctor set DoctorsName='"+dctrNm+"',Sex='"+sex+"',Locality='"+locality+"',City='"+city+"',State='"+state+"',PhoneNo='"+phNo+"',EmailId='"+emailId+"',DtOfJoin='"+dtOfJoin+"',Department='"+dept+"',Photo='"+image+"' where DoctorsId='"+dctrId+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Doctorfc.jsp'},100);");
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
	stmtdelete.executeUpdate("delete from eHMS_tbldoctor where DoctorsId='"+dctrId+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Doctorfc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to delete"+se);
	  }
	  }
	   
	  	  
%>	
</body>
</html>