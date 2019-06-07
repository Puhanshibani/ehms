
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String refno,date,regdno,ptntname,age,sex,mrtlsts,phno,docnm,dept,wbc,rbc,hb,hct,mcv,pltlt,neutrophl,lymphocyt,monocyt,eosinophil,basophl,remark;
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
wbc=request.getParameter("txtwbc");
rbc=request.getParameter("txtrbc");
hb=request.getParameter("txthb");
hct=request.getParameter("txthct");
mcv=request.getParameter("txtmcv");
pltlt=request.getParameter("txtpltlt");
neutrophl=request.getParameter("txtntrphl");
lymphocyt=request.getParameter("txtlmphct");
monocyt=request.getParameter("txtlmnct");
eosinophil=request.getParameter("txtesnphl");
basophl=request.getParameter("txtbsphl");
remark=request.getParameter("txtrmk");
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblBlood values('"+refno+"','"+date+"','"+regdno+"','"+ptntname+"','"+age+"','"+sex+"','"+mrtlsts+"','"+phno+"','"+docnm+"','"+dept+"','"+wbc+"','"+rbc+"','"+hb+"','"+hct+"','"+mcv+"','"+pltlt+"','"+neutrophl+"','"+lymphocyt+"','"+monocyt+"','"+eosinophil+"','"+basophl+"','"+remark+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Bloodc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>