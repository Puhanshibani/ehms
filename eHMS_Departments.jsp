<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>e-Hospital Management System</title>
</head>
<body>
<%!
String deptCd,deptNm,headOfDept;
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
deptCd=request.getParameter("txtdeptcd");
deptNm=request.getParameter("txtdeptnm");
headOfDept=request.getParameter("txthdofdept");
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tbldepartment values('"+deptCd+"','"+deptNm+"','"+headOfDept+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Departmentc.html'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to Save"+se);
	  }
%>
</body>
</html>
