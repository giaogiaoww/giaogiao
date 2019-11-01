<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
   	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<LINK rel=stylesheet type=text/css href="css/style.css">
<body>
<fmt:setBundle basename="i18n"/>
	<span style="float: right;position: absolute;right: 50px">
		<a href="i18n?locale=zh_CN">中文（简体）</a> / <a href="i18n?locale=en">English</a>
	</span>
	<DIV id=header class=wrap>
	<DIV id=logo><IMG src="images/logo.gif"></DIV></DIV>
	<DIV id=regLogin class=wrap>
	<DIV class=dialog>
	<DIV class=box>
	<H4><fmt:message key="loginTitle"></fmt:message></H4>
	<FORM id="user" method="post" name="user" action="dl">
	<DIV class=infos>
	<TABLE class=field>
	  <TBODY>
	  <TR>
	    <TD colSpan=2></TD></TR>
	  <TR>
	    <TD class="field"><fmt:message key="uname"></fmt:message>：</TD>
	    <TD><INPUT id="user_name" class="text" type="text" name="uname"> </TD></TR>
	  <TR>
	    <TD class=field><fmt:message key="pwd"></fmt:message>：</TD>
	    <TD><INPUT id="user_password" class="text" type="password" name="pwd"> </TD></TR>
	  <tr>
		<td class="field"><fmt:message key="veryCode"></fmt:message>：</td>
		<td><input type="text" class="text verycode" name="veryCode" />
		<img id="veryCode" src="ImageServlet" style="position: relative;left: 10px;top: 10px"/></td>
	  </tr>
	</TBODY></TABLE>
	<DIV class="buttons"> <INPUT id="login" value="<fmt:message key='login'></fmt:message>" type="button"> <INPUT onclick='document.location="regs.jsp"' value="<fmt:message key='zc'></fmt:message>" type=button> 
	</DIV></DIV></FORM></DIV></DIV></DIV>
	<DIV id=footer class=wrap>
	<DL>
	  <DT>青鸟租房 © 2010 北大青鸟 京ICP证1000001号</DT>
	  <DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD></DL></DIV>
	  
</body>
<script type="text/javascript">
$(function(){
	$("#login").click(function(){
		var name=$("[name=uname]").val();
		var pwd1=$("[name=pwd]").val();
		var yzm=$("[name=veryCode]").val();
		if(name==""||pwd1==""||yzm==""){
			layer.alert('请填写完整信息', {
				  icon: 2,
				  skin: 'layui-layer-molv' 
			});
		}else{
			$.post("dl",{uname:name,pwd:pwd1,veryCode:yzm},function(rs){
				var i=2;
				var mess=rs.mess;
				if(mess=="登录成功"){
					i=1;
				}
				layer.open({
					content: mess,
					btn:['了解！'],
					yes:function(){
						if(rs.url!=""){
							location.href=rs.url;
						}
						layer.closeAll();
					},
					icon: i,
					skin: 'layui-layer-molv' 
				});
			},"json");
		}
	});
});
</script>
</html>