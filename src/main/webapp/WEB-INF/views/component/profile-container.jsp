<%@page import="java.util.Map"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<head>
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
		  width: 60px;
		  text-align:center;
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

	</style>

</head>

<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<c:choose>
	<c:when test="${user == null || user.anonymous}">
		<p align="center">Currently you are playing anonymous.<br> Please register below and start saving your score, earn badges and ranks with your own personal statistics.</p>
		<div class="row">
			<div class="col-md-4">&nbsp;</div>
			<div class="col-md-4">
				 					
		<f:form commandName="form" action="/registreren" autocomplete="off" id="user-register" method="post">
			<div id="register-error" class="error">Bad credentials</div>
		
		    <label for="email">E-mail address</label>
		    <f:input path="email" type="email" id="email" required="required" />
		
		    <label for="password">Password</label>
		    <f:password path="auth.password" type="password" id="password" required="required" />
		
		    <label for="re-password">Repeat Password</label>
		    <f:password path="auth.repeatPassword" type="password" id="re-password" required="required" />
		
		    <label for="username">Username</label>
		    <f:input path="auth.name" type="text" id="username" required="required" />
		    
		    <f:checkbox value="" path="agreeTos" id="agree_tos" required="required" />
		    <span>I agree with the <a class="terms" href="#" target="_blank">terms and conditions</a></span>
		
		    <button id="register" type="submit">Sign Up</button>
		</f:form>
		

			</div>
	</c:when>
	
	
	<c:otherwise>
	
		<div style="margin-left: 30px; margin-top: 10px; margin-right: 30px;">
	<!-- USER INFORMATION !-->
	  	<div class="row">
	    	<div class="col-md-4 col-xs-12">
	      		<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
	      			<div class="row">
	        			<div class="col-xs-12 col-sm-12 text-center">
	        				<form method="POST" action="/user/update" enctype="multipart/form-data">
								<c:choose>
									<c:when test="${user.imageUrl == null}">

		          						<img width="70%" src="${user.avatarUrl}" alt="" class="center-block img-circle img-thumbnail img-responsive">
		          						<span style="float:right; position: relative;">
								       		 <input type="file" name="file" accept="image/*" /><br /> 
		 							    </span>
									</c:when>
								    <c:otherwise>
										<img width="70%" src="${appBaseUrl}/user/image" alt="" class="center-block img-circle img-thumbnail img-responsive">
		          						<span style=" float:right; position: relative;">
		          					
								        	<input  type="file" name="file" accept="image/*" /><br /> 
								    	</span>
								    </c:otherwise>
								</c:choose>
		          				
		<!--           					<button type="button" class="btn btn-default">Edit profile image</button><br> -->
		          				</span>
		            			<h2>${user.name}</h2>

	<!-- 	            			<input type="submit" value="Edit" /> -->
	            				<a href="javascript:;" class="btn btn-primary pull-right" id="edit-details" onclick="uploadFile(this)">Save</a>
								<a href="javascript:;" class="btn btn-primary pull-right" id="submit-details">Edit</a>
								<a href="javascript:;" class="btn pull-right" id="close-details">Cancel</a>
								
							</form>
	            			<table class="table table-condensed table-clean">
								<tr>
									<th class="span2 indent">Name</th>
									<td>${user.name}</td>
								</tr>
	
									<tr>
										<th class="span2 indent">Age</th>
										<td>${user.age}</td>
									</tr>
	
									<tr>
										<th class="span2 indent">Gender</th>
										<td>${user.gender}</td>
									</tr>
		
							</table>
	        			</div>
	    			</div>
	
				    <div class="row" style="background-color: #363636; color: #d5d3d4; padding:10px; margin-bottom: -18px; margin-left: -18px; margin-right: -18px;">
				            <div class="col-xs-4 col-sm-4 text-center">
				              <span class="fa fa-tag fa-lg"><strong> &nbsp;${user.totalTags}</strong></span>
				            </div>
				            <div class="col-xs-4 col-sm-4 text-center" id="verticalline">
				              <span class="fa fa-gamepad fa-lg"><strong> &nbsp;${user.totalMatches}</strong></span>
				            </div>
				            <div  class="col-xs-4 col-sm-4 text-center" id="verticalline">
				              <span class="fa fa-clock-o fa-lg"><strong> &nbsp;<fmt:formatNumber type="number" value="${user.totalHours / 3600000}" maxFractionDigits="0" pattern="###.###" /></strong></span>
				            </div>
				        </div>
				    </div>
	  			</div>
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
										<div class="tools">
											<span class="label label-danger">
												20% <i class="fa fa-arrow-up"></i>
											</span>
										</div>
									</div>
									
									
									
									<div class="box-body">
										<div id="chart-revenue" style="height:240px"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
	
	                <div class="row" style="margin-left: -18px; margin-bottom: -18px; margin-right: -18px; background-color: #272727; color: #d5d3d4; padding:10px;">
	                	<h4 style="margin-left: 18px">Tags</h4>
		             	<div class="col-md-12 leftmargin"> 
		                    <div class="col-md-2 text-center col-xs-4">
		                        <span id="pie_1" class="chartp" data-percent="${(numUnmatchedTags / unmatchedBadgeScore) * 100}">
		                          <span class="percent"></span>
		                          
		                          <a href="#" class=" text-center title">Unmatched Tags <br><i class="fa fa-star-half-o"></i> ${numUnmatchedTags}</a>
		                        </span>
		                    </div>
		                    <div class="col-md-2 text-center col-xs-4">
		                        <span id="pie_2" class="chartp" data-percent="${(numMatchedTags / matchedBadgeScore) * 100}">
		                          <span class="percent"></span>
		                           <a href="#" class="title">Matched Tags <br><i class="fa fa-star"></i> ${numMatchedTags}</a>
		                        </span>
		                     
		                    </div>
		                    <div class="col-md-2 text-center col-xs-4" >
		                        <span id="pie_3" class="chartp" data-percent="${(numDictTags / dictBadgeScore) * 100}">
		                          	<span class="percent"></span>
		                      		<a href="#" class="title">Dictionary Tags <br> <i class="fa fa-book"></i> ${numDictTags}</a>
		                        </span>
	
		                    </div>
		                    <div class="col-md-2 text-center col-xs-4">
		                        <span id="pie_4" class="chartp" data-percent="${(numPioneerTags / pioneerBadgeScore) * 100}">
		                          <span class="percent"></span>
		                     	  <a href="#" class="title">Pioneer Tags <br><i class="fa fa-flag"></i> ${numPioneerTags}</a>
		                        </span>
		                    </div>
		                    <div class="col-md-2 text-center col-xs-4">
		                        <span id="pie_5" class="chartp" data-percent="70">
		                          	<span class="percent"></span>
		                      		<a href="#" class="title">Campaign Tags <br><i class="fa fa-trophy"></i> 38</a>
		                        </span>
		                    </div>
		                    <div class="col-md-2 text-center col-xs-4">
		                        <span id="pie_6" class="chartp" data-percent="70">
		                          	<span class="percent"></span>
		                      		<a href="#" class="title">Campaign Tags <br><i class="fa fa-trophy"></i> 38</a>
		                        </span>
		                    </div>
		              	</div>
		              	<p>&nbsp;<br>&nbsp;</p>
	                </div>
	           	</div>
	        </div>
	        <!-- Ranks and Badges !-->
	        <div class="col-md-2 col-xs-12">
		      	<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
		          	<div class="row">
		           		<div class="col-xs-12 col-sm-12 text-center" style="background-color: #272727;">
							<h2 style="text-align: left;">Ranks</h2>
							<div class="col-md-12">
								<h4 style="text-align:left;">Current Rank </h4>
								
								<c:set var="rank" value="${user.rank}"></c:set>
								
								<c:if test="${rank != null}">
									
								
									<img width="100%" src="${appBaseUrl}${user.rank.imageUrl}"/>
									<p> ${rank.title} </p>
										<div class="progress">
										  <div class="progress-bar progress-bar-active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" 
										  		style="width: ${(user.totalScore / nextRank.scoring) * 100}%">${user.totalScore} points
										  </div>
										</div>
									<p>${nextRank.scoring - user.totalScore} points left to reach next rank.</p>
								
								</c:if>
								
								
							</div>
						</div>
					</div>
	           	</div>
	        </div>
	        <div class="col-md-2 col-xs-12">
		      	<div class="well panel panel-default" style="background-color: #363636;color: #d5d3d4; ">
		          	<div class="row">
		           		<div class="col-xs-12 col-sm-12 text-center" style="background-color: #363636;">
							<h2 style="text-align: left;">Badges</h2>
							<div class="col-md-12">
								<h4 style="text-align:left;">Obtained badges</h4>
								<div class="col-md-6">
									<p>Match maker </p>
									<img width="100%"src="http://ec2-54-93-224-169.eu-central-1.compute.amazonaws.com:8080/static/img/albums/mapmaker.png"/>
								</div>
								<div id="verticalline" class="col-md-6">
									<p>You know Nothing </p>
									<img width="100%"src="http://ec2-54-93-224-169.eu-central-1.compute.amazonaws.com:8080/static/img/albums/nothing.png"/>
								</div>
							</div>
						</div>
					</div>
	           	</div>
	        </div>
	    </div>

	</div>
	
	
		<!-- FLOT CHARTS -->
	
	
		<script>
		
		$(function() {
			$('#pie_1').easyPieChart({
				easing: 'easeOutBounce',
				onStep: function(from, to, percent) {
					$(this.el).find('.percent').text(Math.round(percent)+"%");
				},
				lineWidth: 4,
				barColor: '#F0AD4E'
			});
			$('#pie_2').easyPieChart({
				easing: 'easeOutBounce',
				onStep: function(from, to, percent) {
					$(this.el).find('.percent').text(Math.round(percent)+"%");
				},
				lineWidth: 4,
				barColor: '#D9534F'
			});
			$('#pie_3').easyPieChart({
				easing: 'easeOutBounce',
				onStep: function(from, to, percent) {
					$(this.el).find('.percent').text(Math.round(percent)+"%");
				},
				lineWidth: 4,
				barColor: '#70AFC4'
			});
			$('#pie_4').easyPieChart({
				easing: 'easeOutBounce',
				onStep: function(from, to, percent) {
					$(this.el).find('.percent').text(Math.round(percent)+"%");
				},
				lineWidth: 4,
				barColor: '#3065C4'
			});
			$('#pie_5').easyPieChart({
				easing: 'easeOutBounce',
				onStep: function(from, to, percent) {
					$(this.el).find('.percent').text(Math.round(percent)+"%");
				},
				lineWidth: 4,
				barColor: '#3cff78'
			});
			$('#pie_6').easyPieChart({
				easing: 'easeOutBounce',
				onStep: function(from, to, percent) {
					$(this.el).find('.percent').text(Math.round(percent)+"%");
				},
				lineWidth: 4,
				barColor: '#3065C4'
			});
		});
		</script>
		<script>
		/*-----------------------------------------------------------------------------------*/
		/*	Handles flot charts in dashboard
		/*-----------------------------------------------------------------------------------*/
	
	// 		console.info('${monthTagMap["JANUARY"]}');
	// 	console.info('${monthTagMap["SEPTEMBER"]}');
		
			function chart_revenue() {
				var likes = [
			             [1, '${monthTagMap["JANUARY"]}'], 
			             [2, '${monthTagMap["FEBRUARY"]}'], 
			             [3, '${monthTagMap["MARCH"]}'], 
			             [4, '${monthTagMap["APRIL"]}'],
			             [5, '${monthTagMap["MAY"]}'],
			             [6, '${monthTagMap["JUNE"]}'],
			             [7, '${monthTagMap["JULY"]}'],
			             [8, '${monthTagMap["AUGUST"]}'],
			             [9, '${monthTagMap["SEPTEMBER"]}'],
			             [10, '${monthTagMap["OCTOBER"]}'],
			             [11, '${monthTagMap["NOVEMBER"]}'],
			             [12, '${monthTagMap["DECEMBER"]}']
				    ];
			
				var chartColor = $(this).parent().parent().css("color");
				
				var plot = $.plot($("#chart-revenue"),
					   [ { data: likes} ], {
						   series: {
							   label: "Tags",
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
								ticks:6, 
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
						border: '1px solid #fdd',
						padding: '2px',
						'background-color': '#dfeffc',
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
											item.series.label + " on " + x + " = " + y);
							}
						}
						else {
							$("#tooltip").remove();
							previousPoint = null;
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
		/*-----------------------------------------------------------------------------------*/
		/*	jQuery UI Progress
		/*-----------------------------------------------------------------------------------*/
		var handleProgress = function () {
			$(document).ready(function(){
				jQuery.fn.anim_progressbar = function (aOptions) {
					// def values
					var iCms = 1000;
					var iMms = 60 * iCms;
					var iHms = 3600 * iCms;
					var iDms = 24 * 3600 * iCms;
	
					// def options
					var aDefOpts = {
						start: new Date(), // now
						finish: new Date().setTime(new Date().getTime() + 60 * iCms), // now + 60 sec
						interval: 100
					}
					var aOpts = jQuery.extend(aDefOpts, aOptions);
					var vPb = this;
	
					// each progress bar
					return this.each(
						function() {
							var iDuration = aOpts.finish - aOpts.start;
	
							// calling original progressbar
							$(vPb).children('.pbar').progressbar();
	
							// looping process
							var vInterval = setInterval(
								function(){
									var iLeftMs = aOpts.finish - new Date(); // left time in MS
									var iElapsedMs = new Date() - aOpts.start, // elapsed time in MS
										iDays = parseInt(iLeftMs / iDms), // elapsed days
										iHours = parseInt((iLeftMs - (iDays * iDms)) / iHms), // elapsed hours
										iMin = parseInt((iLeftMs - (iDays * iDms) - (iHours * iHms)) / iMms), // elapsed minutes
										iSec = parseInt((iLeftMs - (iDays * iDms) - (iMin * iMms) - (iHours * iHms)) / iCms), // elapsed seconds
										iPerc = (iElapsedMs > 0) ? iElapsedMs / iDuration * 100 : 0; // percentages
	
									// display current positions and progress
									$(vPb).children('.percent').html('<b>'+iPerc.toFixed(1)+'%</b>');
									$(vPb).children('.elapsed').html(iDays+' day '+iHours+' hr : '+iMin+' min : '+iSec+' sec remaining</b>');
									$(vPb).children('.pbar').children('.ui-progressbar-value').css('width', iPerc+'%');
	
									// in case of Finish
									if (iPerc >= 100) {
										clearInterval(vInterval);
										$(vPb).children('.percent').html('<b>100%</b>');
										$(vPb).children('.elapsed').html('Completed');
									}
								} ,aOpts.interval
							);
						}
					);
				}
	
				// default mode
				$('#progress1').anim_progressbar();
	
				// from second #5 till 15
				var iNow = new Date().setTime(new Date().getTime() + 5 * 1000); // now plus 5 secs
				var iEnd = new Date().setTime(new Date().getTime() + 15 * 1000); // now plus 15 secs
				$('#progress2').anim_progressbar({start: iNow, finish: iEnd, interval: 100});
	
				// we will just set interval of updating to 1 sec
				$('#progress3').anim_progressbar({interval: 1000});
			});
	
		}
		</script>
		
	</c:otherwise>
	
</c:choose>

