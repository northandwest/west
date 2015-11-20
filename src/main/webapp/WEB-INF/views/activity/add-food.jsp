<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>订餐吧</title>

		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />

		<!-- basic styles -->

		<link href="${resource}/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="${resource}/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="${resource}/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

		<link rel="stylesheet" href="${resource}/assets/css/ace-fonts.css" />

		<!-- ace styles -->

		<link rel="stylesheet" href="${resource}/assets/css/ace.min.css" />
		<link rel="stylesheet" href="${resource}/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="${resource}/assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="${resource}/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="${resource}/assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="${resource}/assets/js/html5shiv.js"></script>
		<script src="${resource}/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>
		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<c:import url="/header"></c:import>
		</div>



			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
							<c:import url="/sidebar"></c:import>

				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="#">首页</a>
							</li>
							<li class="active">展示</li>
						</ul><!-- .breadcrumb -->

		
					</div>

					<div class="page-content">
						<div class="page-header">
							<h1>
								人是铁饭是啥？
								<small>
									<i class="icon-double-angle-right"></i>
									开点 
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
						<div class="col-xs-12">
							<form class="form-horizontal" role="form" id="form1" action="${ctx}/activity/orderdetail/save">
							<input type="hidden" name="activityId" value="${param.id}">
									
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称</label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="userName" placeholder="名称" class="col-xs-10 col-sm-3">
										</div>
									</div>

									<div class="space-4"></div>
									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 菜名</label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="food" placeholder="菜名" class="col-xs-10 col-sm-3">
											<input type="text" id="form-field-2"  name="num" value="1" placeholder="数量" class="col-xs-10 col-sm-2">
										</div>
									</div>

									<div class="space-4"></div>
												<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 菜名</label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="food" placeholder="菜名" class="col-xs-10 col-sm-3">
											<input type="text" id="form-field-2"  name="num" value="1" placeholder="数量" class="col-xs-10 col-sm-2">
										</div>
									</div>

									<div class="space-4"></div>
												<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 菜名</label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="food" placeholder="菜名" class="col-xs-10 col-sm-3">
											<input type="text" id="form-field-2"  name="num" value="1" placeholder="数量" class="col-xs-10 col-sm-2">
										</div>
									</div>

									<div class="space-4"></div>
												<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 菜名</label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="food" placeholder="菜名" class="col-xs-10 col-sm-3">
											<input type="text" id="form-field-2"  name="num" value="1" placeholder="数量" class="col-xs-10 col-sm-2">
										</div>
									</div>

									<div class="space-4"></div>
									
										<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 菜名</label>

										<div class="col-sm-9">
											<input type="text" id="form-field-1" name="food" placeholder="菜名" class="col-xs-10 col-sm-3">
											<input type="text" id="form-field-2"  name="num" value="1" placeholder="数量" class="col-xs-10 col-sm-2">
										</div>
									</div>

									<div class="space-4"></div>

									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="button" onclick="$('#form1').submit()">
												<i class="icon-ok bigger-110"></i>
												提交
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="icon-undo bigger-110"></i>
												返回
											</button>
										</div>
									</div>
									</form>
</div>

					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

			
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='${resource}/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${resource}/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='${resource}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="${resource}/assets/js/bootstrap.min.js"></script>
		<script src="${resource}/assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<!--[if lte IE 8]>
		  <script src="${resource}/assets/js/excanvas.min.js"></script>
		<![endif]-->

		<script src="${resource}/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="${resource}/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="${resource}/assets/js/jquery.slimscroll.min.js"></script>
		<script src="${resource}/assets/js/jquery.easy-pie-chart.min.js"></script>
		<script src="${resource}/assets/js/jquery.sparkline.min.js"></script>
		<script src="${resource}/assets/js/flot/jquery.flot.min.js"></script>
		<script src="${resource}/assets/js/flot/jquery.flot.pie.min.js"></script>
		<script src="${resource}/assets/js/flot/jquery.flot.resize.min.js"></script>

		<!-- ace scripts -->

		<script src="${resource}/assets/js/ace-elements.min.js"></script>
		<script src="${resource}/assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($) {
				$('.easy-pie-chart.percentage').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
					var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
					var size = parseInt($(this).data('size')) || 50;
					$(this).easyPieChart({
						barColor: barColor,
						trackColor: trackColor,
						scaleColor: false,
						lineCap: 'butt',
						lineWidth: parseInt(size/10),
						animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
						size: size
					});
				})
			
				$('.sparkline').each(function(){
					var $box = $(this).closest('.infobox');
					var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
					$(this).sparkline('html', {tagValuesAttribute:'data-values', type: 'bar', barColor: barColor , chartRangeMin:$(this).data('min') || 0} );
				});
			
			
			
			
			  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
			  var data = [
				{ label: "social networks",  data: 38.7, color: "#68BC31"},
				{ label: "search engines",  data: 24.5, color: "#2091CF"},
				{ label: "ad campaigns",  data: 8.2, color: "#AF4E96"},
				{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
				{ label: "other",  data: 10, color: "#FEE074"}
			  ]
			  function drawPieChart(placeholder, data, position) {
			 	  $.plot(placeholder, data, {
					series: {
						pie: {
							show: true,
							tilt:0.8,
							highlight: {
								opacity: 0.25
							},
							stroke: {
								color: '#fff',
								width: 2
							},
							startAngle: 2
						}
					},
					legend: {
						show: true,
						position: position || "ne", 
						labelBoxBorderColor: null,
						margin:[-30,15]
					}
					,
					grid: {
						hoverable: true,
						clickable: true
					}
				 })
			 }
			 drawPieChart(placeholder, data);
			
			 /**
			 we saved the drawing function and the data to redraw with different position later when switching to RTL mode dynamically
			 so that's not needed actually.
			 */
			 placeholder.data('chart', data);
			 placeholder.data('draw', drawPieChart);
			
			
			
			  var $tooltip = $("<div class='tooltip top in'><div class='tooltip-inner'></div></div>").hide().appendTo('body');
			  var previousPoint = null;
			
			  placeholder.on('plothover', function (event, pos, item) {
				if(item) {
					if (previousPoint != item.seriesIndex) {
						previousPoint = item.seriesIndex;
						var tip = item.series['label'] + " : " + item.series['percent']+'%';
						$tooltip.show().children(0).text(tip);
					}
					$tooltip.css({top:pos.pageY + 10, left:pos.pageX + 10});
				} else {
					$tooltip.hide();
					previousPoint = null;
				}
				
			 });
			
			
			
			
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});
			
			
				$('#recent-box [data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('.tab-content')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
			
			
				$('.dialogs,.comments').slimScroll({
					height: '300px'
			    });
				
				
				//Android's default browser somehow is confused when tapping on label which will lead to dragging the task
				//so disable dragging when clicking on label
				var agent = navigator.userAgent.toLowerCase();
				if("ontouchstart" in document && /applewebkit/.test(agent) && /android/.test(agent))
				  $('#tasks').on('touchstart', function(e){
					var li = $(e.target).closest('#tasks li');
					if(li.length == 0)return;
					var label = li.find('label.inline').get(0);
					if(label == e.target || $.contains(label, e.target)) e.stopImmediatePropagation() ;
				});
			
				$('#tasks').sortable({
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'draggable-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					stop: function( event, ui ) {//just for Chrome!!!! so that dropdowns on items don't appear below other items after being moved
						$(ui.item).css('z-index', 'auto');
					}
					}
				);
				$('#tasks').disableSelection();
				$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
					if(this.checked) $(this).closest('li').addClass('selected');
					else $(this).closest('li').removeClass('selected');
				});
				
			
			})
		</script>
	</body>
</html>