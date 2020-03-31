<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>数据 - AdminLTE2定制版</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<link rel=“stylesheet”
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
</head>

<script type="text/javascript">

	/*window.onload = function () {

		if(location.href.indexOf("#reloaded")==-1){
			location.href=location.href+"#reloaded";
			window.location.href="${pageContext.request.contextPath}/member/findByIdInit";
			location.reload();


		}
	}*/

		<%--function aa(){--%>
		<%--	window.open("${pageContext.request.contextPath}/member/findAll");--%>
		<%--}--%>


			<!-- 执行的方法 -->
			<%--function myfun(){--%>
			<%--	if(${pageInfo.list==null}){--%>
			<%--		window.location.href="${pageContext.request.contextPath}/member/findAll";--%>
			<%--	}--%>

			<%--}--%>



	<%--function load111() {--%>
	<%--	window.location.href="${pageContext.request.contextPath}/member/findAllInit";--%>
	<%--}--%>
	<%--window.onload = function () {--%>
	<%--	//方法内容--%>
	<%--		window.location.href="${pageContext.request.contextPath}/member/findAllInit";--%>
	<%--}--%>
window.onload=function getorderNum() {
	var outTradeNo="";  //订单号
	for(var i=0;i<7;i++) //6位随机数，用以加在时间戳后面。
	{
		outTradeNo += Math.floor(Math.random()*10);
	}
	outTradeNo = new Date().getTime() + outTradeNo;  //时间戳，用来生成订单号。
	document.getElementById("orderNum").value = outTradeNo;
}



</script>

<body class="hold-transition skin-blue sidebar-mini" >

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header1.jsp"></jsp:include>
		<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside1.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				购买信息 <small>购买信息</small>
			</h1>
<%--			<ol class="breadcrumb">--%>
<%--				<li><a href="all-admin-index.html"><i--%>
<%--						class="fa fa-dashboard"></i> 首页</a></li>--%>
<%--				<li><a href="all-order-manage-list.html">购买详情</a></li>--%>
<%--				<li class="active">购买详情</li>--%>
<%--			</ol>--%>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content"> <!--订单信息-->

			<form action="/orders/insertOrders" method="post">

			<div class="panel panel-default">
				<div class="panel-heading">购买详情</div>
				<div class="row data-type">
					<div class="">
						<input type="hidden" class="form-control" id="orderNum" name="orderNum" placeholder="订单编号"
							   value="" readonly="readonly" >
					</div>

					<div class="col-md-2 title">商品名称</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" name="productName" placeholder="商品名称"
							value="${products.productName}" readonly="readonly">
					</div>


					<div >
						<input type="hidden" class="form-control" placeholder="产品ID" name="productId"
							   value="${products.id}" readonly="readonly" >
					</div>

					<div class="col-md-2 title">出发城市</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="出发城市" name="cityName"
							value="${products.cityName}" readonly="readonly">
					</div>

					<div class="col-md-2 title">出发时间</div>
					<div class="col-md-4 data">
						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<input type="text" class="form-control pull-right"
								id="datepicker-a6" value="${products.departureTime}" name="departureTime"
								readonly="readonly">
						</div>
					</div>
					<div class="col-md-2 title">价格</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="价格"
							value="${products.productPrice}" readonly="readonly" name="productPrice">
					</div>

					<div class="col-md-2 title rowHeight2x">其他信息</div>
					<div class="col-md-10 data rowHeight2x">
						<textarea class="form-control" rows="3" placeholder="其他信息" name="orderDesc">
							${products.productDesc }
						</textarea>
					</div>

				</div>
			</div>

				<!--订单信息/--> <!--游客信息-->
				<div class="panel panel-default">
					<div class="panel-heading">游客信息</div>
					<!--数据列表-->
					<table id="dataList"
						   class="table table-bordered table-striped table-hover dataTable">
						<thead>
						<tr>
							<th class="">姓名</th>
							<th class="">性别</th>
							<th class="">手机号码</th>
							<th class="">证件类型</th>
							<th class="">证件号码</th>
						</tr>
						</thead>
						<tbody>
						<%--<c:forEach items="${travellers}" var="traveller">--%>
						<%--<c:forEach ite.ms="${ordersList}" var="orders">--%>

						<tr>

							<td><input type="text" size="10" name="name" value="${CUSTOMER_SESSION.name}" style="border:none;"
									   readonly="readonly"></td>
							<td><input type="text" size="10" name="sex" value="${0==CUSTOMER_SESSION.sex?'男':'女' }" style="border:none;"
									   readonly="readonly"></td>
							<td><input type="text" size="20" name="phoneNum" style="border:none;"
									   value="${CUSTOMER_SESSION.phoneNum }" readonly="readonly"></td>
							<td><input type="text" size="15" name="credentialsType" style="border:none;"
									   value="身份证" readonly="readonly"></td>
							<td><input type="text" size="28" name="credentialsNum" style="border:none;"
									   value="${CUSTOMER_SESSION.peopleID }" readonly="readonly" ></td>
							<td><input type="hidden" size="10" name="travellerId" value="${CUSTOMER_SESSION.id}"
									   readonly="readonly"></td>
						</tr>
						<%--</c:forEach>--%>


						</tbody>
					</table>
					<!--数据列表/-->
				</div>


			<!--游客信息/--> <!--联系人信息-->
			<div class="panel panel-default">
				<ul style="list-style: none">
					<li>选择导游:
						<c:choose>
						<c:when test="${memberList==null}">
						<span style="color:#FF0000">加载导游数据失败</span>
						</c:when>
						<c:when test="${empty memberList}">
						<span style="color:#FF0000">未加载到导游数据</span>
						</c:when>
						<c:otherwise>
						<select name="memberId">
							<c:forEach items="${memberList}" var="member">
							<option value="${member.id}" name="memberId">${member.hyname}</option>
							</c:forEach>
							<select>

								</c:otherwise>
								</c:choose>
					<li>
				</ul>
<%--				<div class="panel-heading" >导游信息</div>--%>
<%--				<div class="row data-type">--%>

<%--					<div class="col-md-2 title">昵称</div>--%>
<%--					<div class="col-md-4 data text">${member.nickname }</div>--%>

<%--					<div class="col-md-2 title">联系人</div>--%>
<%--					<div class="col-md-4 data text">${member.hyname}</div>--%>

<%--					<div class="col-md-2 title">手机号</div>--%>
<%--					<div class="col-md-4 data text">${member.phoneNum}</div>--%>

<%--					<div class="col-md-2 title">邮箱</div>--%>
<%--					<div class="col-md-4 data text">${member.email}</div>--%>

<%--				</div>--%>
<%--			</div>--%>



			<!--联系人信息/--> <!--费用信息--> <c:if test="${orders.orderStatus==1}">
				<div class="panel panel-default">
					<div class="panel-heading">费用信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">支付方式</div>
						<div class="col-md-4 data text">在线支付-${orders.payTypeStr}</div>

						<div class="col-md-2 title">金额</div>
						<div class="col-md-4 data text">￥${orders.product.productPrice}</div>

					</div>
				</div>
			</c:if> <!--费用信息/--> <!--工具栏-->
			<div class="box-tools text-center">
				<button type="submit" class="btn bg-default"
				>提交订单</button>
				<button type="button" class="btn bg-default"
					onclick="history.back(-1);">返回</button>
			</div>
			</form>
				<!--工具栏/--> </section>
			<!-- 正文区域 /-->


		</div>

		<!-- 内容区域 /-->

        <!-- 底部导航 -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0.8
            </div>
            <strong>报名电话：13618881999 <a
                    href="https://www.tuniu.com">大表哥旅游团</a>.
            </strong> 带你去看不一样的风景
        </footer>
        <!-- 底部导航 /-->
	</div>

	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {

			// 激活导航位置
			setSidebarActive("order-manage");

			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
</body>


</html>