<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String refno,regnumber,date[],regno[],ptntName[],ptntNm[],age[],sex[],maritalSts[],phNo[],dctrsNm[],dept[],wbc[],rbc[],hb[],hct[],mcv[],pltlt[],neutrophl[],lymphocyt[],monocyt[],eosinophil[],basophl[],remark[];
Connection conn;
Statement stmtshowregdno,stmtshowrefno,stmtptntData,stmtSetData;
ResultSet rsshowregdno,rsshowrefno,rsptntData,rsSetData;
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

ptntName=new String[30];
age=new String[30];
sex=new String[30];
maritalSts=new String[30];
phNo=new String[30];
dctrsNm=new String[30];
dept=new String[30];
doConnect();
try{
stmtptntData=conn.createStatement();
rsptntData=stmtptntData.executeQuery("select * from eHMS_tblPatientAdmin");
i=0;
while(rsptntData.next()){
ptntName[i]=rsptntData.getString("PatientName");
age[i]=rsptntData.getString("Age");
sex[i]=rsptntData.getString("Sex");
maritalSts[i]=rsptntData.getString("MaritalStatus");
phNo[i]=rsptntData.getString("PhoneNo");
dctrsNm[i]=rsptntData.getString("DoctorsName");
dept[i]=rsptntData.getString("Department");
i=i+1;
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
<%
date=new String[30];
regno=new String[30];
ptntNm=new String[30];
age=new String[30];
sex=new String[30];
maritalSts=new String[30];
phNo=new String[30];
dctrsNm=new String[30];
dept=new String[30];
wbc=new String[30];
rbc=new String[30];
hb=new String[30];
hct=new String[30];
mcv=new String[30];
pltlt=new String[30];
neutrophl=new String[30];
lymphocyt=new String[30];
monocyt=new String[30];
eosinophil=new String[30];
basophl=new String[30];
remark=new String[30];
doConnect();
try{
stmtSetData=conn.createStatement();
rsSetData=stmtSetData.executeQuery("select * from eHMS_tblBlood");
i=0;
while(rsSetData.next()){
date[i]=rsSetData.getString("Date");
regno[i]=rsSetData.getString("RegdNo");
ptntNm[i]=rsSetData.getString("PatientName");
age[i]=rsSetData.getString("Age");
sex[i]=rsSetData.getString("Sex");
maritalSts[i]=rsSetData.getString("MaritalStatus");
phNo[i]=rsSetData.getString("PhNo");
dctrsNm[i]=rsSetData.getString("DocNm");
dept[i]=rsSetData.getString("Department");
wbc[i]=rsSetData.getString("WBC");
rbc[i]=rsSetData.getString("RBC");
hb[i]=rsSetData.getString("HB");
hct[i]=rsSetData.getString("HCT");
mcv[i]=rsSetData.getString("MCV");
pltlt[i]=rsSetData.getString("Platelate");
neutrophl[i]=rsSetData.getString("Neutrophil");
lymphocyt[i]=rsSetData.getString("Lymphocyte");
monocyt[i]=rsSetData.getString("Monocyte");
eosinophil[i]=rsSetData.getString("Eosinophil");
basophl[i]=rsSetData.getString("Basophil");
remark[i]=rsSetData.getString("Remark");
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

var jptntName=new Array();
var jage=new Array();
var jsex=new Array(); 
var jmaritalSts=new Array();
var jphNo=new Array();
var jdctrsnm=new Array();
var jdept=new Array();
var j=0,k;
<%
i=0;
while(i<ptntName.length){
%>
jptntName[j]="<%=ptntName[i]%>";
jage[j]="<%=age[i]%>";
jsex[j]="<%=sex[i]%>"; 
jmaritalSts[j]="<%=maritalSts[i]%>";
jphNo[j]="<%=phNo[i]%>";
jdctrsnm[j]="<%=dctrsNm[i]%>";
jdept[j]="<%=dept[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbregdno.selectedIndex;

document.f1.txtptntnm.value=jptntName[k-1];
alert("hiiii")
document.f1.txtage.value=jage[k-1];
document.f1.txtsex.value=jsex[k-1];
document.f1.txtmrtlsts.value=jmaritalSts[k-1];
document.f1.txtphno.value=jphNo[k-1];
document.f1.txtdctrsnm.value=jdctrsnm[k-1];
document.f1.txtdept.value=jdept[k-1];
}

function SetPatientData(){
var jdate=new Array();
var jregno=new Array();
var jptntNm=new Array();
var jage=new Array();
var jsex=new Array(); 
var jmaritalSts=new Array();
var jphNo=new Array();
var jdctrsnm=new Array();
var jdept=new Array();
var jwbc=new Array();
var jrbc=new Array();
var jhb=new Array();
var jhct=new Array();
var jmcv=new Array();
var jpltlt=new Array();
var jneutrophl=new Array();
var jlymphocyt=new Array();
var jmonocyt=new Array();
var jeosinophil=new Array();
var jbasophl=new Array();
var jremark=new Array();
var j=0,k;
<%
i=0;
while(i<date.length){
%>
jdate[j]="<%=date[i]%>";
jregno[j]="<%=regno[i]%>";
jptntNm[j]="<%=ptntNm[i]%>";
jage[j]="<%=age[i]%>";
jsex[j]="<%=sex[i]%>"; 
jmaritalSts[j]="<%=maritalSts[i]%>";
jphNo[j]="<%=phNo[i]%>";
jdctrsnm[j]="<%=dctrsNm[i]%>";
jdept[j]="<%=dept[i]%>";
jwbc[j]="<%=wbc[i]%>";
jrbc[j]="<%=rbc[i]%>";
jhb[j]="<%=hb[i]%>";
jhct[j]="<%=hct[i]%>";
jmcv[j]="<%=mcv[i]%>";
jpltlt[j]="<%=pltlt[i]%>";
jneutrophl[j]="<%=neutrophl[i]%>";
jlymphocyt[j]="<%=lymphocyt[i]%>";
jmonocyt[j]="<%=monocyt[i]%>";
jeosinophil[j]="<%=eosinophil[i]%>";
jbasophl[j]="<%=basophl[i]%>";
jremark[j]="<%=remark[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbrefno.selectedIndex;
document.f1.dt.value=jdate[k-1];
jregno[k-1]=jregno[k-1].trim();
document.f1.cmbregdno.value=jregno[k-1];
document.f1.txtptntnm.value=jptntNm[k-1];
document.f1.txtage.value=jage[k-1];
document.f1.txtsex.value=jsex[k-1];
document.f1.txtmrtlsts.value=jmaritalSts[k-1];
document.f1.txtphno.value=jphNo[k-1];
document.f1.txtdctrsnm.value=jdctrsnm[k-1];
document.f1.txtdept.value=jdept[k-1];
document.f1.txtwbc.value=jwbc[k-1];
document.f1.txtrbc.value=jrbc[k-1];
document.f1.txthb.value=jhb[k-1];
document.f1.txthct.value=jhct[k-1];
document.f1.txtmcv.value=jmcv[k-1];
document.f1.txtpltlt.value=jpltlt[k-1];
document.f1.txtntrphl.value=jneutrophl[k-1];
document.f1.txtlmphct.value=jlymphocyt[k-1];
document.f1.txtlmnct.value=jmonocyt[k-1];
document.f1.txtesnphl.value=jeosinophil[k-1];
document.f1.txtbsphl.value=jbasophl[k-1];
document.f1.txtrmk.value=jremark[k-1];
}


function goBack(){
window.location="eHMS_Bloodc.jsp";
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_Bloodfs.jsp" method="post">
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

<table width="70%" height="50%" align="center"  background="bk4.jpg"  style="border-radius:60px 0px 60px 0px">
<tr>
	<td style="border-radius:60px 0px 0px 0px">
		<table width="100%" height="30" style="border-radius:60px 0px 0px 0px"><tr>
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>P a t i e n t  &nbsp;&nbsp;&nbsp; B l o o d     T e s t &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
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
rsshowrefno=stmtshowrefno.executeQuery("select * from eHMS_tblBlood");
while(rsshowrefno.next()){
refno=rsshowrefno.getString("RefNo");
%>
<option value="<%=refno%>"><%=refno%></option>
<%
}
}
catch(SQLException se){
out.println("unable to connect"+se);
}
%>
</select></td>
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
regnumber=rsshowregdno.getString("RegdNo");
%>
<option value="<%=regnumber%>"><%=regnumber%></option>
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
<tr bgcolor="navy" align="center">
<td><font face="Comic Sans MS" color="white" size="3">Test</td><td><font face="Comic Sans MS" color="white" size="3">Value</td>
<td><font face="Comic Sans MS" color="white" size="3">Reference Range</td><td><font face="Comic Sans MS" color="white" size="3">Units</td></tr>
<tr align="center">
<td><font face="Comic Sans MS" color="blue" size="3"><b><U>COMPLETE BLOOD COUNT</b></td>
</tr>
<tr align="center" >
<td><b>White Blood Cell(WBC)  </b></td>
<td><input type="text" name="txtwbc"></td>
<td>4.8-10.8</td>
<td>K/mcL</td>
</tr>
<tr align="center">
<td><b>Red Blood Cell(RBC)  </b></td>
<td><input type="text" name="txtrbc"></td>
<td>4.7-6.1</td>
<td>K/mcL</td>
</tr>
<tr align="center">
<td><b>Hemoglobin(HB)  </b></td>
<td><input type="text" name="txthb"></td>
<td>14.0-18.0</td>
<td>g/dL</td>
</tr>
<tr align="center">
<td><b>Hematocrit(HCT)  </b></td>
<td><input type="text" name="txthct"></td>
<td>42-52</td>
<td>%</td>
</tr>
<tr align="center">
<td><b>Mean Cell Value(MCV)  </b></td>
<td><input type="text" name="txtmcv"></td>
<td>80-100</td>
<td>fl</td>
</tr>
<tr align="center">
<td><b>Platelate  </b></td>
<td><input type="text" name="txtpltlt"></td>
<td>150-450</td>
<td>K/mcL</td>
</tr>
<tr align="center">
<td><font face="Comic Sans MS" color="blue" size="3"><b><U>WBC DIFFERENTIAL</b></td>
</tr>
<tr align="center">
<td><b>Neutrophil  </b></td>
<td><input type="text" name="txtntrphl"></td>
<td>33-73</td>
<td>%</td>
</tr>
<tr align="center">
<td><b>Lymphocyte  </b></td>
<td><input type="text" name="txtlmphct"></td>
<td>13-52</td>
<td>%</td>
</tr>
<tr align="center">
<td><b>Monocyte  </b></td>
<td><input type="text" name="txtlmnct"></td>
<td>0-10</td>
<td>%</td>
</tr>
<tr align="center">
<td><b>Eosinophil  </b></td>
<td><input type="text" name="txtesnphl"></td>
<td>0-5</td>
<td>%</td>
</tr>
<tr align="center">
<td><b>Basophil </b></td>
<td><input type="text" name="txtbsphl"></td>
<td>0-2</td>
<td>%</td>
</tr>
<tr align="center">
<td><b>Remark </b></td>
<td><input type="text" name="txtrmk"></td>
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