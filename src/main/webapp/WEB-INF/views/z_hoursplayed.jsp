<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Map"%>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="${appBaseUrl}/static/script/profile/jquery.easypiechart.min.js"></script>
<script src="${appBaseUrl}/static/script/profile/jquery.flot.min.js"></script>
<script src="${appBaseUrl}/static/script/profile/jquery.flot.time.min.js"></script>
<script src="${appBaseUrl}/static/script/profile/jquery.flot.selection.min.js"></script>
<script src="${appBaseUrl}/static/script/profile/jquery.flot.resize.min.js"></script>
<script src="${appBaseUrl}/static/script/profile/jquery.flot.pie.min.js"></script>
<script src="${appBaseUrl}/static/script/profile/jquery.flot.stack.min.js"></script>
<script src="${appBaseUrl}/static/script/profile/jquery.flot.crosshair.min.js"></script>
<script src="${appBaseUrl}/static/script/global.js"></script>


<link href="${appBaseUrl}/static/styles/css/mainSlider.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/main.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/styleCDT.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/simple-sidebar.css" rel="stylesheet" />
<c:set var="you" value="${user != null && user.id == profile.user.id}"/>

	<style>
		.chartp{
			position: relative;
			display: inline-block;
			width: 60px;
			height: 60px;
			margin-top:20px;
			margin-bottom: 0px;
			text-align:center;
		}
		.chartp canvas{
			position: absolute;
			top: 0px;
			left: 0px;
		}

		.percent{
			display: inline-block;
			line-height:60px;
			z-index:2;

		}
		.title {
		  position: relative;
		  color: #999;
		  display: block;
		  font-size: 10px;
		  font-weight: 400;
		  margin-top: 5px;

		  text-transform: uppercase;
		}
		.box {
			clear:both;
			margin-top:0px;
			margin-bottom: 25px;
			padding: 0px;
		}

		.box.solid.grey {
			border: 1px solid:#626262;
		}
		.box.solid.grey .box-title{
			color: #fff;
			background-color: #6F6F6F;
			border-bottom: 1px solid #626262;
		}
		.box.border >.box-title, .box.solid > .box-title{
			padding: 8px 10px 2px;
			min-height: 30px;
			margin-bottom: 0px;
		}
		.box.solid.grey .box-body{
			color: #ffffff;
			background-color: #6F6F6F !important;
		}
		.box.border .box-body, .box.solid .box-body{
			border-radius: 0px 0px 4px 4px;
			padding: 10px;
		}
		canvas{
			display: inline-block;
		}
		.box-border > .box-title .tools, .box.solid > .box-title .tools{
			display: inline-block;
			padding: 0px;
			margin-top: -40px;
			margin-bottom: 7px;
			float: right;
			clear: both;
			min-height: 30px;
		}
		#verticalline{
			border-left: 0.5px solid #fff;
		}
		#inputcss{
			line-height: normal;
			margin: 0px;
			font-size: 100%;
			vertical-align: middle;
		}

		.table-striped>tbody>tr:nth-child(odd)>td, 
		.table-striped>tbody>tr:nth-child(odd)>th {
		   background-color: #000;
		 }
		 .table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
		   background-color: #d5d3d4;
		   color: #000;
		}
		.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {

		    border-top: none;
		}
		input{
			color:#000;
		}
		.form-horizontal.boxed .control-label {
		    width: 90px;
		    padding-top: 0px;
		    line-height: 2em;
		}
		.form-horizontal .control-label {
		    float: left;
		    width: 140px;
		    padding-top: 5px;
		    text-align: right;
		}
		label {
		    display: inline-block;
		    margin-bottom: 5px;
		    margin-left: 5px;

		}
		label, input, button, select, textarea {
		    font-size: 13px;
		    font-weight: normal;
		    line-height: 30px;
		    margin-top:15px;
		}
		.form-horizontal.boxed .controls {
		    margin-left: 100px;
		}
		.form-horizontal .controls {
		    margin-left: 160px;
		}
		.form-horizontal.boxed .indent-form {
		    display: block;
		    margin-left: 100px;
		}
		.spaced-min {
		    padding-bottom: 9px;
		}
		.form-horizontal.boxed .input {
		    display: inline-block;
		}
		input[type="image"], input[type="checkbox"], input[type="radio"] {
		    width: auto;
		    height: auto;
		    padding: 0px;
		    margin: 3px 0px;
		    line-height: normal;
		    cursor: pointer;
		    background-color: transparent;
		    border-radius: 0px;
		    margin-left: 10px;

		}
	</style>





<div id="hoursplayed" >
	<!-- STATISTICS COLUMN !-->
	<div class="col-md-6 col-xs-12">
	  	<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
	      	<div class="row">
	       		<div class="col-xs-12 col-sm-12 text-center" style="background-color: #272727;">
					<h2 style="text-align: left;">Statistics</h2>
					<div class="col-md-12">
						<div class="box solid">
							<div class="box-title">
								<h4 style="text-align: left;">Monthly performance</h4>
								<h5>Played hours per month </h5>
								<div class="tools">
								<c:choose>	
									<c:when test="${((monthTimeMap['NOVEMBER']-monthTimeMap['OCTOBER'])/monthTimeMap['OCTOBER']*100) < 0}">
										<span class="label label-danger">
										<fmt:formatNumber type="number" value="${(monthTimeMap['NOVEMBER']-monthTimeMap['OCTOBER'])/monthTimeMap['OCTOBER']*100}" maxFractionDigits="0" pattern="###.###" />%
										 <i class="fa fa-arrow-down"></i>
									</span>
									</c:when>
									<c:otherwise>
										<span class="label label-success">
										<fmt:formatNumber type="number" value="${(monthTimeMap['NOVEMBER']-monthTimeMap['OCTOBER'])/monthTimeMap['OCTOBER']*100}" maxFractionDigits="0" pattern="###.###" />%
										 <i class="fa fa-arrow-up"></i>
									</c:otherwise>
								</c:choose>	
								</div>
							</div>
							<div class="box-body">
								<div id="chart-revenue" style="height:240px"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- #tagcloud -->
	<div class="col-md-6 col-xs-12">
  		<div class="col-md-6 headline maxwidth">
			<span><i class="fa fa-shield"></i>&nbsp;&nbsp; MOST HOURS PLAYED</span>
				
			<table class="leaderbord table .table-responsive" border="none !important" >
				<tbody class="leader">
				
					<c:forEach varStatus="loop" var="userRank" items="${globalStats.mostRankUsers}">
						
						<c:choose>
							<c:when test="${user != null && userRank.name eq user.name}">
								<c:set var="userRankClass" value="user"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="userRankClass" value=""></c:set>
							</c:otherwise>
						</c:choose>
						<c:choose>
								<c:when test="${userRank.imageUrl == null}">
									<tr class="${userRankClass}">
										<td><img style="width: 60px; height: 60px;" class="center-block img-circle img-thumbnail img-responsive" src="${userRank.avatarUrl}" /></td>					
	          						
								</c:when>
							    <c:otherwise>
									<tr class="${userRankClass}">
										<td><img style="width: 60px; height: 60px;" class="center-block img-circle img-thumbnail img-responsive" src="/user/image/${userRank.id}" /></td>
								    </c:otherwise>

							</c:choose>
							    <td><span><a style="color:#fff;" class="profilelinking" data-item="/profiel/${userRank.id}" href="javascript:;">${loop.index + 1}. ${userRank.name}</a></span><br> <p><img style="float:left; display:inline;" src="${appBaseUrl}${userRank.rank.imageUrlRank}" height="20px"/>&nbsp;&nbsp; Score for next rank: ${userRank.id}</p> </td>
									</tr>
					</c:forEach>
				
				</tbody>
			</table>
		</div>
	</div>
</div>




		<!-- FLOT CHARTS -->
	
	

		<script>
		/*-----------------------------------------------------------------------------------*/
		/*	Handles flot charts in dashboard
		/*-----------------------------------------------------------------------------------*/
	
	// 		console.info('${monthTagMap["JANUARY"]}');
	// 	console.info('${monthTagMap["SEPTEMBER"]}');
		
			function chart_revenue() {
				var likes = [
			             [1, '${monthTimeMap["JANUARY"]/3600000}'], 
			             [2, '${monthTimeMap["FEBRUARY"]/3600000}'], 
			             [3, '${monthTimeMap["MARCH"]/3600000}'], 
			             [4, '${monthTimeMap["APRIL"]/3600000}'],
			             [5, '${monthTimeMap["MAY"]/3600000}'],
			             [6, '${monthTimeMap["JUNE"]/3600000}'],
			             [7, '${monthTimeMap["JULY"]/3600000}'],
			             [8, '${monthTimeMap["AUGUST"]/3600000}'],
			             [9, '${monthTimeMap["SEPTEMBER"]/3600000}'],
			             [10, '${monthTimeMap["OCTOBER"]/3600000}'],
			             [11, '${monthTimeMap["NOVEMBER"]/3600000}'],
			             [12, '${monthTimeMap["DECEMBER"]/3600000}']
				    ];
			
				var chartColor = $(this).parent().parent().css("color");
				
				var plot = $.plot($("#chart-revenue"),
					   [ { data: likes} ], {
						   series: {
							   label: "Hours",
							   lines: { 
									show: true,
									lineWidth: 3, 
									fill: false
							   },
							   points: { 
									show: true, 
									lineWidth: 3,
									fill: true,
									fillColor: chartColor 
							   },	
							   shadowSize: 0
						   },
						   grid: { hoverable: true, 
								   clickable: true, 
								   tickColor: "rgba(255,255,255,.15)",
								   borderColor: "rgba(255,255,255,0)"
								 },
						   colors: ["#fff"],
						   xaxis: {
								font: {
									color: "#fff"
								},
								ticks:12, 
								tickDecimals: 0, 
								tickColor: chartColor,
						   },
						   yaxis: {
								font: {
									color: "#fff"
								},
								ticks:4, 
								tickDecimals: 0,
								autoscaleMargin: 0.000001
						   },
						   legend: {
								show: false
						   }
						 });
	
				function showTooltip(x, y, contents) {
					$('<div id="tooltip">' + contents + '</div>').css( {
						position: 'absolute',
						display: 'none',
						top: y + 5,
						left: x + 5,
						border: '1px solid #fff',
						padding: '2px',
						'background-color': '#000',
						opacity: 0.80
					}).appendTo("body").fadeIn(200);
				}
	
				var previousPoint = null;
				$("#chart-revenue").bind("plothover", function (event, pos, item) {
					$("#x").text(pos.x.toFixed(2));
					$("#y").text(pos.y.toFixed(2));
	
						if (item) {
							if (previousPoint != item.dataIndex) {
								previousPoint = item.dataIndex;
	
								$("#tooltip").remove();
								var x = item.datapoint[0].toFixed(2),
									y = item.datapoint[1].toFixed(2);
	
								showTooltip(item.pageX, item.pageY,
											y + " " + item.series.label + " on " + x );
							}
						}
						else {
							$("#tooltip").remove();
							previousPoint = item.dataIndex;
						}
				});
			}
		</script>


		<script>
			jQuery(document).ready(function() {		
				chart_revenue();
			});
		</script>

<script>
	$(function() {
		debugger;
		
		$('.profilelinking').click(function() {
			 var url = $(this).attr("data-item");
			 
			 $.ajax({
	    			method: "GET",
	    			url: url
    		 })
    		 .done(function( data ) {
    			if (data) {
    				$('#hoursplayed').html(data);
    			}
    		 })
    		 .fail(function(msg) {
    			$('#hoursplayed').html('Fail to load data');
    		 });
		 });
	});
</script>