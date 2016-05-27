<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tt"%>

<tt:html>
<tt:head title="Resultaten">
<link href="/static/styles/css/styleCDT.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	  <!--[if lt IE 9]>
	  <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	  <![endif]-->

</tt:head>
<tt:body pageName="recap">
<!-- BEGIN: Sticky Header -->
<div id="header_container">
    <div id="header">
       <a href="http://crowddriven.nl">
       	<img style="margin: 10px 0px 0px 20px; " width="250px" class="float-lt" src="/static/img/CDT.png" alt="CrowDDriven Tag" />		
       </a>


       <nav id="primary_nav_wrap">
		<ul>
		  <li><a href="#">MENU &dtrif; </a>
		    <ul>
		      	<li><a href="/index.html">Homepage</a></li>
		      	<li><a href="/leaderbord.html">Leaderbords</a></li>
		      	<li><a href="/campaign.html">Campaigns</a></li>
		      	<li><a href="/about.html">About us!</a></li>
		    </ul>
		  </li>
		</ul>
    </div>

        <div class="user-info">
			<!-- If logged in !-->
			<c:if test="${user != null && !user.anonymous}">
				
				<!-- INCENTIVE TOTAL TAGS OF USER !-->
				<ul>
			  		<div id="topbar">
						<li> 
							<figure>
								<div id="user-button" class="button" title="Registered users"></div> 
									<figcaption>
		       							<form action="/uitloggen">
											<button style="float: left; display:block;" type="submit">Log out</button>
										</form>		
	   								</figcaption>
	   						</figure>
	   					</li>

						<li> <a><div id="help-button" class="button" title="Help"></div></a></li>
					</div>
				</ul>
				    <img height="10px" width="100%" src="/static/img/menucolor.png" alt="colormenu" />	
			</c:if>													
		</div>

		<!-- If not logged in or anonymous user !-->
		<c:if test="${user == null || user.anonymous}">	


	  		<ul>
	  			<div id="topbar">	
					<li> 
						<figure>
							<div id="user-button" class="button" title="Registered users"></div> 
							<figcaption>
	       						<div style="display: block;" id="user-menu" class="top-menu">
	       							<table>
	       								<th>
		       								<form action="/inloggen">
											   <button style="float: left; display:block;" type="submit">Login</button>
											</form>						
	       								</th>

	       								<th>
											<form action="/registreren">
											   <button style="margin-left: 30px; float: right; display:block;"type="submit">Register</button>
											</form>
										</th>
									</table>
								</figcaption>

	   					</figure>
	   					
		   			</li>

					<li> <a><div id="help-button" class="button" title="Help"></div></a></li>
				</ul>
				    <img height="10px" width="100%" src="/static/img/menucolor.png" alt="colormenu" />	
			</div>
		</c:if>
	</div>	


</div>
<!-- END: Sticky Header -->

<!-- BEGIN: Page Content -->
<div id="container">
    <div id="content">

		<!-- START: STATISTIC DIV -->
		 <<div id="containerStats">
			<table>
				<tr>
					<td style="border:none;"></td>
					<td style="border:none; font-size: 1.3em" colspan="3"><h2>OVERALL STATISTICS</h2></td>
				</tr>
			  <tr>
			    <td id="title"><strong>PLAYED GAMES</strong></td>
			    <td id="title">ENTERED TAGS</td>
			    <td id="title">HIGHEST RANK</td>
			    <td id="title">BEST USER</td>	
			    <td id="title" style="border-right: 0;">TOP SCORE</td>
			  </tr>
			  <tr>
				<td><div class="spincrement"><nf:format number="${globalStats.totalMatches}" /></div></td>
				<td><div class="spincrement"><nf:format number="${globalStats.totalTags}" /></div></td>
				<td id="rank"><img src="/static/img/unsullied.png"  height="40%" width="40%"></img></td>
				<td id="uname">TagKing09</td>
			    <td style="border-right: 0;"><div class="spincrement">3840</div></td>
			  </tr>
			</table>
		</div>
		<!-- END: STATISTIC DIV -->	
	<h3 style="color:#fff"><c:out value="${game.video.title}" /></h3>
		<center>
			 <img width="40%" src="/static/img/recapholder.png" alt="" />
			 <h1 style="font-family:arial;color: #fff"> RECAP </h1>
			 <table style="font-family:arial;color: #fff"style="line-height:1.3em;">
					<tr>
						<th colspan="2">Your contribution to the game</th>
						<th class="text-right">points</th>
					</tr>
					<tr>
						<td><img src="/static/img/playgame_icon.png" alt="match with other player" /></td>
						<td><strong><nf:format number="${recap.summary.countEmptyTags}" /></strong> ${recap.summary.countEmptyTags == 1 ? 'tag' : 'tags' } unmatched <span class="help" title="If another player matches this word later on this you will earn 145 points">?</span></td>
						<td class="text-right"><nf:format number="${recap.summary.countEmptyTags * 5}" /></td>
					</tr>
					<tr>
						<td><img src="/static/img/match-dictionary.png" alt="match with our Dictionary" /></td>
						<td><strong><nf:format number="${recap.summary.countDictionaryMatches}"/></strong> ${recap.summary.countDictionaryMatches == 1 ? 'dictionary match' : 'dictionary matches' } <span class="help" title="A dictionary match will earn you 25 points">?</span></td>
						<td class="text-right"><nf:format number="${recap.summary.countDictionaryMatches * 25}" /></td>
					</tr>
					<tr>
						<td><img src="/static/img/match-social.png" alt="match with other player" /></td>
						<td><strong><nf:format number="${recap.summary.countMatchingTags}"/></strong> ${recap.summary.countMatchingTags == 1 ? 'match' : 'matches' } with other players <span class="help" title="Entering the same tag as one of your co-players will earn you 50 points">?</span></td>
						<td class="text-right"><nf:format number="${recap.summary.countMatchingTags * 50}" /></td>
					</tr>
					<tr>
						<td><img src="/static/img/match-pioneer.png" alt="Pioneer match" /></td>
						<td><strong><nf:format number="${recap.summary.countPioneerTags}"/></strong> ${recap.summary.countPioneerTags == 1 ? 'pioneer match' : 'pioneer matches' } <span class="help" title="If you were the first to enter a word then the first match will earn you 145 points">?</span></td>
						<td class="text-right"><nf:format number="${recap.summary.countPioneerTags * 100}" /></td>
					</tr>
					<tr>
						<td><img src="/static/img/match-location.png" alt="Location match" /></td>
						<td><strong><nf:format number="${recap.summary.countPioneerTags}"/></strong> ${recap.summary.countPioneerTags == 1 ? 'pioneer match' : 'You achieved a location award you bastard' } <span class="help" title="If you were the first to enter a word then the first match will earn you 145 points">?</span></td>
						<td class="text-right"><nf:format number="${recap.summary.countPioneerTags * 100}" /></td>
					</tr>
					<tr>
						<td></td>
						<td><strong>Total score</strong></td>
						<td class="text-right"><nf:format number="${recap.ownerScore}" /></td>
					</tr>

				</table>
		</center>
		<div class="chart" style="color:#fff" id="my-timer">
			<p>&nbsp;</p>			<p>&nbsp;</p>			<p>&nbsp;</p>
        	<h3 style="text-transform:none">The next game will start in <span style="color:red"><b id="show-time">10</b></span> seconds</h3>        
		</div>

						<center>
		<h1>Play Game</h1>
		<div class="videoboxrecap">
			<ul >

				<c:forEach var="channel" begin="1" end="4" items="${channels}">

				<li>
					<a style="border:none; width:80%;" href="/start-game/${channel.video.id}" title="${channel.video.title}" rel="nofollow"  >

						<div class="video3" style="height:300px;">
							<div class="img">
								<img src="${channel.video.imageUrl}" />
								<div class="overlay trigger"></div>
							</div>
						</div>

					</a>
				</li>
				<!-- COUNTDOWN FOR NEW GAME-->

				    <script type="text/javascript">
				    	var url = "/start-game/${channel.video.id}";
				        var settimmer = 0;
				        $("document").ready(function(){
				        	    var tc = document.getElementById("txtCss");
								var ary = tc ? tc.getElementsByTagName("a") : [];
									if(ary.length >= 2)
									    ary[0].href = ary[1].href;

				                window.setInterval(function() {
				                    var timeCounter = $("b[id=show-time]").html();
				                    var updateTime = eval(timeCounter)- eval(0.25);
				                    $("b[id=show-time]").html(updateTime);

				                    if(updateTime == 0){
				                        window.location = (url);
				                    }
				                }, 1000);

				        });
				    </script>
				</c:forEach>			
			</ul>
		</div>
		</centeR>
	</div>


	</div>

</div>



<!-- BEGIN: Sticky Footer -->
<div id="footer_container">
	<div style="margin: -10px;">
	<img height="5px" width="100%" src="/static/img/menucolor.png" alt="colormenu" />	
	</div>
    <div id="footer">
    	<a href="http://crowddriven.nl">
       		<img style="margin: 10px 0px 0px 10px; " width="150px" class="float-lt" src="/static/img/CDD.png" alt="CrowDDriven Tag" />		
       </a>
        <a href="http://crowddriven.nl">
       		<img style="width:80px; margin-top: 10px; margin-right:5px;" class="float-rt" src="/static/img/logo-vu.png" alt="Vu Logo" />		
       </a>
    	<div class="center">
        	<span style="color:#9099B7; font-size: 0.75em; text-align:center;">&COPY; 2015 - Designed by <a href="divetv.ops.labs.vu.nl/app.php" target="_blank">CrowDDriven</a></span>
   		</div>

    </div>
</div>



	
</tt:body>
</tt:html>
