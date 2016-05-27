<%@page import="nl.waisda.domain.UserSummary"%>
<%@page import="nl.waisda.domain.User"%>
<%@page import="nl.waisda.model.GlobalStats"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<style>
	.headline span{
		font-size: 1.5em;
		text-align: left;
	}
	#leaderbord .table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td{
		font-size: 0.9em;
		border: none;
		line-height: 40px;
	}
	table p{
		border: none;
		line-height: 20px;
		color: #666;
	}
	.table > tbody > tr.user{
		background-color: #6FB0DE ;
	}

	.maxwidth{
		margin: 0px;
	}

</style>
<div id="leaderbord" class="row maxwidth">
	<div class="col-md-12 maxwidth">
		<div class="col-md-4 headline maxwidth">
			<span><i class="fa fa-trophy"></i>&nbsp;&nbsp; OVERALL LEADERBORD</span>
			<table class="leaderbord table table-responsive" border="none !important" >
				<tbody class="leader">
					<c:forEach varStatus="loop" var="userScore" items="${globalStats.topScores.topTen}">
						<c:choose>
							<c:when test="${user != null && userScore.user.name == user.name}">
								<c:set var="userScoreClass" value="user"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="userScoreClass" value=""></c:set>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${userScore.user.imageUrl == null}">
								<tr class="${userScoreClass}">
									<td><img style="width: 60px; height: 60px;" class="center-block img-circle img-thumbnail img-responsive" src="${userScore.user.avatarUrl}" /></td>

							</c:when>
							    <c:otherwise>
								<tr class="${userScoreClass}">
									<td><img style="width: 60px; height: 60px;" class="center-block img-circle img-thumbnail img-responsive" src="/user/image/${userScore.user.id}" /></td>

								</c:otherwise>

						</c:choose>
									<td><span><a style="color:#fff;" class="profilelinking" data-item="/profiel/${userScore.user.id}" href="javascript:;">${loop.index + 1}. ${userScore.user.name} </a></span><br> <p>Highscore: ${userScore.score}</p> </td>
								</tr>
					</c:forEach>
				
				</tbody>
			</table>
		</div>
		<div class="col-md-4 headline maxwidth">
			<span><i class="fa fa-shield"></i>&nbsp;&nbsp; HIGHEST RANKING</span>
				
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
			<div class="col-md-4 headline maxwidth">
			<span><i class="fa fa-clock-o"></i>&nbsp;&nbsp; MOST ACTIVE THIS WEEK </span>
			<table class="leaderbord table .table-responsive" border="none !important" >
				<tbody class="leader">
					<c:forEach varStatus="loop" var="userTag" items="${globalStats.mostTagUsers}">




						<c:choose>
							<c:when test="${user != null && userTag.name == user.name}">
								<c:set var="userTagClass" value="user"></c:set>	
							</c:when>
							<c:otherwise>
								<c:set var="userTagClass" value=""></c:set>	
							</c:otherwise>
						</c:choose>
							<c:choose>
								<c:when test="${userTag.imageUrl == null}">
									<tr class="${userTagClass}">
										<td><img style="width: 60px; height: 60px;" class="center-block img-circle img-thumbnail img-responsive" src="${userTag.avatarUrl}" /></td>

	          						
								</c:when>
							    <c:otherwise>
									<tr class="${userTagClass}">
										<td><img style="width: 60px; height: 60px;" class="center-block img-circle img-thumbnail img-responsive" src="/user/image/${userTag.id}" /></td>
							    </c:otherwise>
							</c:choose>
										<td><span><a style="color:#fff;" class="profilelinking" data-item="/profiel/${userTag.id}" href="javascript:;">${loop.index + 1}. ${userTag.name} </a></span><br> <p>${userTag.totalTags} tags this week</p> </td>
									</tr>							
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div style="margin-left: 15px; margin-top: 10px; margin-right: 15px;" id="profileid"></div>

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
    				$('#leaderbord').html(data);
    			}
    		 })
    		 .fail(function(msg) {
    			$('#leaderbord').html('Fail to load data');
    		 });
		 });
	});
</script>
