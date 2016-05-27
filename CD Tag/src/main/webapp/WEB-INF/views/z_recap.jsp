<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>

<script src="${appBaseUrl}/static/script/lib/jquery-1.11.3.min.js"></script>
	    <!--<link rel="stylesheet" type="text/css" media="screen" href="${appBaseUrl}/static/script/notification/css/messenger.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="${appBaseUrl}/static/script/notification/css/messenger-theme-future.css">
	    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	    <script type="text/javascript" src="${appBaseUrl}/static/script/notification/js/messenger.js"></script>
	    <script type="text/javascript" src="${appBaseUrl}/static/script/notification/js/messenger-theme-flat.js"></script>!-->
		<script type="text/javascript" src="${appBaseUrl}/static/script/global.js"></script>

<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="body">
 		<style>
	 		.table-striped > tbody > tr:nth-child(2n+1) {
			    background-color: #323131;
			}
			.well {
			    border: none;
			    background-color: #272727;color: #d5d3d4; 
    		}

    		.tag-list .tag .points, .tag-list .tag .icon {
			    float: right;
			    margin-left: 5px;
			}

			.table > thead > tr > th, .table > tbody > tr > th, .table > tfoot > tr > th, .table > thead > tr > td, .table > tbody > tr > td, .table > tfoot > tr > td {

			    border-top: 1px solid #4C4646;
			}

			.box header .board {
			    background-color: #000;
			    color: #FFF;
			    padding: 1px 10px;
			    margin: 0px;
			}

			.tag-list .tag {
				border:none;
			    padding: 5px 10px;
			}

			.scroll-box {

			    height: 300px;

			} 


 		</style>

 		<!-- End statistic-container -->

    <div class="container-fluid" id=" content-wrapper">
    	<!-- stop/next game or home button !-->
    	<span id="timer-remaining" class="big pull-left" style="margin-top: 15px; text-transform:none;">The next game will start in <span style="color:red"><b id="show-time">30</b></span> seconds <br><br>
    		<button style="z-index:100001"type="button" class="btn btn-danger" onclick="stopCounter();">Stop Counter</button>
    		<c:forEach var="channel" begin="1" end="1" items="${channels}">
    			<a href="/start-game/${channel.video.id}/normal" style="z-index:100001" id="changePage" class="changePage btn btn-success">Next Game</a>
			</c:forEach>
			<a href="/"><button style="z-index:100001"type="button" class="btn btn-info">Go to homepage</button></a>
    	</span> 


		<div style="margin-top: 120px;" >
			<div class="col-md-4">
				<img style="width:100%;" src="${recap.game.video.imageUrl}"  alt="TAGS ENTERED"/>
				<div class="well panel panel-default" style="">
					<h2 style="text-align: left;">Played Game</h2>
					<p style="font-size: 24px; font-weight:500; text-align:center;">"<i><c:out value="${recap.game.video.title}" /></i>"</p>				
					<p style="text-align:center;" id="timer-remaining" class="small">Game played on ${recap.game.prettyStart}</p>	
					&nbsp;

					<div class="box">
						<header class="rich extended">
							<h1 id="playerSessionScore" class="pull-left board span2"><nf:format number="${recap.ownerScore}"/></h1>
							<h2 id="playerPosition" class="pull-right reset">
								<small class="h4">Rank</small>
								<span id="playerPositionMine">${recap.ownerPosition + 1}</span> / <span id="playerPositionTotal" class="h4">${fn:length(recap.participants)}</span>
							</h2>
						</header>
					</div>
					<h3 class="h4 sub-header">Your tags:</h3>		
			
					<div id="tagList" class="tag-list scroll-box">
						<c:forEach items="${recap.tagEntries}" var="tag">
							<div class="tag" id="tagEntry3">
								<span class="points">+<nf:format number="${tag.score}" /></span>
								<c:if test="${tag.matchingTagEntry != null && tag.pioneer}">
									<img src="/static/img/match-pioneer.png" class="icon" />
								</c:if>
								<c:if test="${tag.matchingTagEntry != null && !tag.pioneer}">
									<img src="/static/img/match-social.png" class="icon" />
								</c:if>
								<c:if test="${tag.dictionary != null && !tag.specialMatch}">
									<img src="/static/img/match-dictionary.png" class="icon" />
								</c:if>
								<c:if test="${tag.dictionary == 'fictional-location'}">
									<img src="/static/img/fictional-place.png" class="icon" />
								</c:if>
								<c:if test="${tag.dictionary == 'real-location'}">
									<img src="/static/img/real-place.png" class="icon" />
								</c:if>
								<c:if test="${tag.dictionary == 'events'}">
									<img src="/static/img/event.png" class="icon" />
								</c:if>
								<c:if test="${tag.dictionary == 'fictional-person'}">
									<img src="/static/img/fictional-person.png" class="icon" />
								</c:if>
								<c:if test="${tag.dictionary == 'real-person'}">
									<img src="/static/img/real-person.png" class="icon" />
								</c:if>
								<c:if test="${tag.dictionary != null && tag.specialMatch}">
									<img src="/static/img/match-dictionary-${tag.dictionary}.png" class="icon" />
								</c:if>
								<span ><c:out value="${tag.tag}"/></span>
								<span class="matching small">
									<c:if test="${tag.matchingTagEntry != null}">
										match with <strong><c:out value="${tag.matchingTagEntry.tag}"/></strong>

										<c:choose>
										<c:when test="${tag.matchingTagEntry.owner.id == tag.owner.id}">from you</c:when>
										<c:otherwise>from <em><c:out value="${tag.matchingTagEntry.owner.name}"/></em></c:otherwise>
										</c:choose>

										<c:if test="${tag.pioneer}">. You introduced this word</c:if>
									</c:if>
								</span>
							</div>
						</c:forEach>
					</div>	
				</div>
				<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
					<div id="rankings" class="box">
						<header class="rich">
							<h2 style="text-align: left;">Scoreboard</h2>
						</header>
						<section class="reset">
							<ol class="unstyled reset">
							
							<c:forEach items="${recap.participants}" var="p">
								<li class="${p.user.id == recap.owner.id ? 'chart-entry extended highlight' : 'chart-entry extended'}">
								<tt:profileLink anonymous="${p.user.anonymous}" id="${p.user.id}">
										<span class="index pull-left">${p.position + 1}</span>
										<img src="${p.user.smallAvatarUrl}" />
										${fn:escapeXml(p.user.name)}
										<span class="score h5"><nf:format number="${p.score}" /></span><br />
										<small><nf:format number="${p.countTags}" /> ${p.countTags == 1 ? 'tag' : 'tags'} and ${p.countMatches} ${p.countMatches == 1 ? 'match' : 'matches' }</small>
								</tt:profileLink>
								</li>
							</c:forEach>
							</ol>
						</section>
					</div>	
				</div>

			</div>
			<div class="col-md-6">
				<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
					<h2 style="text-align: left;">Recap</h2>
					<!--<img style="width:115%; margin-left:-7%; margin-top:-35px; margin-bottom:10px;" src="${appBaseUrl}/static/img/recap/placeholderrecap.png" />!-->

					<div class="">
							<table class="table table-striped table-condensed-ext table-clean">
								<tr>
									<th colspan="2">Your contribution to the game</th>
									<th class="text-right">points</th>
								</tr>
								<tr>
									<td><li class="fa fa-tag" alt="match with other player" /></li></td>
									<td><nf:format number="${recap.summary.countEmptyTags}" />${recap.summary.countEmptyTags == 1 ? 'tag' : 'tags' } unmatched <span style="color:#000;"> <a style="cursor: pointer; " id="btn1"  data-toggle="popover" title="Unmatched tags" data-content="If another player matches this word later on this you will earn 5 points" data-original-title="Random Tagging"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>


									<td class="text-right"><nf:format number="${recap.summary.countEmptyTags * 5}" /></td>
								</tr>
								<tr>
									<td><img src="/static/img/match-dictionary.png" alt="match with other player" /></td>
									<td><strong><nf:format number="${recap.summary.countDictionaryMatches}"/></strong> ${recap.summary.countDictionaryMatches == 1 ? 'dictionary match' : 'dictionary matches' } 

									<span style="color:#000;"> <a style="cursor: pointer; " id="btn3"  data-toggle="popover" title="Dictionary matches" data-content="A dictionary match will earn your more points. Check the different types of vocabularies below to see the scoring!" data-original-title="Random Tagging"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span></td>

									<td class="text-right"><nf:format number="${recap.summary.countDictionaryMatches * 50}" /></td>

								</tr>
								<tr>
									<td><img src="/static/img/event.png" alt="event in dictionary" /></td>
									<td> &nbsp; &nbsp;<li style="font-size: 8px;" class="fa fa-circle">&nbsp; &nbsp;</li> <strong> <nf:format number="${recap.summary.countEventMatches}"/></strong> ${recap.summary.countDictionaryMatches == 1 ? 'dictionary match' : 'event matches' } 										
										<span style="color:#000;"> <a style="cursor: pointer; " id="btn4"  data-toggle="popover" title="Event dictionary Tags" data-content="An event-dictionary match means you used tags what happen more over in Game of thrones" data-original-title="Event Dictionary Match"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span></td>
									<c:choose>
										<c:when test="${gameType == 'event'}">

										</c:when>
										<c:otherwise>

										</c:otherwise>
									</c:choose>
									<c:if test="${gameType == 'rampage'}">
										<td class="text-right"><nf:format number="${recap.summary.countDictionaryMatches * 5}" /></td>
									</c:if>

									<td class="text-right"><nf:format number="${recap.summary.countEventMatches * 5}" /></td>
								</tr>
								<tr>
									<td><img src="/static/img/fictional-place.png" alt="fictional location in dictionary" /></td>
									<td> &nbsp; &nbsp;<li style="font-size: 8px;" class="fa fa-circle">&nbsp; &nbsp;</li> <strong><nf:format number="${recap.summary.countFicLocMatches}"/></strong> ${recap.summary.countDictionaryMatches == 1 ? 'dictionary match' : 'fictional location matches' } 									
										<span style="color:#000;"> <a style="cursor: pointer; " id="btn5"  data-toggle="popover" title="Fictional location dictionary Tags" data-content="A fictional location-dictionary match means you used tags of locations in Game of thrones" data-original-title="Fctional locations Dictionary Match"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span></td>
									<td class="text-right"><nf:format number="${recap.summary.countFicLocMatches * 5}" /></td>
								</tr>
								<tr>
									<td><img src="/static/img/real-place.png" alt="fictional location in dictionary" /></td>
									<td> &nbsp; &nbsp;<li style="font-size: 8px;" class="fa fa-circle">&nbsp; &nbsp;</li> <strong><nf:format number="${recap.summary.countRealLocMatches}"/></strong> ${recap.summary.countDictionaryMatches == 1 ? 'dictionary match' : 'real location matches' } 

										<span style="color:#000;"> <a style="cursor: pointer; " id="btn5"  data-toggle="popover" title="Real location dictionary Tags" data-content="A Real location-dictionary match means you used tags what could be real loations used in Game of thrones" data-original-title="Real locations Dictionary Match"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span></td>
									<td class="text-right"><nf:format number="${recap.summary.countRealLocMatches * 5}" /></td>
								</tr>
								<tr>
									<td><img src="/static/img/real-person.png" alt="fictional location in dictionary" /></td>
									<td> &nbsp; &nbsp;<li style="font-size: 8px;" class="fa fa-circle">&nbsp; &nbsp;</li> <strong><nf:format number="${recap.summary.countRealPerMatches}"/></strong> ${recap.summary.countDictionaryMatches == 1 ? 'dictionary match' : 'real person matches' } 
										<span style="color:#000;"> <a style="cursor: pointer; " id="btn6"  data-toggle="popover" title="Real person dictionary Tags" data-content="A real person dictionary match means you used tags of real names of characters within Game of thrones" data-original-title="Real person dictionary Match" data-original-title="Event Dictionary Match"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span></td>
									<td class="text-right"><nf:format number="${recap.summary.countRealPerMatches * 5}" /></td>
								</tr>
								<tr>
									<td><img src="/static/img/fictional-person.png" alt="fictional location in dictionary" /></td>
									<td> &nbsp; &nbsp;<li style="font-size: 8px;" class="fa fa-circle">&nbsp; &nbsp;</li> <strong><nf:format number="${recap.summary.countFicPerMatches}"/></strong> ${recap.summary.countDictionaryMatches == 1 ? 'dictionary match' : 'fictional person matches' } 
										<span style="color:#000;"> <a style="cursor: pointer; " id="btn7"  data-toggle="popover" title="Fictional person dictionary tags" data-content="A fictional person dictionary match means you described character names used in Game of thrones" data-original-title="Fictional person dictionary Match"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span></td>
									<td class="text-right"><nf:format number="${recap.summary.countFicPerMatches* 5}" /></td>
								</tr>
								<tr>
									<td><img src="/static/img/match-social.png" alt="match with other player" /></td>
									<td><strong><nf:format number="${recap.summary.countMatchingTags}"/></strong> ${recap.summary.countMatchingTags == 1 ? 'match' : 'matches' } with other players 
									<span style="color:#000;"> <a style="cursor: pointer; " id="btn8"  data-toggle="popover" title="Matched tags" data-content="Entering the same tag as one of your co-players will earn you 50 points" data-original-title="Matching Tags"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span></td>
									<td class="text-right"><nf:format number="${recap.summary.countMatchingTags * 5}" /></td>
								</tr>
								<tr>
									<td><img src="/static/img/match-pioneer.png" alt="Pioneer match" /></td>
									<td><strong><nf:format number="${recap.summary.countPioneerTags}"/></strong> ${recap.summary.countPioneerTags == 1 ? 'pioneer match' : 'pioneer matches' } 
										<span style="color:#000;"> <a style="cursor: pointer; " id="btn9"  data-toggle="popover" title="Matched tags" data-content="Entering the same tag as one of your co-players will earn you 150 points" data-original-title="Pioneer Tags"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span></td>
									<td class="text-right"><nf:format number="${recap.summary.countPioneerTags * 100}" /></td>
								</tr>
								<tr>
									<td></td>
									<td><strong>Total score</strong></td>
									<td class="text-right"><nf:format number="${recap.ownerScore}" /></td>
								</tr>
							</table>
							<p class="spaced-min">On the left, below 'Your tags', you can find a more detailed description of each match.</p>
							
					</div>
				</div>


	        <!-- Ranks and Badges !-->
		      	<div class="well panel panel-default" style="background-color: #751a1b;color: #d5d3d4; ">
		      		<!--<img style="width:109%; margin-left:-4%; margin-top:-35px; margin-bottom:20px;" src="${appBaseUrl}/static/img/recap/placeholderprofile.png"  alt="TAGS ENTERED"/>!-->
		      		<c:if test="${user == null || user.anonymous}">
			                        <h3>Want to keep this score?</h3>
			                        <p>If you <a id="register" href="javascript:;"href="/"><strong>register</strong></a> or <a id="log-in" href="javascript:;"><strong>log in</strong></a>, the points
			                        you earned will be added to your account. Try to achieve the highest ranking!</p>
			        </c:if>
			        <c:if test="${user != null}">
						<h2 style="text-align: left;">Choose your next adventure</h2>
						<c:forEach var="channel" begin="1" end="4" items="${channels}">
							<div class="col-md-3" style="background-color: #751a1b;">
								<a href="/start-game/${channel.video.id}/normal" style="border:none;" data-item="/start-game/${channel.video.id}/normal" title="${channel.video.title}" >
								<div class="img">
									<img style="border: 1px solid #fff;" src="${channel.video.imageThumbUrl}" />
									<div class="overlay trigger" style="top:50%">
										<i class="fa fa-gamepad fa-2x"></i>
									</div>
								</div>
								</a>
								<h5 style="text-align:center;">${channel.video.title}</h5>
							</div>
						</c:forEach>
					</c:if>
					<span>&nbsp; </span>
	           	</div>
			</div>

			<div class="col-md-2">
		      	<div class="well panel panel-default" style="background-color: #751a1b;color: #d5d3d4; ">				
			        
		          	<div class="row">
                   		<div class="col-xs-12 col-sm-12 text-center" style="background-color: #751a1b;">
							<h2 style="text-align: left;">Ranks</h2>
							<h4 style="text-align:left;">Current Rank </h4>
							<c:set var="rank" value="${user.rank}"></c:set>
							<c:if test="${rank == null}">
								<span style="font-size:12px;">You need to be registred to see your first rank!</span>
							</c:if>
							<c:if test="${rank != null}">		
								<img width="100%" src="${appBaseUrl}${user.rank.imageUrlRank}"/>
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
	         	<div class="well panel panel-default" style="background-color: #751a1b;color: #d5d3d4; ">
					<h2 style="text-align: left;">Badges</h2>

						<h4 style="text-align:left;">Obtained badges</h4>
						<c:if test="${empty badgeList}">
								<div class="col-md-12">
									<span style="font-size:12px;">No badges obtained, create an account and start earning your first badge!</span>
								</div>
						</c:if>
						<c:forEach items="${badgeList}" var="badge">
							<div class="col-md-12">
								<p>${badge.title}</p>
								<img width="100%;"src="${appBaseUrl}${badge.imageUrl}"/>
							</div>
						</c:forEach>

					<p> &nbsp; </p>
				</div>

			</div>
		</div>
	</div>



<script type="text/javascript">
			    function randomIntFromInterval(min,max)
		{
		    return Math.floor(Math.random()*(max-min+1)+min);
		}
	clearInterval(countDown);
    var stopCount = true;

	var countDown = function(){
    	var timeCounter = $("b[id=show-time]").html();
		var updateTime = eval(timeCounter)- eval(1);
		$("b[id=show-time]").html(updateTime);
 		if(updateTime == 0 && stopCount){
 			var number= randomIntFromInterval(1,57);
			var url = "/start-game/"+number+"/normal";
 			clearInterval(countDown);
    		window.location = (url);
    		return;
   		} else if(!stopCount){
   			$("b[id=show-time]").html(timeCounter);
	    	clearInterval(countDown);
   		}

   	};

    $("document").ready(function(){
	    setInterval(countDown ,1000);

    });
	function stopCounter(){

	    stopCount = false;
	}

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
		        $btn.popover('hover');
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
		        $btn.popover('hover');
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
		        $btn.popover('hover');
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
		        $btn.popover('hover');
		    }
		};

		$btn5.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);

 		var $btn6 = $('#btn6');
		$btn6.data('state', 'hover');

		var enterShow = function () {
		    if ($btn6.data('state') === 'hover') {
		        $btn6.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn6.data('state') === 'hover') {
		        $btn6.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn6.data('state') === 'hover') {
		        $btn6.data('state', 'pinned');
		    } else {
		        $btn6.data('state', 'hover')
		        $btn6.popover('hover');
		    }
		};

		$btn6.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);

		 		var $btn7 = $('#btn7');
		$btn7.data('state', 'hover');

		var enterShow = function () {
		    if ($btn7.data('state') === 'hover') {
		        $btn7.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn7.data('state') === 'hover') {
		        $btn7.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn7.data('state') === 'hover') {
		        $btn7.data('state', 'pinned');
		    } else {
		        $btn7.data('state', 'hover')
		        $btn7.popover('hover');
		    }
		};

		$btn7.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);
		    
		 		var $btn8 = $('#btn8');
		$btn8.data('state', 'hover');

		var enterShow = function () {
		    if ($btn8.data('state') === 'hover') {
		        $btn8.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn8.data('state') === 'hover') {
		        $btn8.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn8.data('state') === 'hover') {
		        $btn8.data('state', 'pinned');
		    } else {
		        $btn8.data('state', 'hover')
		        $btn8.popover('hover');
		    }
		};

		$btn8.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);

 		var $btn9 = $('#btn9');
		$btn9.data('state', 'hover');

		var enterShow = function () {
		    if ($btn9.data('state') === 'hover') {
		        $btn9.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn9.data('state') === 'hover') {
		        $btn9.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn9.data('state') === 'hover') {
		        $btn9.data('state', 'pinned');
		    } else {
		        $btn9.data('state', 'hover')
		        $btn9.popover('hover');
		    }
		};

		$btn9.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);
 		</script>
 
    </tiles:putAttribute>
</tiles:insertDefinition>