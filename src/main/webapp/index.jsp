<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.wyj.pojo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<LINK rel=stylesheet type=text/css href="css/style.css">
<LINK rel=stylesheet type=text/css href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
<script type="text/javascript" src="scripts/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<script type="text/javascript" src="layui/layui.js"></script>

<body>
	<DIV id=header class=wrap>
		<DIV id=logo>
			<IMG src="images/logo.gif">
		</DIV>
	</DIV>
	<DIV id=navbar class=wrap>
		<DL class="search clearfix">
			<FORM id="sform" method="post" action="find" class="layui-form" >
					<UL>
						<LI class=bold>房屋信息</LI>
						<LI>标题：<INPUT  class="form-control" style="width: 200px;display: inline-block;" type=text name=title value="${judgeMap.get('title')}">
						<INPUT value=搜索房屋 type=submit name=search class="btn btn-primary">
						</LI>
					</UL>
					<table class="table table-striped table-bordered table-hover  table-condensed">
					  <thead>
					     <th>区县</th>
					     <th>街道</th>
					     <th>房型</th>
					     <th>价格</th>
					     <th>面积</th>
					  </thead>
					  <tbody>
					     <tr>
					        <td>
					        	<SELECT id=street1 name="qx"  lay-filter="test" lay-verify="required"  >
								<OPTION>不限</OPTION>
								<c:forEach items="${map.keySet()}" var="ii" varStatus="index">
									<OPTION ${judgeMap.get('qx')==ii?'selected':''} >${ii}</OPTION>
								</c:forEach>
								</SELECT>
					        </td>  
					        <td>
					        	<SELECT id=street2 name="jd"  lay-verify="required">
								<OPTION>不限</OPTION>

								</SELECT>
					        </td>  
					        <td>
								<SELECT name="typeid" lay-verify="required">
								<OPTION selected>不限</OPTION>
								<OPTION value=1 ${judgeMap.get('typeid')=='1'?'selected':''} >一室一厅</OPTION>
								<OPTION value=2 ${judgeMap.get('typeid')=='2'?'selected':''} >一室两厅</OPTION>
								<OPTION value=3 ${judgeMap.get('typeid')=='3'?'selected':''} >两室一厅</OPTION>
								<OPTION value=4 ${judgeMap.get('typeid')=='4'?'selected':''} >两室两厅</OPTION>
						</SELECT>
							</td>  
							<td>
								<SELECT name="price" lay-verify="required">
								<OPTION selected>不限</OPTION>
								<OPTION value=1 ${judgeMap.get('price')=='1'?'selected':''} >1000元以下</OPTION>
								<OPTION value=2 ${judgeMap.get('price')=='2'?'selected':''} >1000元—2000元</OPTION>
								<OPTION value=3 ${judgeMap.get('price')=='3'?'selected':''} >2000元以上</OPTION>
						</SELECT>
							</td>  
							<td>
								<SELECT name="area" lay-verify="required" >
						
								<OPTION>不限</OPTION>
								<OPTION value=1 ${judgeMap.get('area')=='1'?'selected':''} >40以下</OPTION>
								<OPTION value=2 ${judgeMap.get('area')=='2'?'selected':''} >40-100</OPTION>
								<OPTION value=3 ${judgeMap.get('area')=='3'?'selected':''} >100以上</OPTION>
						</SELECT>
							</td>  
					     </tr>
					  </tbody>
					</table>
			</FORM>
		</DL>
	</DIV>
	<DIV class="main wrap">
		<TABLE class=house-list>
			<TBODY>
			<c:if test="${house.getResult().size()==0}">
				<p style="text-align: center;">没有搜到相关房屋，请换个关键词试试!</p>
			</c:if>
				<c:forEach items="${house.getResult()}" var="ii" varStatus="index">
					<TR <c:if test="${index.index%2!=0}">class=odd</c:if>>
						<TD class=house-thumb><span><A href="details?hid=${ii.hid}"
								target="_blank"><img class="img-circle" src="images/${ii.img.split(',')[0]}" width="150"
									height="135"  alt=""></A></span></TD>
						<TD>
							<DL>
								<DT>
									<A href="details?hid=${ii.hid}" target="_blank">${ii.title}</A>
								</DT>
								<DD>
									${ii.address},${ii.area}平米<BR>联系方式：${ii.phone}
								</DD>
							</DL>
						</TD>
						<TD class=house-type>${ii.housetype.type}</TD>
						<TD class=house-price><SPAN>${ii.price}</SPAN>元/月</TD>
					</TR>
				</c:forEach>
			</TBODY>
		</TABLE>
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

<script type="text/javascript">
	
 	$(function(){
		ddd();
		
	}); 
	layui.use('form', function(){
		  var form = layui.form
		  form.render('select');	
		  //监听提交
		  form.on('submit(formDemo)', function(data){
		    layer.msg(JSON.stringify(data.field));
		    return false;
		  });
		  form.on('select(test)', function(data){
			  console.log('select 监听成功');
			  console.log(data.elem); //得到select原始DOM对象
			  console.log(data.value); //得到被选中的值
			  console.log(data.othis); //得到美化后的DOM对象
					$.post("ajax111", {
						qx :data.value
					}, function(rs) {
						$("#street2").text("");
						$("#street2").append("<OPTION>不限</OPTION>");
						for(j = 0,len=rs.length; j < len; j++) {
							var aa="";
							if(rs[j]== "<%=session.getAttribute("judgeMap")==null?"":((Map<String,Object>)session.getAttribute("judgeMap")).get("jd")%>" ){
								aa="selected";
							}
							$("#street2").append("<OPTION "+aa+">" + rs[j] + "</OPTION>"); 
							
						}
						 form.render('select');	
					}, "json");
				
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
	function ddd() {
		if($("#street1").val()=="不限"){
			$("#street2").text("");
			$("#street2").append(
					"<OPTION>不限</OPTION>");
		}else{
			$.post("ajax111", {
				qx : $("#street1").val()
			}, function(rs) {
				$("#street2").text("");
				$("#street2").append(
						"<OPTION>不限</OPTION>");
				for ( var ii in rs) {
					var aa="";
					if(rs[ii]== "<%=session.getAttribute("judgeMap")==null?"":((Map<String,Object>)session.getAttribute("judgeMap")).get("jd")%>" ){
						aa="selected";
					}
					$("#street2").append("<OPTION "+aa+">" + rs[ii] + "</OPTION>");
					
				}
			}, "json");
		}
	} 
</script>
</html>