<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String regNo,hosNm,contPerson,locality,city,state,phNo,faxNo,emailId,webSite,btnUp,btnDlt;
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
regNo=request.getParameter("cmbregno");
hosNm=request.getParameter("txthosnm");
contPerson=request.getParameter("txtcntprs");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("cmbstate");
phNo=request.getParameter("txtphno");
faxNo=request.getParameter("txtfaxno");
emailId=request.getParameter("txtmlid");
webSite=request.getParameter("txtwbstnm");
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");
doConnect();
if(btnUp!=null){
  try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblHospital set HospitalName='"+hosNm+"',ConPerson='"+contPerson+"',Locality='"+locality+"',City='"+city+"',State='"+state+"',PhNo='"+phNo+"',FaxNo='"+faxNo+"',Email='"+emailId+"',WebSite='"+webSite+"' where RegistrationNo='"+regNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Successfully.'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Hospitalfc.jsp'},100)");
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
	stmtdelete.executeUpdate("delete from eHMS_tblHospital where RegistrationNo='"+regNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Successfully.'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Hospitalfc.jsp'},100)");
	out.println("</script>\n");
	}
 catch(SQLException se){
	      System.out.println("Unable to delete"+se);
	                    }
	        	}

%>


</body>
</html>