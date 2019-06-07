
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String refno,date,regdno,ptntname,age,sex,mrtlsts,phno,docnm,dept,wbc,rbc,hb,hct,mcv,pltlt,neutrophl,lymphocyt,monocyt,eosinophil,basophl,remark,btnUp,btnDlt;
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
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");
doConnect();
if(btnUp!=null){
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblBlood set Date='"+date+"',RegdNo='"+regdno+"',PatientName='"+ptntname+"',Age='"+age+"',Sex='"+sex+"',MaritalStatus='"+mrtlsts+"',PhNo='"+phno+"',DocNm='"+docnm+"',Department='"+dept+"',WBC='"+wbc+"',RBC='"+rbc+"',HB='"+hb+"',HCT='"+hct+"',MCV='"+mcv+"',Platelate='"+pltlt+"',Neutrophil='"+neutrophl+"',Lymphocyte='"+lymphocyt+"',Monocyte='"+monocyt+"',Eosinophil='"+eosinophil+"',Basophil='"+basophl+"',Remark='"+remark+"' where RefNo='"+refno+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Bloodfc.jsp'},100);");
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
	stmtdelete.executeUpdate("delete from eHMS_tblBlood where RefNo='"+refno+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_Bloodfc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to delete"+se);
	  }
	  }
	  
%>
</body>
</html>