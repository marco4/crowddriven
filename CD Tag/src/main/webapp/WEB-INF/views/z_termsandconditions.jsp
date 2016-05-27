<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tt"%>

<script src="${appBaseUrl}/static/script/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.func.js"></script>

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

<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="body">
 		
 		<%@ include file="component/sidebar-container.jsp" %>
 	

        <!-- /#sidebar-wrapper -->
 		<%@ include file="component/top-slider-container.jsp" %>
 		<!-- End Top Slider -->

	<!-- AddThis Button BEGIN -->
	<div class="row" style="margin:0px; margin-right:10px;">
		<div class="col-md-8">
			<p class="online">
				<strong>${globalStats.currentlyPlaying} ${globalStats.currentlyPlaying == 1 ? 'player' : 'players'}</strong> currently online

			</p>
		</div>
		<div class="col-md-4">
			<div style="margin-top:10px; margin-right:10px;" class="addthis_default_style pull-right spaced-bottom"
				addthis:url="${staticModel.socialReferenceHome}"
		    	addthis:title="${staticModel.socialReferenceTitle}"
				addthis:description="${staticModel.socialReferenceDescription}">
				<a class="addthis_button_preferred_1"></a>
				<a class="addthis_button_preferred_2"></a>
				<a class="addthis_button_preferred_3"></a>
				<a class="addthis_button_preferred_4"></a>
				<a class="addthis_button_compact"></a>
				<a class="addthis_counter addthis_bubble_style"></a>
			</div>
		</div>	
	</div>

<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55bfd5c53c9fb06f" async="async"></script>

<div id="content-wrapper">

	<div class="col-md-2"></div>
	<div style="color: #808080;" class="col-md-6">
		<h1 style="color: #fff;"class="offset3">General Terms and Conditions <small>Crowddriven</small></h1>
		<h3 style="color: #fff;">1. Crowddriven Tag Game</h3>
		
		<p> Commissioned by the Crowddriven Project Group and in coorperation with the VU - Vrije Universiteit Amsterdam is the domain crowddriven.nl - from now on called domain - hosted. The platform is developed in order to play the tag game and explore DIVE with all necessary parts around it. The data and statistics will be mainly used for a study. </p><br>
		
		<p>Offering the opportunity to play the Game makes no
obligation of the Crowddriven Project towards the players emerged. the
Crowddriven Project, the Site and / or the subdomain, or access
to and / or use of the Game, interrupt at any time, or terminate
whenever this one cause of technical, FINANCE le, legal or
other nature arises.</p>
		
		<h3 style="color: #fff;">2. Applicability and compliance with conditions</h3>
		
		<p>These conditions apply to visitors to the Site
and / or the Subdomain, who thus have access to call up thereon
audiovisual material and as Player participating in the Game.</p><br>
		
		<p>Before players create an account on the subdomain they serve on the
appropriate place (by means of check) to attach this
conditions to recognize and respect.</p><br>
		
		<p>Where a Player is acting in breach of these conditions can the Crowddriven Project and/or VU decide at their discretion to the account to terminate the relevant player(s).
		
		<br>In case of serious breaches of the
conditions and / or infringement of intellectual property rights is concerned
Players liable for the resulting damage and will
reimbursement thereof if necessary, be enforced by legal action
c.q. recovered.</p>
		
		<h3 style="color: #fff;">3. Costs</h3>
		
		<p>Participation to the tag game or usage of the dive explorer is now fee involed.</p>
		
		<h3 style="color: #fff;">4. Usage</h3>
		
		<p>The content on this platform is used for Scientific purposes only. You are not permitted to copy, broadcast, download, store (in any medium), transmit, show or play in public, adapt or change in any way the content of these video footage for any other purpose whatsoever without the prior written permission of the legal owner. </p><br>
		
		<p> By submitting Content or tags to Crowddriven, you hereby grant Crowddriven a worldwide, non-exclusive, royalty-free, sublicenseable and transferable license to use, reproduce, distribute, prepare derivative works of, display, and perform the Content in connection with the Service and Crowddriven's (and its successors' and affiliates') business, including without limitation for promoting and redistributing part or all of the Service (and derivative works thereof) in any media formats and through any media channels. You also hereby grant each user of the Service a non-exclusive license to access your Content through the Service, and to use, reproduce, distribute, display and perform such Content as permitted through the functionality of the Service and under these Terms of Service. The above licenses granted by you in video Content you submit to the Service terminate within a commercially reasonable time after you remove or delete your videos from the Service. You understand and agree, however, that Crowddriven may retain, but not display, distribute, or perform, server copies of your contributions that have been removed or deleted. The above licenses granted by you in user comments you submit are perpetual and irrevocable.</p><br>
		
		<p>Crowddriven does not endorse any Content submitted to the Service by any user or other licensor, or any opinion, recommendation, or advice expressed therein, and Crowddriven expressly disclaims any and all liability in connection with Content. Crowddriven does not permit copyright infringing activities and infringement of intellectual property rights on the Service, and Crowddriven will remove all Content if properly notified that such Content infringes on another's intellectual property rights. Crowddriven reserves the right to remove Content without prior notice..</p><br>
		
		<p> It is not allowed to use parts of the content on the Site and/or (sub)domains and/or game electronical or otherwhise to copy as far it is necessary to display the content on a efficiently manner to participate on the game.
		</p><br>
		
		Furthermore the following actions are not allowed to do within the Crowddriven domain or subdomains:
		
		<ul>
		
		<li> - Bother other Players.</li>
		
		<li> - Expressions, messages, texts or names of racist or otherwise
distribute or grossly offensive nature and / or publish.</li>
		
		<li> - Sexual harassment to other players.</li>
		
		<li> - Publication or distribution of any kind of pornographic material.</li>
		
		<li> - Make any form of publication or distribution of any form of advertising whatsoever, and refer to advertising by linking or deep-linking.</li>
		
		<li> - Maim, modify and / or corrupt files, information and / or other materials on the Site or subdomain</li>
		
		<li> - Spam.</li>
		
		</ul><br>
		
		<p>The result of unauthorized actions as mentioned above will be removed or corrected at the discretion of the Crowddriven Project Group immediately of the Site and / or subdomain. Further, it Crowddriven Project has the right to participate in the last two sentences of Article 2 indicated measures.</p>
		
		<h3 style="color: #fff;">5. Intellectuele ownerrights</h3>
		

		<p>Players waive their rights to any by them, whether in connection with the playing of the Game, the Site and / or the subdomain added text or materials. This means that by Players in the Game framework devised keywords and / or other texts may be used freely by the Crowddriven Project, disclosed and / or reproduced without limitation to shape, frequency, circulation , time or territory in which this happens, and without the need now or in the future any payment to respective player (s) is due.</p>
		
		<h3 style="color: #fff;">6. Privacy</h3>
		
		<p>Personal Players are solely used for the purpose of facilitating access to and use of the subdomain and Game recorded. By registering your e-mail can be used for Crowddriven project uses.</p>
		
		<h3 style="color: #fff;">7. Cookies</h3>
		
		<p>The Platform uses cookies. These are only used to optimal functioning of the subdomain. To participate in the game, it is necessary to accept cookies.</p>
		
		<h3 style="color: #fff;">8. General</h3>
		
		<p>If any provision of these conditions is declared binding shall not affect the binding nature of the other provisions of these terms and conditions. In case of invalidity of one or more provisions of these conditions will the player be bound by the rules as much as possible similar effect that are not subject to nullity.</p>
		

		
		<p>Oktober 2015</p>

	</div>

</div>


	<!-- AddThis Button END -->
		<%-- <div class="item-1 content-item" style="display:block;">
		  	<%@ include file="component/home-container.jsp" %>

		<div class="item-2 content-item" style="display: none;">
		   <%@ include file="component/profile-container.jsp" %>
		</div>

		<div class="item-3 content-item" style="display: none;">
		    <%@ include file="component/leaderbords-container.jsp" %>
		</div>
		<div class="item-4 content-item" style="display: none;">
		    <%@ include file="component/campaign-container.jsp" %>
		</div>
		<div class="item-5 content-item" style="display: none;">
		    <%@ include file="component/game-instructions-container.jsp" %>
		</div>
		<div class="item-6 content-item" style="display: none;">
		    <%@ include file="component/gameplay-container.jsp" %>
		</div>
		<div class="item-7 content-item" style="display: none;">
		    <%@ include file="component/badges-container.jsp" %>
		</div>
		<div class="item-8 content-item" style="display: none;">
		    <%@ include file="component/ranks-container.jsp" %>
		</div> --%>
 	
 
 
 		
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.thumbGallery.min.js"></script>
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.prettyPhoto.js" charset="utf-8"></script> 
 
 	<tt:games-queue dynamic="true"/>
 
    </tiles:putAttribute>
</tiles:insertDefinition>