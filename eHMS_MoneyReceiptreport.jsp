<%@page language="java" import="java.sql.*" contentType="text/html"%>
<html>
<head>
<title>Report Of Money Receipt Profile</title>
<script language="javascript">
function goHome(){
window.close();
}
</script>
</head>
<body background="tile.jpg" style="background-size:cover">
<%!
Connection conn;
Statement stmtSelect;
ResultSet rsData;
String rcptno,date,ptntID,ptntNm,locality,city,state,phNo,totalamnt,pmtMode,referalNo,pmntDate,bankName,AmntPaid;
int slno;
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

<table width="100%">
<tr>
	<td align="center"><img src="home2.png" width="40" height="40" align="left" onclick="goHome()"><font color="black" size="7"><U>M<font color="white" size="6">oney &nbsp; <font color="black" size="7">R<font color="white" size="6">eceipt &nbsp;<font color="black" size="7">I<font color="white" size="6">nformation</U></td>
</tr>
</table>

<blockquote><font color="black"size="5">Sanjeevani Health Care <br> Madhupatna <br> Cuttack </blockquote>

<table width="95%" align="center">
<tr bgcolor="navy">
<td nowrap="nowrap"><font size="4" color="white">Sl No.</td>
<td nowrap="nowrap"><font size="4" color="white">Money Rcpt. No.</td>
<td><font size="4"  color="white">Date</td>
<td nowrap="nowrap"><font size="4"  color="white">Patient ID</td>
<td nowrap="nowrap"><font size="4"  color="white">Patient Name</td>
<td><font size="4"  color="white">Locality</td>
<td><font size="4"  color="white">City</td>
<td><font size="4"  color="white">State</td>
<td nowrap="nowrap"><font size="4"  color="white">Phone No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Total Amount</td>
<td nowrap="nowrap"><font size="4"  color="white">Paymentt Mode</td>
<td nowrap="nowrap"><font size="4"  color="white">Referal No.</td>
<td nowrap="nowrap"><font size="4"  color="white">Payment Date</td>
<td nowrap="nowrap"><font size="4"  color="white">Bank Name</td>
<td nowrap="nowrap"><font size="4"  color="white">Amount Paid</td>
</tr>
<%
doConnect();
try{
stmtSelect=conn.createStatement();
rsData=stmtSelect.executeQuery("select * from eHMS_tblMoneyReceipt");
slno=1;
while(rsData.next()){
rcptno=rsData.getString("MoneyReceiptNo");
date=rsData.getString("Date");
ptntID=rsData.getString("PatientID");
ptntNm=rsData.getString("PatientName");
locality=rsData.getString("Locality");
city=rsData.getString("City");
state=rsData.getString("State");
phNo=rsData.getString("PhoneNo");
totalamnt=rsData.getString("TotalAmount");
pmtMode=rsData.getString("PaymentMode");
referalNo=rsData.getString("ReferalNo");
pmntDate=rsData.getString("PaymentDate");
bankName=rsData.getString("BankName");
AmntPaid=rsData.getString("Amount");

if(slno%2==1)
out.println("<tr bgcolor=lightblue>");
else
out.println("<tr bgcolor=white>");
%>
<td><%=slno%></td>
<td><%=rcptno%></td>
<td><%=date%></td>
<td><%=ptntID%></td>
<td><%=ptntNm%></td>
<td><%=locality%></td>
<td><%=city%></td>
<td><%=state%></td>
<td><%=phNo%></td>
<td><%=totalamnt%></td>
<td><%=pmtMode%></td>
<td><%=referalNo%></td>
<td><%=pmntDate%></td>
<td><%=bankName%></td>
<td><%=AmntPaid%></td>
</tr>
<%
slno=slno+1;
}
}
catch(SQLException se){
out.println("Error");
}
%>
</table>
</body>
</html>








