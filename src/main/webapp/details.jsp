<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />
<LINK rel=stylesheet type=text/css href="css/style.css">
<script src="scripts/jquery.min.js"></script>
<link href="bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="scripts/jquery-1.8.3.min.js"></script>
 <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.15&key=
57d28ee000bf823fa678da0bafd851f0"></script>
<style type="text/css">
div.item img {
	width: 100%;
}

div#carousel-example-generic {
	width: 80%;
	margin: 0 auto;
}
</style>
<body>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
	</DIV>

	<DIV id=view class="main wrap">
		<DIV class=intro>
			<DIV class=lefter>
				<H1>${details.title}</H1>
				<DIV class=subinfo>2013-06-28 14:06:33.0</DIV>
				<div id="carousel-example-generic" class="carousel slide"
					data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<c:forEach items="${details.img.split(',')}" var="ii" varStatus="index">
							<li data-target="#carousel-example-generic" data-slide-to="${index.index}"
							 <c:if test="${index.index==0}">class="active"</c:if>></li>
						</c:forEach>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner" role="listbox">
						<c:forEach items="${details.img.split(',')}" var="ii" varStatus="index">
							<div 
							<c:if test="${index.index==0}">class="item active"</c:if>
							<c:if test="${index.index!=0}">class="item"</c:if> >
								<img src="images/${ii}">
							</div>
						</c:forEach>
					</div>

					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
 
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
 
  </a>
				</div>
				<form action="zhifu" method="post">
				<DIV class=houseinfo>
					<P>
						户 型：<SPAN>${details.housetype.type}</SPAN>
					</P>
					<P>
						面 积：<SPAN>${details.area}m<SUP>2</SUP></SPAN>
					</P>
					<P>
						位 置：<SPAN>${details.address }</SPAN>
					</P>
					<P>
						联系方式：<SPAN>${details.phone }</SPAN>
					</P>
					<P>租借月数：
						<input id="jian" type="button" value="-" style="padding: 1px 5px;line-height: 20px">
						<input id="sl" name="sl" type="text" readonly="readonly" style="width: 30px;line-height: 20px" value="3">
						<input id="jia" type="button" value="+" style="padding: 1px 5px;line-height: 20px">
						<input name="WIDbody" type="hidden" value="${details.detailed}">
					</P>
					<P><input name="zje" readonly="readonly" type="hidden" style="border: none" />
						总金额：<span id="zje"></span>
					</P>
					<div style="float: right; position: relative; top: -50px">
						<input type="submit" value="我很中意这套房子！" class="btn btn-info">
					</div>
				</DIV>
				</form>
			</DIV>
			<DIV class=side>
				<P>
					<A class=bold href="http://localhost:8080/House-2/#">北京青鸟房地产经纪公司</A>
				</P>
				<P>
					资质证书：<SPAN>有</SPAN>
				</P>
				<P>房产证日期：</P>
				<P>
					<SPAN>${details.housedate.getYear()+1900}年
						${details.housedate.getMonth()+1}月 ${details.housedate.getDate()}日</SPAN>
				</P>
				<P>
					手机号码：<SPAN>${details.phone}</SPAN>
				</P>
			</DIV>
			<DIV class=clear></DIV>
			<DIV class=introduction>
				<H2>
					<input id="sp1" type="button" value="房源详细信息" class="btn btn-info">
					<input id="sp2" type="button" value="房源详细地址" class="btn btn-info">
				</H2>
				<DIV class=content>
					<P>${details.detailed }</P>
				</DIV>
				<div id="container" style="width: 950px;height: 700px"></div>
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
$(function(){
	var sl=3;
	$("#zje").text(${details.price}*sl);
	$("[name=zje]").val($("#zje").text());
	
	$("#jia").click(function(){
		sl++;
		$("#sl").val(sl);
		$("#zje").text(${details.price}*sl);
		$("[name=zje]").val($("#zje").text());
	});
	$("#jian").click(function(){
		if($("#sl").val()!=3){
			sl--;
			$("#sl").val(sl);
		}else{
			alert("最少租借3个月");
		}
		$("#zje").text(${details.price}*sl);
		$("[name=zje]").val($("#zje").text());
	});
	
	$("#container").hide();
	$("#sp1").click(function(){
		$("#container").hide();
		$(".content").show();
	});
	$("#sp2").click(function(){
		$(".content").hide();
		$("#container").show();
	}); 
});
var map = new AMap.Map("container", {
    zoom: 18,
    center:[113.01566684155271,28.191138290666845]
});
var marker = new AMap.Marker({
    map:map,
    position:[113.01566684155271,28.191138290666845],
    label: {
        offset: new AMap.Pixel(20, 20),//修改label相对于maker的位置
        content: "在这里！"
    } 
})
marker.on('click',function(e){
    marker.markOnAMAP({
        name:'首开广场',
        position:marker.getPosition()
    })
})
if(AMap.UA.mobile){
    document.getElementsByClassName('info')[0].style.display='none';
}
</script>
</html>