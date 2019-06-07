
<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title> HospitalProfile Server</title>
</head>
<body>
<%!
String  moneyRcptNo,date,ptntID,ptntName,locality,city,state,phoneNo,totalAmnt,pmtMode,referalNo,pmntDate,bankName,AmntPaid,btnUp,btnDlt;
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
moneyRcptNo=request.getParameter("cmbrcptno");
date=request.getParameter("dtdate1");
ptntID=request.getParameter("cmbidno");
ptntName=request.getParameter("txtptntnm");
locality=request.getParameter("txtloc");
city=request.getParameter("txtcity");
state=request.getParameter("txtstatenm");
phoneNo=request.getParameter("txtphno");
totalAmnt=request.getParameter("txttotalamnt");
pmtMode=request.getParameter("cmbmode");
referalNo=request.getParameter("txtreferenceno");
pmntDate=request.getParameter("dtdate2");
bankName=request.getParameter("cmbbank");
AmntPaid=request.getParameter("txtamntpaid");
btnUp=request.getParameter("btnUpdate");
btnDlt=request.getParameter("btnDelete");
doConnect();
if(btnUp!=null){
try{
    stmtupdate=conn.createStatement();
	stmtupdate.executeUpdate("update eHMS_tblMoneyReceipt set Date='"+date+"',PatientID='"+ptntID+"',PatientName='"+ptntName+"',Locality='"+locality+"',City='"+city+"',State='"+state+"',PhoneNo='"+phoneNo+"',TotalAmount='"+totalAmnt+"',PaymentMode='"+pmtMode+"',ReferalNo='"+referalNo+"',PaymentDate='"+pmntDate+"',BankName='"+bankName+"',Amount='"+AmntPaid+"' where MoneyReceiptNo='"+moneyRcptNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Updated Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_MoneyReceiptfc.jsp'},100);");
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
	stmtdelete.executeUpdate("delete from eHMS_tblMoneyReceipt where MoneyReceiptNo='"+moneyRcptNo+"'");
	out.println("<Script type='text/javascript'>");
	out.println("alert("+"'Your Data Deleted Succesfully'"+");\n");
	out.println("setTimeout(function(){window.location.href='eHMS_MoneyReceiptfc.jsp'},100);");
	out.println("</script>\n");
}
 catch(SQLException se){
	      out.println("Unable to delete"+se);
	  }
	  }
%>
</body>
</html>