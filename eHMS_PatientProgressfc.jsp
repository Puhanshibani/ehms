<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String srlno,regdno,dctrNm,date[],regno[],ptntNm[],sex[],age[],locality[],city[],state[],phNo[],trtmntFor[],roomNo[],crntStatus[],doctorsNm[],department[],dctrsAdvc[],dept[];
Connection conn;
Statement stmtshowsrlno,stmtsetsrldata,stmtshowregdno,stmtshowdctrname,stmtDctrData,stmtptntData;
ResultSet rsshowsrlno,rssetsrldata, rsshowregdno,rsshowdctrname,rsDctrData,rsptntData;
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
date=new String[30];
regno=new String[30];
ptntNm=new String[30];
age=new String[30];
sex=new String[30];
locality=new String[30];
city=new String[30];
state=new String[30];
phNo=new String[30];
trtmntFor=new String[30];
roomNo=new String[30];
crntStatus=new String[30];
doctorsNm=new String[30];
department=new String[30];
dctrsAdvc=new String[30];

doConnect();
try{
stmtsetsrldata=conn.createStatement();
rssetsrldata=stmtsetsrldata.executeQuery("select * from eHMS_tblPatientProgress");
i=0;
while(rssetsrldata.next()){
date[i]=rssetsrldata.getString("Date");
regno[i]=rssetsrldata.getString("PatientRegNo");
ptntNm[i]=rssetsrldata.getString("PatientName");
sex[i]=rssetsrldata.getString("Sex");
age[i]=rssetsrldata.getString("Age");
locality[i]=rssetsrldata.getString("Locality");
city[i]=rssetsrldata.getString("City");
state[i]=rssetsrldata.getString("State");
phNo[i]=rssetsrldata.getString("PhoneNo");
trtmntFor[i]=rssetsrldata.getString("TreatmentFor");
roomNo[i]=rssetsrldata.getString("RoomNo");
crntStatus[i]=rssetsrldata.getString("CurrentStatus");
doctorsNm[i]=rssetsrldata.getString("DoctorsName");
department[i]=rssetsrldata.getString("Department");
dctrsAdvc[i]=rssetsrldata.getString("DoctorsAdvice");

i=i+1;
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
<%

ptntNm=new String[30];
sex=new String[30];
age=new String[30];
locality=new String[30];
city=new String[30];
state=new String[30];
phNo=new String[30];
trtmntFor=new String[30];
roomNo=new String[30];
doConnect();
try{
stmtptntData=conn.createStatement();
rsptntData=stmtptntData.executeQuery("select * from eHMS_tblPatientAdmin");
i=0;
while(rsptntData.next()){
ptntNm[i]=rsptntData.getString("PatientName");
age[i]=rsptntData.getString("Age");
sex[i]=rsptntData.getString("Sex");
locality[i]=rsptntData.getString("Locality");
city[i]=rsptntData.getString("City");
phNo[i]=rsptntData.getString("PhoneNo");
state[i]=rsptntData.getString("State");
trtmntFor[i]=rsptntData.getString("TreatmentFor");
roomNo[i]=rsptntData.getString("RoomNo");
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


function setSerielData(){
var jdate=new Array();
var jregno=new Array();
var jptntNm=new Array();
var jsex=new Array();
var jage=new Array();
var jlocality=new Array();
var jcity=new Array();
var jphNo=new Array();
var jstate=new Array();
var jtrtmntFor=new Array();
var jroomNo=new Array();
var jcurrentSts=new Array();
var jdctrNm=new Array();
var jdepartment=new Array();
var jdoctorAdvc=new Array();

var j=0,k;
<%
i=0;
while(i<date.length){
%>
jdate[j]="<%=date[i]%>";
jregno[j]="<%=regno[i]%>";
jptntNm[j]="<%=ptntNm[i]%>";
jsex[j]="<%=sex[i]%>";
jage[j]="<%=age[i]%>"; 
jlocality[j]="<%=locality[i]%>";
jcity[j]="<%=city[i]%>";
jstate[j]="<%=state[i]%>";
jphNo[j]="<%=phNo[i]%>";
jtrtmntFor[j]="<%=trtmntFor[i]%>";
jroomNo[j]="<%=roomNo[i]%>";
jcurrentSts[j]="<%=crntStatus[i]%>";
jdctrNm[j]="<%=doctorsNm[i]%>";
jdepartment[j]="<%=department[i]%>";
jdoctorAdvc[j]="<%=dctrsAdvc[i]%>";

j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbsrlno.selectedIndex;
document.f1.dtdate.value=jdate[k-1];
jregno[k-1]=jregno[k-1].trim();
document.f1.cmbregno.value=jregno[k-1];
document.f1.txtptntnm.value=jptntNm[k-1];
document.f1.txtsex.value=jsex[k-1];
document.f1.txtage.value=jage[k-1];
document.f1.txtloc.value=jlocality[k-1];
document.f1.txtcity.value=jcity[k-1];
document.f1.txtstatenm.value=jstate[k-1];
document.f1.txtphno.value=jphNo[k-1];
document.f1.txttreatmentfor.value=jtrtmntFor[k-1];
document.f1.txtroom.value=jroomNo[k-1];
document.f1.txtcrntsts.value=jcurrentSts[k-1];
jdctrNm[k-1]=jdctrNm[k-1].trim();
document.f1.cmbdctrname.value=jdctrNm[k-1];
document.f1.txtdept.value=jdepartment[k-1];
document.f1.txtdctradvc.value=jdoctorAdvc[k-1];


}

function showPatientData(){
var jptntNm=new Array();
var jsex=new Array(); 
var jage=new Array();
var jlocality=new Array();
var jcity=new Array();
var jstate=new Array();
var jphNo=new Array();
var jtrtmntFor=new Array();
var jroomNo=new Array();
var j=0,k;
<%
i=0;
while(i<ptntNm.length){
%>
jptntNm[j]="<%=ptntNm[i]%>";
jsex[j]="<%=sex[i]%>";
jage[j]="<%=age[i]%>";
jlocality[j]="<%=locality[i]%>";
jcity[j]="<%=city[i]%>";
jstate[j]="<%=state[i]%>";
jphNo[j]="<%=phNo[i]%>";
jtrtmntFor[j]="<%=trtmntFor[i]%>";
jroomNo[j]="<%=roomNo[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbregno.selectedIndex;
document.f1.txtptntnm.value=jptntNm[k-1];
document.f1.txtsex.value=jsex[k-1];
document.f1.txtage.value=jage[k-1];
document.f1.txtloc.value=jlocality[k-1];
document.f1.txtcity.value=jcity[k-1];
document.f1.txtstatenm.value=jstate[k-1];
document.f1.txtphno.value=jphNo[k-1];
document.f1.txttreatmentfor.value=jtreatment[k-1];
document.f1.txtroom.value=jroomNo[k-1];
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



function goBack(){
window.location="eHMS_PatientProgressc.jsp";
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_PatientProgressfs.jsp" method="post">
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
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>P a t i e n t  &nbsp;&nbsp;&nbsp;  P r o g r e s s &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="70%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr>
<br>
<td nowrap="nowrap"><b>Ref. No.</b></td>
<td><select name="cmbsrlno" onchange="setSerielData()" >
<option value="Null">--select--</option>
<%
doConnect();
try{
stmtshowsrlno=conn.createStatement();
rsshowsrlno=stmtshowsrlno.executeQuery("select * from eHMS_tblPatientProgress");
while(rsshowsrlno.next()){
srlno=rsshowsrlno.getString("SerialNo");
%>
<option value="<%=srlno%>"><%=srlno%></option>
<%
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
</select>
</td>
<td><b>Date </b> </td>
<td><input type="date" name="dtdate"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Patient Regd. No.</b></td>
<td><select name="cmbregno" onchange="showPatientData()">
<option value="Null">--select--</option>
<%
doConnect();
try{
stmtshowregdno=conn.createStatement();
rsshowregdno=stmtshowregdno.executeQuery("select * from eHMS_tblPatientAdmin");
while(rsshowregdno.next()){
regdno=rsshowregdno.getString("RegdNo");
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
</tr>

<tr>
<td><b>Sex</b></td>
<td><input type="text" name="txtsex"></td>
<td><b>Age</b></td>
<td><input type="text" name="txtage" ></td>
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
<td nowrap="nowrap"><b>Treatment For</b></td>
<td><input type="text" name="txttreatmentfor"></td>
<td nowrap="nowrap"><b>Room No.</b></td>
<td><input type="text" name="txtroom"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Current Status</b></td>
<td><input type="text" name="txtcrntsts"></td>
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
</tr>
<tr>
<td nowrap="nowrap"><b>Doctor's Advice</b></td>
<td><input type="text" name="txtdctradvc"></td>
</tr>
<tr>
</table>
<br>
<center>
<input type="submit"  name="btnUpdate"  value="Update" style="color:black;border-radius:20px;background-color:white;height:25px">
<input type="button" name="Back" value= "Back" style="color:black;border-radius:20px;background-color:white;height:25px"  onclick="goBack()"> 
<input type="submit" name="btnDelete" value=" Delete" style="color:black;border-radius:20px;background-color:white;height:25px">
</center>
<br>
</td>
</tr>
</table>
</form>
<br><br>

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