
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String refno,date,regdno,ptntname,age,sex,mrtlsts,phno,docnm,dept,app,rctn,spcfc,albmn,wall,lumen,remark;
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
refno=request.getParameter("txtrefno");
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
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblUrine values('"+refno+"','"+date+"','"+regdno+"','"+ptntname+"','"+age+"','"+sex+"','"+mrtlsts+"','"+phno+"','"+docnm+"','"+dept+"','"+app+"','"+spcfc+"','"+rctn+"','"+albmn+"','"+wall+"','"+lumen+"','"+remark+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Urinec.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>