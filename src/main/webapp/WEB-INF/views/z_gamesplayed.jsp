<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tt" %>
<%@page import="java.util.Map"%>


<c:set var="you" value="${user != null && user.id == profile.user.id}"/>
<style>
.games-queue {
	z-index: 55000;
}
.game-queue table h4 {
    line-height: 24px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 160px;
}
.game-queue table * {
    cursor: pointer;
   	color: #000;
}


img.bordered {

    border: 1px solid #999;

}
.game-queue table * {

    cursor: pointer;

}
table .span1 {

    float: none;
    width: 80px;
    margin-left: 0px;

}
.span1 {
    width: 100px;
}

table .span {
    float: none;
    width: 80px;
    margin-left: 0px;

}
.span {
    width: 100px;
}

[class*="span"] {

    float: left;
    margin-left: 20px;

}
.span1 {

    width: 60px;

}
		 .table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
		   background-color: #d5d3d4;
		   color: #000;
		}

img {

    max-width: 100%;
    vertical-align: middle;
    border: 0px none;

}
a {

    color: #08C;

}
.table th, .table td {

    line-height: 18px;
    text-align: left;

}

		.box {
			clear:both;
			margin-top:0px;
			margin-bottom: 25px;
			padding: 0px;
		}

</style>


 		




<div id="content-wrapper"> 	
	<div class="col-md-4">
	  	<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
	      	<div class="row">
	       		<div class="col-xs-12 col-sm-12 text-center" style="background-color: #272727;">
					<h2 style="text-align: left;">Last Played Games</h2>
					<div class="col-md-12">
						<table style="max-height:250px;" class="table table-condensed table-striped table-clean">
						<c:forEach items="${globalStats.recentGamesTotal}" var="gameScore">
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
	<div class="col-md-4">	
	   	<div class="well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
	          	<div class="row">
	           		<div class="col-xs-12 col-sm-12 text-center" style="background-color: #272727;">
						<h2 style="text-align: left;">Most Popular Games</h2>
						<div class="col-md-12">
							<table style="max-height:250px;" class="table table-condensed table-striped table-clean">
							<c:forEach items="${globalStats.mostPopularGamesTotal}" var="gameScore">
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
	</div>
</div>


 
 		

 

 
