<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tt" %>





<div id="linking">
	<div class="col-md-12">
		<h2 class="spaced"><li class="fa fa-tag"></li> Clips featuring <span >"${tagEntryStats.normalizedTag}"</span></h2>

		<p>Used first by
		<c:choose>
			<c:when test="${tagEntryStats.firstEntry.owner.name == 'Guest'}">
				${tagEntryStats.firstEntry.owner.name}
				in Game: <a href="/start-game/${tagEntryStats.firstEntry.game.video.id}/normal">${tagEntryStats.firstEntry.game.video.title}</a>
				on ${tagEntryStats.firstEntry.prettyCreationDate}</p>
			</c:when>
			<c:otherwise>
				<a href="javascript:;" class="taglinking" data-item="/profiel/${tagEntryStats.firstEntry.owner.id}">${tagEntryStats.firstEntry.owner.name}</a>
				in Game: <a href="/start-game/${tagEntryStats.firstEntry.game.video.id}/normal">${tagEntryStats.firstEntry.game.video.title}</a>
				on ${tagEntryStats.firstEntry.prettyCreationDate}</p>
			</c:otherwise>
		</c:choose>


		<c:forEach items="${tagEntryStats.videoStats}" var="vs">
			<div style="margin-bottom: 20px;" class="col-md-6">
				<a target="_top" href="/start-game/${vs.video.id}/normal"
					title="Play Game: ${channel.video.title}">
					<div class="img">
						<img class="thumb_hidden" src="${vs.video.imageUrl}" alt="Video thumbnail" />
						<div style="top:50%;" class="overlay trigger"><i class="fa fa-gamepad fa-3x"></i></div>
						<div class="overlay triggertag">${vs.video.title}</div>
						<div class="overlay triggersocialdata">
							<i class="fa fa-eye"></i> Games played:	${vs.video.timesPlayed} <br>
							<i class="fa fa-globe"></i> High score: <nf:format number="${vs.video.highscore}" /> <br>
							<i class="fa fa-mouse-pointer"></i> ${vs.video.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${vs.video.twitterShares} 
							<i style="color:#d83733;" class="fa fa-pinterest"></i> ${vs.video.pinterestPins}
						</div> 
					</div>

				</a>
				
				<p class="small">
					Also tagged: <c:forEach items="${vs.topTags}" var="topTag" varStatus="topTagStatus"><a href="javascript:;" data-item="/tag/${topTag}" class="taglinking reset">${topTag}</a><c:if test="${topTagStatus.index < fn:length(vs.topTags) - 1}">, </c:if></c:forEach>
				</p>

			</div>
		</c:forEach>
	</div>
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


