<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String refNo,regdno,det[],regNo[],ptntNm[],age[],sex[],maritalSts[],phnNo[],dctrsNm[],dept[],app[],spcgrv[],rctn[],albmn[],wall[],lumen[],rmk[];
Connection conn;
Statement stmtshowrefno,stmtrefData,stmtshowregdno,stmtptntData;
ResultSet rsshowrefno,rsrefData,rsshowregdno,rsptntData;
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
det=new String[30];
regNo=new String[30];
ptntNm=new String[30];
age=new String[30];
sex=new String[30];
maritalSts=new String[30];
phnNo=new String[30];
dctrsNm=new String[30];
dept=new String[30];
app=new String[30];
spcgrv=new String[30];
rctn=new String[30];
albmn=new String[30];
wall=new String[30];
lumen=new String[30];
rmk=new String[30];

doConnect();
try{
stmtrefData=conn.createStatement();
rsrefData=stmtrefData.executeQuery("select * from eHMS_tblUrine");
i=0;
while(rsrefData.next()){
det[i]=rsrefData.getString("Date");
regNo[i]=rsrefData.getString("RegdNo");
ptntNm[i]=rsrefData.getString("PatientName");
age[i]=rsrefData.getString("Age");
sex[i]=rsrefData.getString("Sex");
maritalSts[i]=rsrefData.getString("MaritalStatus");
phnNo[i]=rsrefData.getString("PhNO");
dctrsNm[i]=rsrefData.getString("DoctorName");
dept[i]=rsrefData.getString("Department");
app[i]=rsrefData.getString("Appearance");
spcgrv[i]=rsrefData.getString("SpecificGravity");
rctn[i]=rsrefData.getString("Reaction");
albmn[i]=rsrefData.getString("Albumin");
wall[i]=rsrefData.getString("WallThickness");
lumen[i]=rsrefData.getString("Lumen");
rmk[i]=rsrefData.getString("Remark");

i=i+1;
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>





<%

ptntNm=new String[30];
age=new String[30];
sex=new String[30];
maritalSts=new String[30];
phnNo=new String[30];
dctrsNm=new String[30];
dept=new String[30];
doConnect();
try{
stmtptntData=conn.createStatement();
rsptntData=stmtptntData.executeQuery("select * from eHMS_tblPatientAdmin");
i=0;
while(rsptntData.next()){
ptntNm[i]=rsptntData.getString("PatientName");
age[i]=rsptntData.getString("Age");
sex[i]=rsptntData.getString("Sex");
maritalSts[i]=rsptntData.getString("MaritalStatus");
phnNo[i]=rsptntData.getString("PhoneNo");
dctrsNm[i]=rsptntData.getString("DoctorsName");
dept[i]=rsptntData.getString("Department");
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


function SetPatientData(){
var jdet=new Array();
var jregNo=new Array();
var jptntNm=new Array();
var jage=new Array();
var jsex=new Array(); 
var jmaritalSts=new Array();
var jphNo=new Array();
var jdctrsnm=new Array();
var jdept=new Array();
var japp=new Array();
var jspcgrv=new Array();
var jrctn=new Array();
var jalbmn=new Array();
var jwall=new Array();
var jlumen=new Array();
var jrmk=new Array();
var j=0,k;
<%
i=0;
while(i<det.length){
%>
jdet[j]="<%=det[i]%>";
jregNo[j]="<%=regNo[i]%>";
jptntNm[j]="<%=ptntNm[i]%>";
jage[j]="<%=age[i]%>";
jsex[j]="<%=sex[i]%>"; 
jmaritalSts[j]="<%=maritalSts[i]%>";
jphNo[j]="<%=phnNo[i]%>";
jdctrsnm[j]="<%=dctrsNm[i]%>";
jdept[j]="<%=dept[i]%>";
japp[j]="<%=app[i]%>";
jspcgrv[j]="<%=spcgrv[i]%>";
jrctn[j]="<%=rctn[i]%>";
jalbmn[j]="<%=albmn[i]%>";
jwall[j]="<%=wall[i]%>";
jlumen[j]="<%=lumen[i]%>";
jrmk[j]="<%=rmk[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbrefno.selectedIndex;
document.f1.dt.value=jdet[k-1];
jregNo[k-1]=jregNo[k-1].trim();
document.f1.cmbregdno.value=jregNo[k-1];
document.f1.txtptntnm.value=jptntNm[k-1];
document.f1.txtage.value=jage[k-1];
document.f1.txtsex.value=jsex[k-1];
document.f1.txtmrtlsts.value=jmaritalSts[k-1];
document.f1.txtphno.value=jphNo[k-1];
document.f1.txtdctrsnm.value=jdctrsnm[k-1];
document.f1.txtdept.value=jdept[k-1];
document.f1.txtapp.value=japp[k-1];
document.f1.txtspc.value=jspcgrv[k-1];
document.f1.txtrctn.value=jrctn[k-1];
document.f1.txtalb.value=jalbmn[k-1];
document.f1.txtwall.value=jwall[k-1];
document.f1.txtlumen.value=jlumen[k-1];
document.f1.txtremark.value=jrmk[k-1];
}


function showPatientData(){
var jptntNm=new Array();
var jage=new Array();
var jsex=new Array(); 
var jmaritalSts=new Array();
var jphNo=new Array();
var jdctrsnm=new Array();
var jdept=new Array();
var j=0,k;
<%
i=0;
while(i<ptntNm.length){
%>
jptntNm[j]="<%=ptntNm[i]%>";
jage[j]="<%=age[i]%>";
jsex[j]="<%=sex[i]%>"; 
jmaritalSts[j]="<%=maritalSts[i]%>";
jphNo[j]="<%=phnNo[i]%>";
jdctrsnm[j]="<%=dctrsNm[i]%>";
jdept[j]="<%=dept[i]%>";
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
document.f1.txtphno.value=jphNo[k-1];
document.f1.txtdctrsnm.value=jdctrsnm[k-1];
document.f1.txtdept.value=jdept[k-1];
}

function goBack(){
window.location="eHMS_Urinec.jsp";
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_Urinefs.jsp" method="post">
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

<table width="65%" height="50%" align="center"  background="bk4.jpg"  style="border-radius:60px 0px 60px 0px">
<tr>
	<td style="border-radius:60px 0px 0px 0px">
		<table width="100%" height="30" style="border-radius:60px 0px 0px 0px"><tr>
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>P a t i e n t  &nbsp;&nbsp;&nbsp; U r i n e     T e s t &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="75%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr>
<br>
<td><b>Ref. No.</b></td>
<td><select name="cmbrefno" onchange="SetPatientData()">
<option value="Null">--select--</option>
<%
doConnect();
try{
stmtshowrefno=conn.createStatement();
rsshowrefno=stmtshowrefno.executeQuery("select * from eHMS_tblUrine");
while(rsshowrefno.next()){
refNo=rsshowrefno.getString("RefNo");
%>
<option value="<%=refNo%>"><%=refNo%></option>
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
<td><input type="date" name="dt"></td>
</tr>
<tr>
<td><b>Regd. No.</b></td>
<td><select name="cmbregdno" onchange="showPatientData()">
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
<td><b>Patient Name</b></td>
<td><input type="text" name="txtptntnm"></td>
</tr>
<tr>
<td><b>Age</b></td>
<td><input type="text" name="txtage"></td>
<td><b>Sex</b></td>
<td><input type="text" name="txtsex"></td>
</tr>
<tr>
<td><b>Marital Status</b></td>
<td><input type="text" name="txtmrtlsts"></td>
<td><b>Phone No.</b></td>
<td><input type="text" name="txtphno"></td>
</tr>
<tr>
<td><b>Doctors Name</b></td>
<td><input type="text" name="txtdctrsnm"></td>
<td><b>Department</b></td>
<td><input type="text" name="txtdept"></td>
</tr>
<tr align="center">
<td bgcolor="navy" align="center"><font face="Comic Sans MS" color="white" size="2"><b><U>ROUTINE</b></td>
</tr>
<tr align="center" >
<td><b>Apppearance </b></td>
<td><input type="text" name="txtapp"></td>
<td><b>Specific Gravity </b></td>
<td><input type="text" name="txtspc"></td>
</tr>
<tr align="center">
<td><b>Reactiom </b></td>
<td><input type="text" name="txtrctn"></td>
<td><b> Albumin</b></td>
<td><input type="text" name="txtalb">mg</td>
</tr>
<tr align="center">
<td bgcolor="navy" align="center"><font face="Comic Sans MS" color="white" size="2"><b><U>GALL BLADDER</b></td>
</tr>
<tr align="center">
<td><b>Wall Thickness</b></td>
<td><input type="text" name="txtwall"></td>
</tr>
<tr align="center">
<td><b>Lumen</b></td>
<td><input type="text" name="txtlumen"></td>
</tr>
<tr align="center">
<td><b>Remark</b></td>
<td><input type="text" name="txtremark"></td>
</tr>
<br>
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