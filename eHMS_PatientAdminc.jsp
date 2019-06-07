<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String regdno,dctrNm,ptntNm[],age[],sex[],maritalSts[],locality[],city[],phNo[],state[],dept[];
Connection conn;
Statement stmtshowregdno,stmtshowdctrname,stmtDctrData,stmtptntData;
ResultSet rsshowregdno,rsshowdctrname,rsDctrData,rsptntData;
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
age=new String[30];
sex=new String[30];
maritalSts=new String[30];
locality=new String[30];
city=new String[30];
state=new String[30];
phNo=new String[30];
doConnect();
try{
stmtptntData=conn.createStatement();
rsptntData=stmtptntData.executeQuery("select * from eHMS_tblPatient");
i=0;
while(rsptntData.next()){
ptntNm[i]=rsptntData.getString("PatientName");
age[i]=rsptntData.getString("Age");
sex[i]=rsptntData.getString("Sex");
maritalSts[i]=rsptntData.getString("MaritalStatus");
locality[i]=rsptntData.getString("Locality");
city[i]=rsptntData.getString("City");
state[i]=rsptntData.getString("State");
phNo[i]=rsptntData.getString("PhoneNo");
i=i+1;
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
<%
dept=new String[30];
doConnect();
try{
stmtDctrData=conn.createStatement();
rsDctrData=stmtDctrData.executeQuery("select * from eHMS_tbldoctor");
i=0;
while(rsDctrData.next()){
dept[i]=rsDctrData.getString("Department");
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
var jage=new Array();
var jsex=new Array(); 
var jmaritalSts=new Array();
var jlocality=new Array();
var jcity=new Array();
var jstate=new Array();
var jphNo=new Array();
var j=0,k;
<%
i=0;
while(i<ptntNm.length){
%>
jptntNm[j]="<%=ptntNm[i]%>";
jage[j]="<%=age[i]%>";
jsex[j]="<%=sex[i]%>"; 
jmaritalSts[j]="<%=maritalSts[i]%>";
jlocality[j]="<%=locality[i]%>";
jcity[j]="<%=city[i]%>";
jstate[j]="<%=state[i]%>";
jphNo[j]="<%=phNo[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbregdno.selectedIndex;
document.f1.txtptntnm.value=jptntNm[k-1];
document.f1.txtage.value=jage[k-1];
document.f1.txtsex.value=jsex[k-1];
document.f1.txtmrtlsts.value=jmaritalSts[k-1];
document.f1.txtloc.value=jlocality[k-1];
document.f1.txtcity.value=jcity[k-1];
document.f1.txtstatenm.value=jstate[k-1];
document.f1.txtphno.value=jphNo[k-1];
}

function showDoctorData(){
var jdept=new Array();
var j=0,k;
<%
i=0;
while(i<dept.length){
%>
jdept[j]="<%=dept[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbdctrname.selectedIndex;
jdept[k-1]=jdept[k-1].trim();
document.f1.txtdept.value=jdept[k-1];
}



function goFind(){
window.location="eHMS_PatientAdminfc.jsp";
}
function goHome(){
window.close();
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_PatientAdmins.jsp" method="post">
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
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>P a t i e n t  &nbsp;&nbsp;&nbsp;  A d m i s s i o n &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="75%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr>
<br>
<td nowrap="nowrap"><b>Ref. No.</b></td>
<td><input type="text" name="txtrefno" placeholder="example REF001" required><font color="red">*</td>
<td><b>Date </b> </td>
<td><input type="date" name="dt"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Regd. No.</b></td>
<td><select name="cmbregdno" onchange="showPatientData()">
<option value="Null">--select--</option>
<%
doConnect();
try{
stmtshowregdno=conn.createStatement();
rsshowregdno=stmtshowregdno.executeQuery("select * from eHMS_tblPatient");
while(rsshowregdno.next()){
regdno=rsshowregdno.getString("RegistrationNo");
%>
<option value="<%=regdno%>"><%=regdno%></option>
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
<td><b>Age</b></td>
<td><input type="text" name="txtage" placeholder="Only Numeric Allowed"></td>
</tr>

<tr>
<td><b>Sex</b></td>
<td><input type="text" name="txtsex"></td>
<td nowrap="nowrap"><b>Marital Status</b></td>
<td><input type="text" name="txtmrtlsts"></td>
</tr>

<tr>
<td><b>Locality</b></td>
<td><input type="text" name="txtloc"></td>
<td><b>City</b></td>
<td><input type="text" name="txtcity"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Phone No.</b></td>
<td><input type="text" name="txtphno"></td>
<td><b>State</b></td>
<td><input type="text" name="txtstatenm"></td>
</tr>
<tr>
<td><font color="blue" face="Comic Sans MS" size="3"><b><U>Previous Medical History</b></td>
</tr>
<tr>
<td><b>Treatment</b></td>
<td><input type="text" name="txttreatment"></td>
<td><b>Hospital</b></td>
<td><input type="text" name="txthospital"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Doctor's Name</b></td>
<td><input type="text" name="txtdctrnm"></td>
</tr>
<tr>
<td><b>Remark</b></td>
<td><input type="text" name="txtremark"></td>
</tr>
<tr>
<td><font color="blue" face="Comic Sans MS" size="3"><b><U>Treatment History</b></td></tr>
<tr>
<td nowrap="nowrap"><b>Treatment For</b></td>
<td><input type="text" name="txttrmntfor"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Doctor's  Name</b></td>
<td><select name="cmbdctrname" onchange="showDoctorData()">
<option value="Null">--select--</option>
<%
doConnect();
try{
stmtshowdctrname=conn.createStatement();
rsshowdctrname=stmtshowdctrname.executeQuery("select * from eHMS_tbldoctor");
while(rsshowdctrname.next()){
dctrNm=rsshowdctrname.getString("DoctorsName");
%>
<option value="<%=dctrNm%>"><%=dctrNm%></option>
<%
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
</select>
</td>
<tr>
<td><b>Department</b></td>
<td><input type="text" name="txtdept"></td>
<td nowrap="nowrap"><b>Room No.</b></td>
<td><input type="text" name="txtroom"></td>
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