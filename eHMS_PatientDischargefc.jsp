<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String refno,date[],PtntId[],ptntNm[],sex[],age[],locality[],city[],state[],phNo[],treatment[],roomNo[],dept[],dctrNm[],roomchrg[],medicinechrg[],otherchrg[],totalchrg[];
Connection conn;
Statement stmtshowrefno,stmtptntData;
ResultSet rsshowrefno,rsptntData;
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
PtntId=new String[30];
ptntNm=new String[30];
sex=new String[30];
age=new String[30];
locality=new String[30];
city=new String[30];
state=new String[30];
phNo=new String[30];
treatment=new String[30];
roomNo=new String[30];
dept=new String[30];
dctrNm=new String[30];
roomchrg=new String[30];
medicinechrg=new String[30];
otherchrg=new String[30];
totalchrg=new String[30];
doConnect();
try{
stmtptntData=conn.createStatement();
rsptntData=stmtptntData.executeQuery("select * from eHMS_tblPatientDischarge");
i=0;
while(rsptntData.next()){
date[i]=rsptntData.getString("Date");
PtntId[i]=rsptntData.getString("PatientId");
ptntNm[i]=rsptntData.getString("PtientName");
sex[i]=rsptntData.getString("Sex");
age[i]=rsptntData.getString("Age");
locality[i]=rsptntData.getString("Locality");
city[i]=rsptntData.getString("City");
state[i]=rsptntData.getString("State");
phNo[i]=rsptntData.getString("PhoneNo");
treatment[i]=rsptntData.getString("Treatment");
roomNo[i]=rsptntData.getString("RoomNo");
dept[i]=rsptntData.getString("Department");
dctrNm[i]=rsptntData.getString("DoctorsName");
roomchrg[i]=rsptntData.getString("RoomCharge");
medicinechrg[i]=rsptntData.getString("MedicineCharge");
otherchrg[i]=rsptntData.getString("OtherCharge");
totalchrg[i]=rsptntData.getString("TotalCharge");
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
var jdate=new Array()
var jPtntId=new Array()
var jptntNm=new Array();
var jsex=new Array(); 
var jage=new Array();
var jlocality=new Array();
var jcity=new Array();
var jstate=new Array();
var jphNo=new Array();
var jtreatment=new Array();
var jroomNo=new Array();
var jdept=new Array();
var jdctrNm=new Array();
var jroomchrg=new Array();
var jmdcnchrg=new Array();
var jothrchrg=new Array();
var jtotalchrg=new Array();
var j=0,k;
<%
i=0;
while(i<date.length){
%>
jdate[j]="<%=date[i]%>";
jPtntId[j]="<%=PtntId[i]%>";
jptntNm[j]="<%=ptntNm[i]%>";
jsex[j]="<%=sex[i]%>";
jage[j]="<%=age[i]%>";
jlocality[j]="<%=locality[i]%>";
jcity[j]="<%=city[i]%>";
jstate[j]="<%=state[i]%>";
jphNo[j]="<%=phNo[i]%>";
jtreatment[j]="<%=treatment[i]%>";
jroomNo[j]="<%=roomNo[i]%>";
jdept[j]="<%=dept[i]%>";
jdctrNm[j]="<%=dctrNm[i]%>";
jroomchrg[j]="<%=roomchrg[i]%>";
jmdcnchrg[j]="<%=medicinechrg[i]%>";
jothrchrg[j]="<%=otherchrg[i]%>";
jtotalchrg[j]="<%=totalchrg[i]%>";
j=j+1;
<%
i=i+1;
}
%>
k=document.f1.cmbrefno.selectedIndex;
document.f1.dtdate.value=jdate[k-1];
document.f1.txtptntid.value=jPtntId[k-1];
document.f1.txtptntnm.value=jptntNm[k-1];
document.f1.txtsex.value=jsex[k-1];
document.f1.txtage.value=jage[k-1];
document.f1.txtloc.value=jlocality[k-1];
document.f1.txtcity.value=jcity[k-1];
document.f1.txtstatenm.value=jstate[k-1];
document.f1.txtphno.value=jphNo[k-1];
document.f1.txttreatment.value=jtreatment[k-1];
document.f1.txtroom.value=jroomNo[k-1];
document.f1.txtdept.value=jdept[k-1];
document.f1.txtdctrnm.value=jdctrNm[k-1];
document.f1.txtroomchrg.value=jroomchrg[k-1];
document.f1.txtmdcnchrg.value=jmdcnchrg[k-1];
document.f1.txtotherchrg.value=jothrchrg[k-1];
document.f1.txttotalchrg.value=jtotalchrg[k-1];
}

function goBack(){
window.location="eHMS_PatientDischargec.jsp";
}

function showTotalcharge() {
var rmchrg,mdcnchrg,othrchrg,totalcharge;
rmchrg=parseFloat(document.f1.txtroomchrg.value);
mdcnchrg=parseFloat(document.f1.txtmdcnchrg.value);
othrchrg=parseFloat(document.f1.txtotherchrg.value);
totalcharge= rmchrg+mdcnchrg+othrchrg;
document.f1.txttotalchrg.value=totalcharge;
}

</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="eHMS_PatientDischargefs.jsp" method="post">
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
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>P a t i e n t  &nbsp;&nbsp;&nbsp;  D i s c h a r g e &nbsp;&nbsp;&nbsp;  P r o f i l e</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="70%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr>
<br>
<td nowrap="nowrap"><b>Ref. No.</b></td>
<td><select name="cmbrefno" onchange="showPatientData()">
<option value="Null">--select--</option>
<%
doConnect();
try{
stmtshowrefno=conn.createStatement();
rsshowrefno=stmtshowrefno.executeQuery("select * from eHMS_tblPatientDischarge");  
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
</select>
</td>
<td><b>Date </b> </td>
<td><input type="date" name="dtdate"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Patient ID.</b></td>
<td><input type="text" name="txtptntid"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Patient Name</b></td>
<td><input type="text" name="txtptntnm"></td>
</tr>

<tr>
<td><b>Sex</b></td>
<td><input type="text" name="txtsex"></td>
<td><b>Age</b></td>
<td><input type="text" name="txtage"></td>
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
<td><input type="text" name="txttreatment"></td>
<td nowrap="nowrap"><b>Room No.</b></td>
<td><input type="text" name="txtroom"></td>
</tr>
<tr>
<td><b>Department</b></td>
<td><input type="text" name="txtdept"></td>
<td nowrap="nowrap"><b>Doctor's  Name</b></td>
<td><input type="text" name="txtdctrnm"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Room Charge</b></td>
<td><input type="text" name="txtroomchrg"></td>
<td nowrap="nowrap"><b>Medicine Charge</b></td>
<td><input type="text" name="txtmdcnchrg"></td>
</tr>
<tr>
<td nowrap="nowrap"><b>Other Charge</b></td>
<td><input type="text" name="txtotherchrg" onblur="showTotalcharge()"></td>
<td nowrap="nowrap"><b>Total Charge</b></td>
<td><input type="text" name="txttotalchrg"></td>
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