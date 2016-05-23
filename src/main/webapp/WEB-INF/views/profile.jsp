<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tt" %>
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


<link href="${appBaseUrl}/static/styles/css/bootstrap.min.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/jquery-ui.min.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/my-slider.css" rel="stylesheet" />

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
		.popover{
			width:450px;
		}
		.popover-title {
			    padding: 8px 14px;
			    margin: 0px;
			    color: #000;
			    font-size: 14px;
			    background-color: grey;
			    border-bottom: 1px solid #EBEBEB;
			    border-radius: 5px 15px 0px 0px;
		}
		.popover-content {
			   color:#000;
		}	



	</style>


<div id="linking">
	<c:choose>
	<c:when test="${you}">
	<div style="margin-left: 15px; margin-top: 10px; margin-right: 15px;">
	<h1>Your profile</h1>
	<p class="spaced">This profile is visible to all visitors of this site</p>		

	</c:when>
	<c:otherwise>
	<div style="margin-left: 45px; margin-top: 10px; margin-right:45px;">
	<h1>${fn:escapeXml(profile.user.name)}'s profile</h1>
	<p>Playing since ${profile.user.prettyCreationDate}</p>
	</c:otherwise>
	</c:choose>

	<div class="row">
		<div class="col-md-4 col-xs-12">
			<div class="box blow-up">
				<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
					<div class="box-inner">
						<c:choose>
							<c:when test="${profile.user.imageUrl == null}">
								<img src="${profile.user.avatarUrl}" class="img-circle img-thumbnail img-responsive pull-left" />
							</c:when>
							<c:otherwise>
								<img width="300px" src="${appBaseUrl}/user/image/${profile.user.id}" alt="" class="img-circle img-thumbnail img-responsive pull-left">
						    </c:otherwise>
						</c:choose>
						<c:if test="${user != null && user.id == profile.user.id}">
							<form method="POST" action="/user/update" enctype="multipart/form-data">

					       		 	<input style="clear:both" type="file" name="file" accept="image/*" /><br /> 
					       		 	<a href="javascript:;" class="btn small btn-success" id="edit-details" onclick="uploadFile(this)">Upload image</a>

							</form>
						</c:if>	
						<h2 class="center h1"><c:out value="${profile.user.name}"/></h2>	

						<p class="h1 reset clear-both"><nf:format number="${profile.user.totalScore}" /><span class="small">Total score</span></p>
					</div>


			
					<div id="personal-details" style="background-color: #272727;color: #d5d3d4;"  class="${errors ? 'edit-mode' : ''}">
						<header style="margin-top: 40px;" class="rich">
							<span>
							<h2 class="h3 reset pull-left">Details</h2>
							<c:if test="${you}">
								<a href="" class="btn btn-primary pull-right" id="edit-details">Edit</a>
								<a href="" class="btn btn-primary pull-right hide" id="submit-details">Save</a>
								<a href="" class="btn pull-right hide" id="close-details">Cancel</a>
							</c:if>
						</span>
						</header>
						
						<section style="margin-top:20px;" class="reset ">
							<c:if test="${user != null && user.id == profile.user.id}">
							<f:form commandName="form" autocomplete="off" xxaction="/profiel" cssClass="form-horizontal boxed hide">
								<fieldset>
									
									<f:hidden path="id"/>
									
									<div class="control-group">
										<f:label path="auth.name" cssClass="control-label">Name</f:label>
										<div class="controls">
											<f:input path="auth.name" cssClass="input-medium" />
											<f:errors path="auth.name" cssClass="help-block"/>
										</div>
									</div>

									<div class="control-group">
										<f:label path="dateOfBirth" cssClass="control-label">Date of birth</f:label>
										<div class="controls">
											<f:input path="dateOfBirth" placeholder="30-04-1980" cssClass="input-medium" />
											<f:errors path="dateOfBirth" cssClass="help-block" />
										</div>
									</div>
									
									<div class="control-group reset genderEditor">
										<f:label path="gender" cssClass="control-label">Gender</f:label>
										<div class="inline-boxes controls">
											<f:radiobuttons path="gender" itemLabel="prettyLongName"/>
										</div>
									</div>
									
									<a href="" id="trigger-password" class="indent-form spaced-min ${showPassword ? 'opened' : '' }">+ Change password</a>
									
									<div id="change-password">
										<div class="control-group">
											<f:label path="currentPassword" cssClass="control-label compact">Current password</f:label>
											<div class="controls">
												<f:password path="currentPassword" cssClass="input-medium" />
												<f:errors path="currentPassword" cssClass="help-block" />
											</div>
										</div>
										
										<div class="control-group">
											<f:label path="auth.password" cssClass="control-label">Password</f:label>
											<div class="controls">
												<f:password path="auth.password" cssClass="input-medium"/>
												<f:errors path="auth.password" cssClass="help-block"/>
											</div>
										</div>
										
										<div class="control-group">
											<f:label path="auth.repeatPassword" cssClass="control-label compact">Repeat password</f:label>
											<div class="controls">
												<f:password path="auth.repeatPassword" cssClass="input-medium"/>
												<f:errors path="auth.repeatPassword" cssClass="help-block"/>
											</div>
										</div>
									</div>
									
									<div class="control-group clear-both">
										<f:label path="usernameTwitter" cssClass="control-label"><img src="/static/img/ico-twitter.png" title="Twitter" /></f:label>
										<div class="controls">
											<f:input path="usernameTwitter" cssClass="input-medium" />
											<f:errors path="usernameTwitter" cssClass="help-block"/>
										</div>
									</div>
													
									<div class="control-group">
										<f:label path="usernameFacebook" cssClass="control-label"><img src="/static/img/ico-facebook.png" title="Facebook" /></f:label>
										<div class="controls">
											<f:input path="usernameFacebook" cssClass="input-medium" />
											<f:errors path="usernameFacebook" cssClass="help-block"/>
										</div>
									</div>
								</fieldset>
								<input type="submit" style="position:absolute;top:0;left:-10000px;"/>
							</f:form>
							</c:if>
							<table class="table table-condensed table-clean">
								<tr>
									<th class="span2 indent">Name</th>
									<td>${fn:escapeXml(profile.user.name)}</td>
								</tr>
								<c:if test="${profile.user.dateOfBirth != null}">
									<tr>
										<th class="span2 indent">Age</th>
										<td>${profile.user.age}</td>
									</tr>
								</c:if>
								<c:if test="${not empty profile.user.gender.prettyLongName}">
									<tr>
										<th class="span2 indent">Gender</th>
										<td>${profile.user.gender.prettyLongName}</td>
									</tr>
								</c:if>
								<c:if test="${not empty profile.user.usernameTwitter || not empty profile.user.usernameFacebook || not empty profile.user.usernameHyves}">
									<tr>
										<th class="span2 indent">Find me on</th>
										<td>
										<c:if test="${not empty profile.user.usernameTwitter}">
											<a href="http://twitter.com/${profile.user.usernameTwitter}" title="Twitter: @${fn:escapeXml(profile.user.usernameTwitter)}" target="_blank"><img src="/static/img/ico-twitter.png" /></a>
										</c:if>
										<c:if test="${not empty profile.user.usernameFacebook}">
											<a href="http://facebook.com/${profile.user.usernameFacebook}" title="Facebook: facebook.com/${fn:escapeXml(profile.user.usernameFacebook)}" target="_blank"><img src="/static/img/ico-facebook.png" /></a>
										</c:if>
										<c:if test="${not empty profile.user.usernameHyves}">
											<a href="http://${profile.user.usernameHyves}.hyves.nl" target="_blank" title="Hyves: ${fn:escapeXml(profile.user.usernameHyves)}.hyves.nl"><img src="/static/img/ico-hyves.png" /></a>
										</c:if>
										</td>
									</tr>
								</c:if>	
							</table>
						</section>
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
                	<p> The points you need to earn to earn your next badge!</p>
	             	<div class="col-md-12 leftmargin"> 
	                    <div class="col-md-4 text-center col-xs-4">
	                        <span id="pie_1" class="chartp" data-percent="${(numUnmatchedTags / unmatchedBadgeScore) * 100}">
	                          <span class="percent"></span>
	                          
	                          <a href="javascript:;" id="btn1" data-content="You need ${unmatchedBadgeScore -numUnmatchedTags} more unmatched tags before you earn your next Unmatched Badge" class=" text-center title" >Unmatched Tags <br><i class="fa fa-star-half-o"></i> ${numUnmatchedTags}</a>
	                        </span>
	                      <p><br/>&nbsp;</p>
	                    </div>
	                    <div class="col-md-4 text-center col-xs-4">
	                        <span id="pie_2" class="chartp" data-percent="${(numMatchedTags / matchedBadgeScore) * 100}">
	                          <span class="percent"></span>
	                           <a href="javascript:;" id="btn2" data-content="You need ${matchedBadgeScore -numMatchedTags} more unmatched tags before you earn your next Matched Badge" class="title">Matched Tags <br><i class="fa fa-star"></i> ${numMatchedTags}</a>
	                        </span>
	                      <p><br/>&nbsp;</p>
	                    </div>
	                    <div class="col-md-4 text-center col-xs-4" >
	                        <span id="pie_3" class="chartp" data-percent="${(numDictTags / dictBadgeScore) * 100}">
	                          	<span class="percent"></span>
	                      		<a href="javascript:;" id="btn3" data-content="You need ${dictBadgeScore -numDictTags} more unmatched tags before you earn your next Dictionary Badge" class="title">Dictionary Tags <br> <i class="fa fa-book"></i> ${numDictTags}</a>
	                        </span>
	                      <p><br/>&nbsp;</p>
	                    </div>
	                    <div class="col-md-4 text-center col-xs-4">
	                        <span id="pie_4" class="chartp" data-percent="${(numPioneerTags / pioneerBadgeScore) * 100}">
	                          <span class="percent"></span>
	                     	  <a href="javascript:;" id="btn4" data-content="You need ${pioneerBadgeScore -numPioneerTags} more unmatched tags before you earn your next Pioneer Badge"  class="title">Pioneer Tags <br><i class="fa fa-flag"></i> ${numPioneerTags}</a>
	                        </span>
	                    </div>
	                    <div class="col-md-4 text-center col-xs-4">
	                        <span id="pie_5" class="chartp" data-percent="70">
	                          	<span class="percent"></span>
	                      		<a href="javascript:;" id="btn5" data-content="You need ${pioneerBadgeScore -numPioneerTags} more unmatched tags before you earn your next Campaign Badge" class="title">Campaign Tags <br><i class="fa fa-trophy"></i> 38</a>
	                        </span>
	                      <p><br/>&nbsp;</p>
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
							
							<c:set var="rank" value="${profile.user.rank}"></c:set>
							
							<c:if test="${profile.user.rank != null}">
								
							
								<a href="/?ranks-container" ><img width="100%" src="${appBaseUrl}${profile.user.rank.imageUrlRank}"/></a>
								<p><a style="color:#fff;"href="/?ranks-container" > ${rank.title}</a> </p>
									<div class="progress">
									  <div class="progress-bar progress-bar-active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" 
									  		style="width: ${(profile.user.totalScore / nextRank.scoring) * 100}%">${profile.user.totalScore} points
									  </div>
									</div>
								<p>${nextRank.scoring - profile.user.totalScore} points left to reach next rank.</p>
							
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

							<h4 style="text-align:left;">Obtained badges</h4>
							
							<c:forEach items="${badgeList}" var="badge">
								<div class="col-md-6">
									<p>${badge.title}</p>
									<a href="/?badges-container"><img width="40px;"src="${appBaseUrl}${badge.imageUrl}"/></a>
								</div>
							</c:forEach>
					</div>
				</div>
           	</div>
        </div>
	</div>
	 	<!-- Other stuff !-->
    <div class="row">
    	<div class="col-md-6">
	      	<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
	          	<div class="row">
	           		<div class="col-xs-12 col-sm-12 text-center" style="background-color: #272727;">
						<h2 style="text-align: left;">Most recent games</h2>
						<div class="col-md-12">
							<table style="max-height:250px;" class="table table-condensed table-striped table-clean">
							<c:forEach items="${profile.recentGames}" var="gameScore">
								<tr>
									<td class="indent">
											<a href="/start-game/${gameScore.game.video.id}/normal"><img style="width:70px;" src="${gameScore.game.video.imageUrl}" class="span1 bordered"></a>
									</td>
									<td>
										<span class="small">${gameScore.game.prettyStart}</span>
										
										<c:choose>
										<c:when test="${you}">
										<h3 class="h5 reset compact"><a href="/game/${gameScore.game.id}/recap/${profile.user.id}" class="title">${gameScore.game.video.title}</a></h3>
										</c:when>
										<c:otherwise>
										<h3 class="h5 reset">${gameScore.game.video.title}</h3>
										</c:otherwise>
										</c:choose>
										
										<span class="small"><nf:format number="${gameScore.score}" /> points | <nf:format number="${gameScore.countTags}" /> ${gameScore.countTags == 1 ? 'tag' : 'tags' }</span>
									</td>
								</tr>
							</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
       	</div>
       	<div class="col-md-6">
	      	<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
		       	<div id="pioneer-matches" class="box">
					<header class="rich relative ${you && user.countNewPioneerMatches > 0 ? 'highlight' : ''}">
						<h2 style="text-align: left;">Most recent pioneer matches</h2>
						<img src="/static/img/match-pioneer-l.png" title="" class="pull-out-right" />
					</header>
					<section class="reset">
						<p class="small"><strong>Pioneer matches</strong> are made when you are first to enter a word that gets matched. This can only happen once per word.</p>
						<div class="row box-inner">
							<h3 class="h5 span1 pull-left">match</h3>
							<h3 class="h5 pull-left">in game</h3>
						</div>
						<div class="bordered">
							<table class="table table-condensed table-striped table-clean">
								<tbody>
								<c:forEach items="${profile.pioneerMatches}" var="t" varStatus="status">
								<tr class="${you && status.index < user.countNewPioneerMatches ? 'highlight' : ''}">
									<td class="span1 indent"><a href="javascript:;" class="taglinking" data-item="/tag/${t.tag}"><c:out value="${t.tag}"/></a></td>
									<td>
									<c:choose>
									<c:when test="${you}">
										<a href="/game/${t.game.id}/recap/${profile.user.id}#tag-${t.id}" class="h5"><c:out value="${t.game.video.title}"/></a>
									</c:when>
									<c:otherwise>
										<h4 class="h5 reset"><c:out value="${t.game.video.title}"/></h4>
									</c:otherwise>
									</c:choose>
									</td>
									<td>+150</td>
								</tr>
								</c:forEach>
								</tbody>
							</table>
						</div>
					</section>
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
		<script>
			jQuery(document).ready(function() {		
				chart_revenue();
			});
		</script>
</div>
<script>
	$(function() {
		debugger;
		
		$('.taglinking').click(function() {
			 var url = $(this).attr("data-item");
			 
			 $.ajax({
	    			method: "GET",
	    			url: url
    		 })
    		 .done(function( data ) {
    			if (data) {
    				$('#linking').html(data);
    			}
    		 })
    		 .fail(function(msg) {
    			$('#linking').html('Fail to load data');
    		 });
		 });
	});
</script>
<script>
	var $btn1 = $('#btn1');

	$btn1.data('state', 'hover');

	var enterShow = function () {
	    if ($btn1.data('state') === 'hover') {
	        $btn1.popover('show');
	    }
	};
	var exitHide = function () {
	    if ($btn1.data('state') === 'hover') {
	        $btn1.popover('hide');
	    }
	};

	var clickToggle = function () {
	    if ($btn1.data('state') === 'hover') {
	        $btn1.data('state', 'pinned');
	    } else {
	        $btn1.data('state', 'hover')
	        $btn1.popover('hover');
	    }
	};

	$btn1.popover({trigger: 'manual'})
	    .on('mouseenter', enterShow)
	    .on('mouseleave', exitHide)
	    .on('click', clickToggle);

	var $btn2 = $('#btn2');

	$btn2.data('state', 'hover');

	var enterShow = function () {
	    if ($btn2.data('state') === 'hover') {
	        $btn2.popover('show');
	    }
	};
	var exitHide = function () {
	    if ($btn2.data('state') === 'hover') {
	        $btn2.popover('hide');
	    }
	};

	var clickToggle = function () {
	    if ($btn2.data('state') === 'hover') {
	        $btn2.data('state', 'pinned');
	    } else {
	        $btn2.data('state', 'hover')
	        $btn2.popover('hover');
	    }
	};

	$btn2.popover({trigger: 'manual'})
	    .on('mouseenter', enterShow)
	    .on('mouseleave', exitHide)
	    .on('click', clickToggle);

	var $btn3 = $('#btn3');

	$btn3.data('state', 'hover');

	var enterShow = function () {
	    if ($btn3.data('state') === 'hover') {
	        $btn3.popover('show');
	    }
	};
	var exitHide = function () {
	    if ($btn3.data('state') === 'hover') {
	        $btn3.popover('hide');
	    }
	};

	var clickToggle = function () {
	    if ($btn3.data('state') === 'hover') {
	        $btn3.data('state', 'pinned');
	    } else {
	        $btn3.data('state', 'hover')
	        $btn3.popover('hover');
	    }
	};

	$btn3.popover({trigger: 'manual'})
	    .on('mouseenter', enterShow)
	    .on('mouseleave', exitHide)
	    .on('click', clickToggle);	 

	var $btn4 = $('#btn4');

	$btn4.data('state', 'hover');

	var enterShow = function () {
	    if ($btn4.data('state') === 'hover') {
	        $btn4.popover('show');
	    }
	};
	var exitHide = function () {
	    if ($btn4.data('state') === 'hover') {
	        $btn4.popover('hide');
	    }
	};

	var clickToggle = function () {
	    if ($btn4.data('state') === 'hover') {
	        $btn4.data('state', 'pinned');
	    } else {
	        $btn4.data('state', 'hover')
	        $btn4.popover('hover');
	    }
	};

	$btn4.popover({trigger: 'manual'})
	    .on('mouseenter', enterShow)
	    .on('mouseleave', exitHide)
	    .on('click', clickToggle);	 

	var $btn5 = $('#btn5');

	$btn5.data('state', 'hover');

	var enterShow = function () {
	    if ($btn5.data('state') === 'hover') {
	        $btn5.popover('show');
	    }
	};
	var exitHide = function () {
	    if ($btn5.data('state') === 'hover') {
	        $btn5.popover('hide');
	    }
	};

	var clickToggle = function () {
	    if ($btn5.data('state') === 'hover') {
	        $btn5.data('state', 'pinned');
	    } else {
	        $btn5.data('state', 'hover')
	        $btn5.popover('hover');
	    }
	};

	$btn5.popover({trigger: 'manual'})
	    .on('mouseenter', enterShow)
	    .on('mouseleave', exitHide)
	    .on('click', clickToggle);	 
</script>
