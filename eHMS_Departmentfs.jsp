<%@page language="java" import="java.sql.*" contentType="text/html"%>


<html>
<head>
<title>e-Hospital Management System</title>

</head>
<body>
<%!
String deptCd,deptNm,headOfDept,btnUp,btnDlt;

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
 
deptCd=request.getParameter("cmbdeptcd");
deptNm=request.getParameter("txtdeptnm");
headOfDept=request.getParameter("txthdofdept");
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");
doConnect();
if(btnUp!=null){
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblDepartment set DepartmentName='"+deptNm+"',HeadOfDepartment='"+headOfDept+"' where DepartmentCode='"+deptCd+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Departmentfc.jsp'},100);");
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
	stmtdelete.executeUpdate("delete from eHMS_tbldepartment where DepartmentCode='"+deptCd+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Departmentfc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to delete"+se);
	  }
	  }
	  
%>	



</body>
</html>
