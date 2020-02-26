<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>电影的列表</title>
<link href="/resources/css/index3.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/resources/js/jquery-1.8.3.js"></script>
<script type="text/javascript">

	function morder(orderName){
		
		 var orderMethod='${movieVO.orderMethod=='desc'?'asc':'desc'}';

		location.href="/selects?orderName="+orderName+"&orderMethod="+orderMethod;
	}
	function cks(thiz){
		$(".ck").attr("checked",thiz.checked);
	}
	function del(){
		var ids=$(".ck:checked").map(function(){
			return this.value;
		}).get().join();
		alert(ids);
		$.ajax({
			url:"/delete",
			data:{"ids":ids},
			type:"post",
			success:function(obj){
				if(obj>0){
					alert("删除成功");
					location="/selects";
				}else{
					alert("删除失败");
				}
			}
		})
	}
</script>
</head>
<body>
	<form action="/selects" method="post">
		影片名称<input type="text" name="name" value="${movieVO.name }">&nbsp;上映时间&nbsp;<input type="text" name="t1" value="${movieVO.t1 }">--<input type="text" name="t2" value="${movieVO.t2 }"><br>
		导演<input type="text" name="actor" value="${movieVO.actor }">&nbsp;价格&nbsp;<input type="text" name="p1" value="${movieVO.p1 }">--<input type="text" name="p2" value="${movieVO.p2 }"><br>
		电影年代<input type="text" name="years" value="${movieVO.years }">&nbsp;&nbsp;电影时长<input type="text" name="l1" value="${movieVO.l1 }">--<input type="text" name="l2" value="${movieVO.l2 }"><br>
		<input type="submit" value="查询">
	</form>
	<table>
		<tr>
			<td>
				<input type="checkbox" onclick="cks(this)">
			<td>
			<td>电影名称</td>
			<td>导演</td>
			<td><a href="javascript:morder('price')">票价</a></td>
			<td>上映日期</td>
			<td><a href="javascript:morder('longtime')">电影时长</a></td>
			<td><a href="javascript:morder('years')">年代</a></td>
			<td>类型</td>
			<td>区域</td>
			<td>状态</td>

		</tr>
		<c:forEach items="${list }" var="movie" varStatus="i">

			<tr>
				
				<td>
					<input type="checkbox" value="${movie.id }" class="ck">
				</td>
				<td>${i.count }</td>
				<td>${movie.name }</td>
				<td>${movie.actor }</td>
				<td>${movie.price }</td>
				<td>${movie.uptime }</td>
				<td>${movie.longtime }</td>
				<td>${movie.years }</td>
				<td>${movie.type }</td>
				<td>${movie.area }</td>
				<td>${movie.status }</td>
			</tr>


		</c:forEach>
		<tr>
			<td colspan="100">
				<input type="button" value="批量删除" onclick="del()">
			</td>
		</tr>

	</table>

</body>
</html>