<%@page language="java" import="java.sql.*" contentType="text/html"%>
<%!
String det;
Connection conn;
Statement stmtshowname;
ResultSet rsshowname;
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
document.imgNm.src=images[i];
if(i< images.length-1){
i=i+1;
} else{
i=0;
}
setTimeout("slideShow()",time);
}
window.onload=slideShow;

function goHome(){
window.close();
}
</script>
</head>
<body background="1.jpg" style="background-size:cover">
<form name="f1" action="RptPtntAdmsnDates.jsp" method="post">
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

<table width="65%" height="35%" align="center"  background="bk4.jpg"  style="border-radius:60px 0px 60px 0px">
<tr>
	<td style="border-radius:60px 0px 0px 0px">
		<table width="100%" height="30" style="border-radius:60px 0px 0px 0px"><tr>
		<td><font face="Comic Sans MS" color="blue" size="5"><b><center><U>P a t i e n t  &nbsp;&nbsp;&nbsp; A d m i s s i o n &nbsp;&nbsp;&nbsp; I n f o m a t i o n  &nbsp;&nbsp; [Any Date]</center></b></td></tr>
		</table>
    </td>
</tr>
<tr>
<td style="border-radius:0px 0px 60px 0px">
<table width="70%"  height="50"  align="center"  style="border-radius:0px 0px 60px 0px">
<tr align="center">
<td><b>Date </td>
<td>
<select name="cmbdt">
<option value="">--select--</option>
<%
doConnect();
try{
stmtshowname=conn.createStatement();
rsshowname=stmtshowname.executeQuery("select * from eHMS_tblPatientAdmin");
while(rsshowname.next()){
det=rsshowname.getString("Date");
%>
<option value="<%=det%>"><%=det%></option>
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
</table>

<br>
<center>
<input type="button" name="gotohome" value= "Go To Home" style="color:black;border-radius:20px;background-color:white;height:25px" onclick="goHome()">
<input type="submit" name="Submit" value="Submit" style="color:black;border-radius:20px;background-color:white;height:25px">
<input type="reset" name="Reset" value=" Reset" style="color:black;border-radius:20px;background-color:white;height:25px">
</center>
</td>
</tr>
</table>
</form>
<br><br><br><br><br><br>

<center>
<img src="#" name="imgNm" height="20%" width="65%">
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
