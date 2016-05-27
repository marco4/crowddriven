<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tt" %>
<%@page import="java.util.Map"%>

<style>
	.badgebox{
		text-align:center;
		width: 250px;
		height: 370px;
		margin: 0px;
		padding: 10px;

	}
	.imgbadge{
		width: 130px;
	    display: block;
	    margin-left: auto;
	    margin-right: auto;
	}
	.badgeboxinner{
		height: 360px;
		background-color: #333;
		padding:10px;
		border: 1px solid #444;
	}
	.badgeboxdescription{
		position: absolute;
		height: 200px;
 		color: #E6E6FA;
		background-color: #111;
		width:207px;
		text-align: left;
		line-height:20px;
		border: 1px solid #393939;
		box-shadow: 0px 0px 2px #000 inset;
	}
	.badgeboxdescription>h2{
		display: block;
		left:10px;
		font-size: 1.3em;
		margin: 10px 10px 0px;
		padding-bottom: 5px;
		font-weight: normal;
		color: #fff;
		text-shadow: 0px 0px 1px #FFF;
		border-bottom: 1px solid #666;
	}
	.badgeboxdescription>p{
		display: block;
		font-size: 0.8em;
		margin: 10px 10px 10px 10px;
		line-height: 20px;
		padding-top:5px;
		color: #fff;
		text-shadow: 0px 0px 1px #FFF;
	}
	/* centered columns styles */
	.row-centered {
	    text-align:center;
	}
	.col-centered {
	    display:inline-block;
	    float:none;
	    /* reset the text-align */
	    text-align:left;
	    /* inline-block space fix */
	    margin-right:-4px;
	}

</style>


<div class="row">

	<div style="margin-left:40px;"class="col-md-10 headline">
		<span><i class="fa fa-shield"></i>  Badges</span>
		<p>In CrowDDriven Tag and Dive you can earn badges, do you want to know how? Check out the obtainable badges below and read the descriptions how you can earn them. When you are logged in, you can check which badges you already have earned in your profile page. <br><br>Still don’t have an account?  What are you waiting for, create one <a href="/registreren">here</a> right now and start earning awesome badges! <br>&nbsp;</p>
	</div>
</div>
<div style="overflow:hidden; margin-left: 10px; margin-right: 10px;" class="row row-centered">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="UnmatchedRookie" >
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/unmatchedrookie.png" />
					<div class="badgeboxdescription">
						<h2>Unmatched Rookie</h2><p>Earning this badges means you start to understand what this game means. To earn this badge you need to obtain 50 Unmatched Tags </p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="UnmatchedChief" >
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/unmatchedchief.png" />
					<div class="badgeboxdescription">
						<h2>Unmatched Chief</h2><p>Chief, You are definitely on the good way. Unmatched tags will definitely help users to find information through Dive. To Earn this badge you need to obtain 100 unmatched Tags.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="UnmatchedCommander" >
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/unmatchedcommander.png" />
					<div class="badgeboxdescription">
						<h2>Unmatched Commander</h2><p>A true commander, your attention is sparkled by the mysterious scenes of Game of Thrones. This badge is awarded for entering over 200 unmatched Tags.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="*UnmatchedVeteran*" >
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/pioneerveteran.png" />
					<div class="badgeboxdescription">
						<h2>*Unmatched Veteran*</h2><p>A survivor of the Iron Winter, You are a Veteran. This badge is awarded when you have erned 400 or more earned unmatched tags</p>
					</div>
				</div>
			</div>
		</div>
	<div class="row">
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="MatchRookie">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/matchrookie.png" />
					<div class="badgeboxdescription">
						<h2>Match Rookie</h2><p>Extraordinary skill in matching with other users makes you a match maker. Matching tags is your strong point. Badge is awarded for tagging 50 different tags what match with an other user.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="MatchChief" >
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/matchchief.png" />
					<div class="badgeboxdescription">
							<h2>Match Chief</h2><p>You have proven to deserve the armor that only kings can wear by your in-game performance. Badge is awarded for having 100 confirmed tags in than 15 games</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="MatchCommander" >
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/matchcommander.png" />
					<div class="badgeboxdescription">
						<h2>Match Commander</h2><p>No one goes unnoticed by you, you know this GoT community and therefore deserve this badge. Badge is awarded for tagging more than 200 matched tags in-game.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="*MatchVeteran*" >
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/matchveteran.png" />
									<div class="badgeboxdescription">
						<h2>*Match Veteran*</h2><p>What a beautiful achievement. You and the other matching users did a great job in helping us to make GoT searchable! Badge is awarded for tagging more than 400 matched tags in-game. </p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="DictionaryRookie" >
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/dictionaryrookie.png" />
					<div class="badgeboxdescription">
						<h2>Dictionary Rookie</h2><p>With the effort you put in its possible to be even smart as an owl. Badge is awarded for tagging more than 50 dictionary tags in-game </p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="DictionaryChief">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/dictionarychief.png" />
					<div class="badgeboxdescription">
						<h2>Dictionary Chief</h2><p>You are a true Wise Guy and your knowledge base is spread over many fields. Badge is awarded for having tagged more than 100 different characters, locations, actors and events.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="DictionaryCommander">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/dictionarycommander.png" />
					<div class="badgeboxdescription">
						<h2>Dictionary Commander</h2><p>The database of how to live in Game of Thrones is placed in your head, you know every little detail. Badge is awarded for tagging over 200 dictionary tags</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="*DictionaryVeteran*">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/dictionaryveteran.png" />
					<div class="badgeboxdescription">
						<h2>*Dictionary Veteran*</h2><p>No one gets past you, you defend the throne like a true king. Badge is awarded for earning 400 dictionary tags by yourself!</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">	
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="CampaignRookie">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/campaignrookie.png" />
					<div class="badgeboxdescription">
						<h2>Campaign Rookie</h2><p>You started to play campaigns and to understand why it is important to do this. This badges is awarded for earning 50 campaign tags!</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="CampaignChief">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/campaignchief.png" />
					<div class="badgeboxdescription">
						<h2>Campaign Chief</h2><p>Jon snow knows nothing, it is nice to see you help him out! you earn this badge by entering 100 campaign tags. </p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="CampaignCommander">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/campaigncommander.png" />
					<div class="badgeboxdescription">
						<h2>Campaign Commander</h2><p>A survivor of the Iron Winter, the leaderboard should face your profile right now?!. Badge is awarded for entering 200 campaign tags!</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="*CampaignVeteran*">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/campaignveteran.png" />
					<div class="badgeboxdescription">
						<h2>*Campaign Veteran*</h2><p>A survivor of the fittest, You are currently the first one who earned this badges. Try to achieve also the pioneer tags. Badges is awarded for entering 400 campaign tags!</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner"  id="PioneerRookie">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/pioneerrookie.png" />
					<div class="badgeboxdescription">
						<h2>Pioneer Rookie</h2><p>Ok, maybe we need to explain this one, Pioneer tags are earned if you are the first on who describes the word and another user match with you. Badge is awarded when you have 50 pioneer tags.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="PioneerChief">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/pioneerchief.png" />
					<div class="badgeboxdescription">
						<h2>Pioneer Chief</h2><p>You are a real pioneerchief! Did you always walk in front in the war? Badge is awarded when you have 100 pioneer tags.</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="PioneerChief">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/pioneercommander.png" />
					<div class="badgeboxdescription">
						<h2>Pioneer Commander!</h2><p>You are truly a Pioneer. We want peace but Lets fight further to get the most hardest badge to earn! Badge is awarded when you have 200 Pioneertags!</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner" id="*PioneerVeteran*">
					<img class="imgbadge" src="${appBaseUrl}/static/img/badges/unmatchedveteran.png" />
					<div class="badgeboxdescription">
						<h2>*Pioneer Veteran*</h2><p>Ok, you are not walking anymore in front of the war. You are a strategic one! you earned the most hardest earnable badge within the GoT-community by entering 400 Pioneertags. </p>
					</div>
				</div>
			</div>
		</div><!--
		<div class="row">
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner">
					<img class="imgbadge" src="${appBaseUrl}/static/img/albums/stark.png" />
					<div class="badgeboxdescription">
						<h2>Moving Mountains</h2><p>A survivor of the Iron Winter, the leaderboard showed your name for over 2 months. Badge is awarded for holding a position in the leaderboard for a period of 2 months</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner">
					<img class="imgbadge" src="${appBaseUrl}/static/img/albums/stark.png" />
					<div class="badgeboxdescription">
						<h2>Shining Bright</h2><p>A survivor of the Iron Winter, the leaderboard showed your name for over 2 months. Badge is awarded for holding a position in the leaderboard for a period of 2 months</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 col-centered badgebox">
				<div class="badgeboxinner">
					<img class="imgbadge" src="${appBaseUrl}/static/img/albums/stark.png" />
					<div class="badgeboxdescription">
						<h2>Dragon Queen</h2><p>A survivor of the Iron Winter, the leaderboard showed your name for over 2 months. Badge is awarded for holding a position in the leaderboard for a period of 2 months</p>
					</div>
				</div>
			</div>!-->
		</div>
	</div>
</div>
<!-- If user logged in, mark the obtained Badges of the user !-->
	<c:forEach items="${badgeList}" var="badge">
		<script>
			$( document ).ready(function() {
				var badge = "${badge.title}";
				str = badge.replace(/\s+/g, '');
			    $('#' + str).css('background-color', '#6FB0DE');
			});
		</script>

	</c:forEach>
