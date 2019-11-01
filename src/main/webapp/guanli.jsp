<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<LINK rel=stylesheet type=text/css href="css/style.css">
<script src="scripts/jquery.min.js"></script>
<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<script type="text/javascript" src="layui/layui.js"></script>
<body>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
		<DIV class=search>
			<LABEL><a onclick='document.location="fabu.jsp"'  class="btn btn-info" style="text-decoration: none;">发布房屋信息</a></LABEL>
			<LABEL><a  class="btn btn-info"
				onclick='document.location="login.jsp"'
				>退       出</a></LABEL>
		</DIV>
	</DIV>
	<DIV class="main wrap">
		<DIV id=houseArea>
			<TABLE class=house-list>
				<TBODY>
					<c:forEach var="ii" items="${house.getResult()}" varStatus="index">
					
						<TR class="ddd" <c:if test="${index.index%2!=0}">class=odd</c:if>>
							<TD class=house-thumb><SPAN><A href="details?hid=${ii.hid}"
									target="_blank"><img class="img-rounded" src="images/${ii.img.split(',')[0]}"
										width="150" height="135" alt=""></A></SPAN></TD>
							<TD>
								<DL>
									<DT>
										<A href="details?hid=${ii.hid}" target="_blank">${ii.title}</A>
									</DT>
									<DD>
										${ii.address },${ii.area }平米<BR>联系方式：${ii.phone }
									</DD>
								</DL>
							</TD>
							<TD class=house-type><LABEL><INPUT class="btn btn-info"
									onclick='document.location="details?hid=${ii.hid}"' value="修    改" type=button></LABEL></TD>
							<TD class=house-price><LABEL><INPUT class="btn btn-info" id="${ii.hid}"
									value="删    除" type=button name=search></LABEL></TD>
						</TR>
					</c:forEach>
				</TBODY>
			</TABLE>
		</DIV>
		<DIV class=pager id="test1">
		</DIV>
	</DIV>
	<DIV id=footer class=wrap>
		<DL>
			<DT>青鸟租房 © 2010 北大青鸟 京ICP证1000001号</DT>
			<DD>关于我们 · 联系方式 · 意见反馈 · 帮助中心</DD>
		</DL>
	</DIV>
</body>
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$("[name=search]").click(function(){
		var hid=$(this).attr("id");
		var tr=$(this).parents("tr");
		layui.use("layer",function(){
			var layer=layui.layer;
			layer.open({
				content: "是否要删除？",
				btn:['今天我必删','下次一定删'],
				yes:function(index){
					$.post("delete",{hid:hid},function(rs){
						if(rs=="ok"){
							tr.remove();
						}
					},"text");
					layer.closeAll();
				},
				icon: 3,
				skin: 'layui-layer-molv' 
			});
		});
	});
	
	
});
layui.use('laypage', function(){
	  var laypage = layui.laypage;
	  
	  //执行一个laypage实例
	  laypage.render({
	  elem: 'test1' //注意，这里的 test1 是 ID，不用加 # 号
	  ,count: ${house.getTotal()} //数据总数，从服务端得到
	  ,limit:7
	  ,jump:function(obj, first){
	    	 var page=obj.curr; 
	    	 var limit=obj.limit;
	    	 if(!first){
	    		 document.location="fy?index="+page;
	    		
	    				
           }
	    }
	  ,curr:${house.getPageNum()} 
	  });
	});
</script>
</html>