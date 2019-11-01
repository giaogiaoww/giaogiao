<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<LINK rel=stylesheet type=text/css href="css/style.css">
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="layer/layer.js"></script>
<body>
<fmt:setBundle basename="i18n"/>
<span style="float: right;position: absolute;right: 50px">
		<a href="i18n2?locale=zh_CN">中文（简体）</a> / <a href="i18n2?locale=en">English</a>
	</span>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
	</DIV>
	<DIV id=regLogin class=wrap>
		<DIV class=dialog>
			<DL class=clearfix>
				<DT><fmt:message key="tab1"></fmt:message></DT>
				<DD class=past><fmt:message key="tab2"></fmt:message></DD>
			</DL>
			<DIV class=box>
				<FORM>
					<DIV class=infos>
						<TABLE class=field>
							<TBODY>
								<TR>
									<TD class=field><fmt:message key="uname"></fmt:message>：</TD>
									<TD><INPUT id="yhm" class=text type=text name="uname">
									</TD>
								</TR>
								<TR>
									<TD class=field><fmt:message key="pwd"></fmt:message>：</TD>
									<TD><INPUT id="mm" class=text type=password name="pwd"></TD>
								</TR>
								<TR>
									<TD class=field><fmt:message key="repwd"></fmt:message>：</TD>
									<TD><INPUT id="remm" class=text type=password
										name=repassword></TD>
								</TR>
								<TR>
									<TD class=field><fmt:message key="phone"></fmt:message>：</TD>
									<TD><INPUT id="phone" class=text type="text"
										name="phone" oninput="value=value.replace(/[^\d]/g,'')">
									</TD>
								</TR>
								<TR>
									<TD class=field><fmt:message key="realname"></fmt:message>：</TD>
									<TD><INPUT id="realname" class=text type=text
										name="realname"></TD>
								</TR>
							</TBODY>
						</TABLE>
						<DIV class=buttons>
							<INPUT id="tj" value="<fmt:message key='ljzc'></fmt:message>" type="button">
						</DIV>
					</DIV>
				</FORM>
			</DIV>
		</DIV>
	</DIV>
	<DIV id=footer class=wrap>
		<DL>
			<DT>青鸟租房 © 2010 北大青鸟 京ICP证1000001号</DT>
			<DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD>
		</DL>
	</DIV>
</body>
<script type="text/javascript">
	$(function() {
		var b = true;
		$("#tj").click(
				function() {
					var yhm = $("#yhm").val();
					var mm = $("#mm").val();
					var remm = $("#remm").val();
					var phone = $("#phone").val();
					var realname = $("#realname").val();
					if (yhm == "" || mm == "" || remm == "" || phone == ""
							|| realname == "") {
						layer.alert('请填写完整信息', {
							  icon: 2,
							  skin: 'layui-layer-molv' 
						});
					} else if (mm != remm) {
						layer.alert('两次密码输入的不一致', {
							  icon: 2,
							  skin: 'layui-layer-molv' 
						});
					} else if (phone.length != 11) {
						layer.alert('手机号码必须是11位！', {
							  icon: 2,
							  skin: 'layui-layer-molv' 
						});
					} else if (!b) {
						layer.alert('该用户名已经存在！', {
							  icon: 2,
							  skin: 'layui-layer-molv' 
						});
					}else{
						$.post("zhuce",{uname:yhm,pwd:mm,phone:phone,realname:realname},function(rs){
							var i=2;
							var mess=rs.mess;
							if(mess=="注册成功"){
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
		$("#yhm").blur(function() {
			var yhm = $("#yhm").val();
			$.post("checkUname", {
				date : yhm
			}, function(rs) {
				if (rs == "false") {
					layer.alert('该用户名已经存在！', {
						  icon: 2,
						  skin: 'layui-layer-molv' 
					});
					b = false;
				} else {
					b = true;
				}
			}, "text");

		});
	});
</script>
</html>