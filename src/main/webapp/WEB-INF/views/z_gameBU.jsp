<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib prefix="tt" tagdir="/WEB-INF/tags"%> --%>




<!-- END: Page Content -->

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


    <!-- Hubspot Notification !-->
	    <link rel="stylesheet" type="text/css" media="screen" href="${appBaseUrl}/static/script/notification/css/messenger.css">
	    <link rel="stylesheet" type="text/css" media="screen" href="${appBaseUrl}/static/script/notification/css/messenger-theme-future.css">
	    <!--<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>!-->
	    <script type="text/javascript" src="${appBaseUrl}/static/script/notification/js/messenger.js"></script>
	    <script type="text/javascript" src="${appBaseUrl}/static/script/notification/js/messenger-theme-flat.js"></script>
	<!-- JW player and game !-->
		<script src="${appBaseUrl}/static/script/ugslplayer.js"></script>
		<script src="${appBaseUrl}/static/script/utils.js"></script>
		<script src="${appBaseUrl}/static/script/videoplayer.js"></script>
		<script src="${appBaseUrl}/static/script/taggingHistory.js"></script>
		<c:choose>
			<c:when test="${gameType == 'rampage'}">
				<script src="${appBaseUrl}/static/script/game-rampage.js"></script>
			</c:when>
			<c:otherwise>
				<script src="${appBaseUrl}/static/script/game.js"></script>
			</c:otherwise>
		</c:choose>

		<script src="${appBaseUrl}/static/script/ism-2.0.1-min.js"></script>
 		<style>
			#video {
				top: 0px;
				right: 0px;
			}

			.jwplayer{
				position:absolute !important;
			}
		</style>

 <div id="game-container">
	<div id="game-image">
		<img width="15%" src="${appBaseUrl}/static/img/CDT${gameType}.png" />
	</div>
	<div style="margin-left:-20px; margin-right:-20px;" id="videobox">
		<div id="gameCanvas">
			<section class="reset">
				<div id="vid-overlay-screen">
					<div id="explanation">
						<div id="game-slider-container" class="ism-slider">
							<ol>
					      		<li>
					      			<img src="${game.video.imageUrl}">
					      			<div class="maskslide"></div>
					      			<div style="margin-left: 33%; margin-top: 20px; position:absolute;"> 
					      				<h1><i class="fa fa-shield"></i> You are going to play <i>"<c:out value="${game.video.title}" />"</i></h1>
									<div id="explanation" class="box clean span12">
														<div id="timer-intro" class="timer-intro"><small>The game starts in</small><strong>00:15</strong></div>
				
					      				</div>
					      			</div>
				      				<div style="top:30%; position: absolute; max-width:400px;" class="ism-caption2">	
			        					<h3><i>We already gathered <span style="color:#4ec4f6"><strong ><nf:format number="${globalStats.totalTags}" /></strong></span> tags. <br><br> Play, contribute and earn your first badge!</i></h3>
							        </div>
					      		</li>
					      	</ol>
						</div>
						<img width="100%" bottom="70px;"src="${appBaseUrl}/static/img/Instructions.png" />
					</div>
				</div>
			</section>



			<!-- Videocanvas !-->
			<div id="videoFrame" class="outside">
				<div id="video" class="video"></div>
			</div>

			<!-- Inputbar !-->
			<footer class="outside">
				<input style="z-index: 15; width: 200px; position: absolute; bottom: 40px; left: 45%; color:#000;" type="text" maxlength="100" class="input-mega-xxl" id="inputField" placeholder="Enter tag here" autocomplete='off'/>
				<div style="position:absolute; left: 25px; z-index: 2000; bottom: 70px;">
					<p style="font-size: 10px; color: grey;"><i>&copy; This footage is used for Scientific purposes only. <br> You are not permitted to copy, broadcast, download, <br>store (in any medium), transmit, show or play in public,<br>  adapt or change in any way the content of these video footage <br> for any other purpose whatsoever without the prior <br> written permission of the legal owner. </i></p>
				</div>
				<img style=" position: absolute; z-index:10; bottom:0px; left:0px;height:90px;" width="100%" bottom="70px;"src="${appBaseUrl}/static/img/game/in-game.png" />
			</footer>


			<!-- Timerremaining !-->
			<header style="z-index:3000; position: fixed; top: 60px; right: 2%; color:#fff;"  class="clear extended">
				<span id="timer-remaining" class="pull-right box clean span12"></span>	
				<c:if test="${gameType == 'rampage'}">
					<div style="z-index:3000; position: fixed; top: 110px; right: 2%; color:#fff;"  id="progress-container" class="hide">
						<div style="text-align: center; width: 150px;" id="progressbar">
							<div class="progress-label"></div>
						</div>
					</div>
				</c:if>
			</header>

			<!-- STOP BUTTON -->
			<div id="stopButton" >
				<div style="z-index:3000; position: fixed; bottom: 10px; left: 2%; color:#fff;" class="stop_button">
					<a style="color:#fff" href="javascript:;" data-item="/game/${game.id}/recap/${user.id}" id="stopBtn" class="gameForward btn btn-danger" role="button"><span>&nbsp; stop game &nbsp;</span></a>

				</div>
			</div>

			<div style="z-index:3000; position: fixed; bottom: 10px; right: 2%; color:#fff;" id="rightColumn" class="box span4 col-game">
					<div style="overflow-y: scroll; position: absolute; max-height:300px; width: 200px; bottom: 100px; right: 5px;">
						<h3 class="h4 sub-header">Your tags:</h3>		
						<div id="tagList" class="tag-list scroll-box"></div>
					</div>

				<h2 id="playerPosition" class="pull-right reset">
					<small class="h4">Rank</small>
					<span id="playerPositionMine">-</span> / <span id="playerPositionTotal" class="h4">-</span>
				</h2>
			</div>

		</div>
		<div style="z-index: 3000; position: absolute; display:inline; bottom: 10px; right: 200px;">
				<small style="position:fixed; dispaly:inline; bottom:25px; right: 240px;">Score:  &nbsp;</small><h1 style="display:inline;"id="playerSessionScore" class="board span2"> 0</h1>
		</div>
	</div>
</div>


<!-- SCRIPT 	-->
<script type="text/javascript">
	jQuery(function() {

		<c:choose>

			<c:when test="${game.video.playerType == 'JW'}">
					var getWidth = $("#gameCanvas").width();
					var getHeight = $("#gameCanvas").height();
				var video = {
						playerType : 'JW',
						sourceUrl : '${game.video.sourceUrl}',
						imageUrl : '${game.video.imageUrl}',
						widthSize: 1200,

					};
			</c:when>
			<c:otherwise>
			var video = null;
			</c:otherwise>
		</c:choose>
		// var gameType = "normal";

		debugger;

		window.game = new Game(${game.id}, video, ${game.elapsed}, '${gameType}');
	});
</script> 	






<script>
	$(function() {
		debugger;
		
		$('.gameForward').click(function() {
		        var this_item = $(this).attr("data-item");
		        var isMatch = this_item.indexOf("/start-game/") == 0;
		        var taglistN = $( "#tagList > div" ).length;
		        if(taglistN == 0){
					window.top.location.reload("/");
		        }
		        $("content-wrapper").empty();
		        if(isMatch){
		        	$("#message").attr("style", "display: none");
		        	$(".ism-slider").attr('class', 'ism-slider-temp');
		        	$("#top-slider-container").attr("style", "display: none");
		        	$("#message").attr("style", "display: none");


		        } else if ( $( ".ism-slider-temp" )[0] ) { /*$( "#top-slider-temp" ).length */
		        	$(".ism-slider-temp").attr('class', 'ism-slider');
		        	$("#top-slider-container").removeAttr("style", "display: none;");
		        	$("#message").removeAttr("style", "display: none;");
					window.game.endGameNow();
					$("#games-queue").attr('display','block');
					$("ol li:nth-child(4)").remove();
					$(".content-wrapper").hide().fadeIn('fast');
					$("#sidebar-wrapper").attr("style", "display: block");
 				};

		        $.ajax({
	    			method: "GET",
	    			url: this_item
	    		})
    		 .done(function( data ) {
    			if (data) {
    				$('#channels-slider-container').html(data);
    			}
    		 })
    		 .fail(function(msg) {
    			$('#channels-slider-container').html('Fail to load data');
    		 });
		 });
	});
</script>