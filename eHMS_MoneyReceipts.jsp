
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String  moneyRcptNo,date,ptntID,ptntName,locality,city,state,phoneNo,totalAmnt,pmtMode,referalNo,pmntDate,bankName,AmntPaid;
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
moneyRcptNo=request.getParameter("txtrcptno");
date=request.getParameter("dtdate");
ptntID=request.getParameter("cmbidno");
ptntName=request.getParameter("txtptntnm");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("txtstatenm");
phoneNo=request.getParameter("txtphno");
totalAmnt=request.getParameter("txttotalamnt");
pmtMode=request.getParameter("cmbmode");
referalNo=request.getParameter("txtreferenceno");
pmntDate=request.getParameter("dtdate");
bankName=request.getParameter("cmbbank");
AmntPaid=request.getParameter("txtamntpaid");
doConnect();
try{
    stmtInsert=conn.createStatement();
	stmtInsert.executeUpdate("Insert into eHMS_tblMoneyReceipt values('"+moneyRcptNo+"','"+date+"','"+ptntID+"','"+ptntName+"','"+locality+"','"+city+"','"+phoneNo+"','"+state+"','"+totalAmnt+"','"+pmtMode+"','"+referalNo+"','"+pmntDate+"','"+bankName+"','"+AmntPaid+"')");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Saved Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_MoneyReceiptc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      System.out.println("Unable to Save"+se);
	  }
%>
</body>
</html>