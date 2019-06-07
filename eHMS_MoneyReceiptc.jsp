<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String idno,ptntNm[],locality[],city[],state[],phNo[],totalamnt[];
Connection conn;
Statement stmtshowidno,stmtptntData;
ResultSet rsshowidno,rsptntData;
int i;
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

ptntNm=new String[30];
locality=new String[30];
city=new String[30];
state=new String[30];
phNo=new String[30];
totalamnt=new String[30];
doConnect();
try{
stmtptntData=conn.createStatement();
rsptntData=stmtptntData.executeQuery("select * from eHMS_tblPatientDischarge");
i=0;
while(rsptntData.next()){
ptntNm[i]=rsptntData.getString("PtientName");
locality[i]=rsptntData.getString("Locality");
city[i]=rsptntData.getString("City");
state[i]=rsptntData.getString("State");
phNo[i]=rsptntData.getString("PhoneNo");
totalamnt[i]=rsptntData.getString("TotalCharge");
i=i+1;
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>

<html>
<head>
<title>e-Hospital Management System</title>
<script language="javascript">
var images= new Array();
images[0]='2.jpg';
images[1]='3.jpg';
images[2]='4.jpg';
images[3]='5.jpg';
var i=0;
var time=2000;
function slideShow(){
document.slide.src=images[i];
if(i< images.length-1){
i=i+1;
} else{
i=0;
}
setTimeout("slideShow()",time);
}
window.onload=slideShow;

function showPatientData(){
var jptntNm=new Array();
var jlocality=new Array();
var jcity=new Array();
var jstate=new Array();
var jphNo=new Array();
var jtotalamnt=new Array();
var j=0,k;
<%
i=0;
while(i<ptntNm.length){
%>
jptntNm[j]="<%=ptntNm[i]%>";
jlocality[j]="<%=locality[i]%>";
jcity[j]="<%=city[i]%>";
jstate[j]="<%=state[i]%>";
jphNo[j]="<%=phNo[i]%>";
jtotalamnt[j]="<%=totalamnt[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbidno.selectedIndex;
document.f1.txtptntnm.value=jptntNm[k-1];
document.f1.txtloc.value=jlocality[k-1];
document.f1.txtcity.value=jcity[k-1];
document.f1.txtstatenm.value=jstate[k-1];
document.f1.txtphno.value=jphNo[k-1];
document.f1.txttotalamnt.value=jtotalamnt[k-1];
}

function goFind(){
window.location="eHMS_MoneyReceiptfc.jsp";
}

function showTotalcharge() {
var rmchrg,mdcnchrg,othrchrg,totalcharge;
rmchrg=parseFloat(document.f1.txtroomchrg.value);
mdcnchrg=parseFloat(document.f1.txtmdcnchrg.value);
othrchrg=parseFloat(document.f1.txtotherchrg.value);
totalcharge= rmchrg+mdcnchrg+othrchrg;
document.f1.txttotalchrg.value=totalcharge;
}
function goHome(){
window.close();
}

</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_MoneyReceipts.jsp" method="post">
<table width="100%">
<tr>
	<td align="left" width="50%"><font color="maroon" face="Comic Sans MS" size="8">H<font color="red" face="Comic Sans MS" size="6">ospital
	<font color="maroon" size="8">M<font color="red" size="6">anagement
	<font color="maroon" size="8">S<font color="red" size="6">ystem</font></td>
	<td align="right"><img src="cover.jpg"name="imgName" height="70" width="450">&nbsp;<img src="logoo.jpg" width="100" height="70"></td>
</tr>
</table>                                                                                                                
   
<hr width="85%" size="3" color="red">
<hr width="100%" size="4" color="black">
<br>

<table width="70%" height="45%" align="center"  background="bk4.jpg"  style="border-radius:60px 0px 60px 0px">
<tr>
	<td style="border-radius:60px 0px 0px 0px">
		<table width="100%" height="30" style="border-radius:60px 0px 0px 0px"><tr>
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>M o n e y  &nbsp;&nbsp;&nbsp;  R e c e i p t &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="70%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr>
<br>
<td nowrap="nowrap"><b>Money Receipt No.</b></td>
<td><input type="text" name="txtrcptno" required><font color="red">*</td>
<td><b>Date </b> </td>
<td><input type="date" name="dtdate"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Patient ID.</b></td>
<td><select name="cmbidno" onchange="showPatientData()">
<option value="Null">--select--</option>
<%
doConnect();
try{
stmtshowidno=conn.createStatement();
rsshowidno=stmtshowidno.executeQuery("select * from eHMS_tblPatientDischarge");
while(rsshowidno.next()){
idno=rsshowidno.getString("PatientId");
%>
<option value="<%=idno%>"><%=idno%></option>
<%
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
</select>
</td>
</tr>
<tr>
<td nowrap="nowrap"><b>Patient Name</b></td>
<td><input type="text" name="txtptntnm"></td>
</tr>
<tr>
<td><b>Locality</b></td>
<td><input type="text" name="txtloc"></td>
<td><b>City</b></td>
<td><input type="text" name="txtcity"></td>
</tr>
<tr>
<td><b>State</b></td>
<td><input type="text" name="txtstatenm"></td>
<td nowrap="nowrap"><b>Phone No.</b></td>
<td><input type="text" name="txtphno"></td>
</tr>
<tr>
<tr>
<td nowrap="nowrap"><b>Total Amount</b></td>
<td><input type="text" name="txttotalamnt"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Payment Mode</b></td>
<td><select name="cmbmode">
<option value="Null">select</option>
<option value="Cash">Cash</option>
<option value="Check">Cheque</option>
<option value="Draft">Draft</option>
<option value="Debit Card">Debit Card</option>
<option value="Credit Card">Credit Card</option>
</select>
</td>
</tr>
<tr>
<td nowrap="nowrap"><b>CHQ/DD/Card Reference No.</b></td>
<td><input type="text" name="txtreferenceno"></td>
<td><b>Date </b> </td>
<td><input type="date" name="dtdate"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Bank Name</b></td>
<td><select name="cmbbank">
<option value="Null">select</option>
<option value="SBI">SBI</option>
<option value="Axis">Axis</option>
<option value="HDFC">HDFC</option>
<option value="Oriental">Oriental</option>
<option value="IndusInd">IndusInd</option>
<option value="Canara">Canara</option>
<option value="Bank Of Baroda">Baroda</option>
<option value="IDBI">IDBI</option>
<option value="Bank Of India">India</option>
<option value="Allahabad">Allahabad</option>
<option value="ICICI">ICICI</option>
<option value="Yes Bank">YES</option>
</select>
</td>
</tr>
<tr>
<td nowrap="nowrap"><b>Amount Paid</b></td>
<td><input type="text" name="txtamntpaid"></td>
</tr>
<tr>
</table>
<br>
<center>
<input type="button" name="gotohome" value= "Go To Home" style="color:black;border-radius:20px;background-color:white;height:25px" onclick="goHome()">
<input type="submit" name="Submit" value="Submit" style="color:black;border-radius:20px;background-color:white;height:25px">
<input type="button" name="Find" value= "Find" style="color:black;border-radius:20px;background-color:white;height:25px"  onclick="goFind()"> 
<input type="reset" name="Reset" value=" Reset" style="color:black;border-radius:20px;background-color:white;height:25px">
</center>
<br>
</td>
</tr>
</table>
</form>
<br><br><br>

<center>
<img src="#" name="slide" height="20%" width="70%">
</center>

<table width="100%" bgcolor="white" height="30">
<tr>
		<td width="88%">
			<font color="blue" size="4"><marquee behavior="alternate">Designed and Developed By:<I><b><U>&nbsp; SUSMITA DAS &nbsp;&nbsp; & &nbsp;&nbsp; SHIBANI PUHAN...</b></I></marquee>
		</td>
		<td align="right"><font color="black"><b>&copy;All rights Reserved</font></td>
</tr>
</table>
</body>
</html>