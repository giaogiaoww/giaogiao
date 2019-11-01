<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<LINK rel=stylesheet type=text/css href="css/style.css">
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
<!-- <script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script> -->
<script type="text/javascript" src="scripts/updateimg.js" ></script>
<head>
		<meta charset="UTF-8">
		<title>多张图片上传</title>
		<style>
			.main {
				width: 80%;
				margin: auto;
			}
			
			* {
				padding: 0;
				margin: 0;
			}
			
			.btn {
				padding: 9px 18px;
				background: #40AFFE;
				color: #FFFFFF;
				border-radius: 5px;
			}
			
			.upimg {
				position: relative;
				width: 100px;
				height: 100px;
				border-radius: 5px;
				border: dashed #999999;
				background: url(images/addimg.svg) no-repeat;
				background-position: 33px;
			}
			
			.upimg input {
				position: absolute;
				width: 100px;
				height: 100px;
				opacity: 0;
			}
			
			#showui {
				display: flex;
				justify-content: flex-start;
			}
			
			#showui li {
				width: 150px;
				height: 150px;
				position: relative;
				overflow: hidden;
				display: inline-block;
				margin-right: 5px;
			}
			
			#showui li img.showimg {
				position: absolute;
				text-align: center;
				top: 50%;
				left: 50%;
				transform: translate(-50%, -50%);
				z-index: 6;
			}
			
			.showdiv {
				position: absolute;
				z-index: 9;
				bottom: 0;
				width: calc(100% - 20px);
				padding: 10px;
				display: flex;
				justify-content: space-around;
				background: rgba(0, 0, 0, .6);
			}
			
			.showdiv img {
				width: 20px;
				height: 20px;
				cursor: pointer;
			}
			
			#showui li:first-child img.left {
				opacity: .6;
				cursor: no-drop;
			}
			
			#showui li:last-child img.right {
				opacity: .6;
				cursor: no-drop;
			}
			
			.oneright {
				opacity: .6;
				cursor: no-drop !important;
			}
		</style>
<body>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
	</DIV>
	<DIV id=regLogin class=wrap>
		<DIV class=dialog>
			<DL class=clearfix>
				<DT>新房屋信息发布</DT>
				<DD class=past>填写房屋信息</DD>
			</DL>
			<DIV class=box>
				<FORM id=add_action method=post name=add
					action=fabu enctype="multipart/form-data">
					<DIV class=infos>
						<TABLE class=field>
							<TBODY>
								<TR>
									<TD class=field>标 题：</TD>
									<TD><INPUT id=add_action_title class=text type=text
										name=title></TD>
								</TR>
								<TR>
									<TD class=field>户 型：</TD>
									<TD><SELECT class=text name=type_id><OPTION
												selected value=1>一室一厅</OPTION>
											<OPTION value=2>一室两厅</OPTION>
											<OPTION value=3>两室一厅</OPTION>
											<OPTION value=4>两室两厅</OPTION></SELECT></TD>
								</TR>
								<TR>
									<TD class=field>面 积：</TD>
									<TD><INPUT id=add_action_floorage class=text type=text
										name=floorage oninput="value=value.replace(/[^\d]/g,'')"></TD>
								</TR>
								<TR>
									<TD class=field>价 格：</TD>
									<TD><INPUT id=add_action_price class=text type=text
										name=price oninput="value=value.replace(/[^\d]/g,'')"></TD>
								</TR>
								<TR>
									<TD class=field>房产证日期：</TD>
									<TD><INPUT readonly="readonly" style="width: 250px;"
										class=Wdate type=text name=houseDate onClick="WdatePicker()" />
									</TD>
								</TR>
								<TR>
									<TD class=field>位 置：</TD>
									<TD>区：<SELECT class=text name=district_id>
											<c:forEach items="${map.keySet()}" var="ii" varStatus="index">
												<c:if test="${ii!='不限'}">
													<OPTION ${judgeMap.get('qx')==ii?'selected':''}>${ii}</OPTION>
												</c:if>
											</c:forEach>
									</SELECT> 街：<SELECT class=text name=street_id></SELECT>
									</TD>
								</TR>
								<TR>
									<TD class=field>联系方式：</TD>
									<TD><INPUT id=add_action_contact class=text type=text
										name=contact oninput="value=value.replace(/[^\d]/g,'')"></TD>
								</TR>
								<TR>
									<TD class=field>房间内置图：</TD>
									<TD>
										<div class="main">
											<div id="showimg">
												<ul id="showui">
												</ul>
								
												<div id="showinput">
								
												</div>
											</div>
											<div class="upimg">
												<input type="file" id="upgteimg" value="" multiple  name="imgg"/>
											</div>
											
											<button class="btn" id="submit" style="display:none;"></button>
										</div>
										
									</TD>
								</TR>
								<TR>
									<TD class=field>详细信息：</TD>
									<TD><TEXTAREA name=description></TEXTAREA></TD>
								</TR>
							</TBODY>
						</TABLE>
						<DIV class=buttons>
							<INPUT value=立即发布 id=tj type=submit>
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
		ddd();
		$("[name=district_id]").change(function() {
			ddd();
		});

		function ddd() {
			$.post("ajax111", {
				qx : $("[name=district_id]").val()
			}, function(rs) {
				$("[name=street_id]").text("");
				for ( var ii in rs) {
					$("[name=street_id]").append(
							"<OPTION>" + rs[ii] + "</OPTION>");

				}
			}, "json");

		}
		$("#tj").click(
				function() {
					var title = $("#add_action_title").val();
					var area = $("#add_action_floorage").val();
					var price = $("#add_action_price").val();
					var houseDate = $("[name=houseDate]").val();
					var phone = $("[name=contact]").val();
					if (title == "" || area == "" || price == ""
							|| houseDate == "" || phone == "") {
						alert("请填写完整信息");
						return false;
					} else if (phone.length != 11) {
						alert("手机号码必须是11位");
						return false;
					}
				});
		 
	});
</script>
</html>