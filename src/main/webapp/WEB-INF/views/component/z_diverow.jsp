<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>

<%
	String channelName = (String) request.getAttribute("channelName"); 
%>

<script type="text/javascript">
	jQuery(document).ready(function($) {
		var channelName = '<%=channelName %>';
		
		$('#componentWrapper' + channelName).thumbGallery({
			/* GENERAL */
			/*layoutType: grid/line */
			layoutType : 'line',
			/*thumbOrientation: horizontal/vertical */
			thumbOrientation : 'horizontal',
			/*moveType: scroll/buttons */
			moveType : 'buttons',

			/*scrollOffset: how much to move scrollbar and scrolltrack off the content (enter 0 or above) */
			scrollOffset : 0,

			/* GRID SETTINGS */

			/*horizontalSpacing:  */
			horizontalSpacing : 10,
			/*buttonSpacing: button spacing from the grid itself */
			buttonSpacing : 20,
			/*direction: left2right/top2bottom (direction in which boxes are listed) */
			direction : 'left2right',

			/* INNER SLIDESHOW */
			/*innerSlideshowDelay: slideshow delay for inner items in seconds, random value between: 'min, max', 
			enter both number the same for equal time delay like for example 2 seconds: '2,2' */
			innerSlideshowDelay : [ 2, 4 ],
			/*innerSlideshowOn: autoplay inner slideshow, true/false */
			innerSlideshowOn : false
		});

		jQuery("a[data-rel^='prettyPhoto']").prettyPhoto({
			theme : 'pp_default',
			deeplinking : false,
			callback : function() {
				detailClosed();
			}/* Called when prettyPhoto is closed */
		});

	});
</script>


<div id="componentWrapper${channelName}" class="slider-wrapper">
	<div class="thumbContainer">
		<div class="thumbInnerContainer">

			 <!-- Data !-->
				<!-- top carrousel !-->
				<!-- Battle at Blackwater bay !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/got-ficev-BattleOfBlackwater"
						title="Browse Event: Battle at Blackwater Bay">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/img/frontpage-events/blackwater.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED 
							<div class="overlay trigger"><i class="fa fa-gamepad fa-3x"></i></div> !-->
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Battle at Blackwater Bay</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- The purple wedding !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/got-ficev-ThePurpleWedding"
						title="Browse Event: The Purple Wedding">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/img/frontpage-events/purplewedding.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED 
							<div class="overlay trigger"><i class="fa fa-gamepad fa-3x"></i></div> !-->
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">The Purple Wedding</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Battle at castle black !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/got-ficev-BattleofCastleBlack"
						title="Browse Event: Battle of Castle Black">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/img/frontpage-events/castleblack.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED 
							<div class="overlay trigger"><i class="fa fa-gamepad fa-3x"></i></div> !-->
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Battle of Castle Black</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Red Wedding !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/got-ficev-TheRedWedding"
						title="Browse Event: The Red Wedding">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/img/frontpage-events/redwedding.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED 
							<div class="overlay trigger"><i class="fa fa-gamepad fa-3x"></i></div> !-->
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">The Red Wedding</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Duel of the mountain vs the viper !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/got-ficev-MountainAndViper"
						title="Browse Event: Duel of the Mountain and the Viper">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/img/frontpage-events/mountainandviper.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED 
							<div class="overlay trigger"><i class="fa fa-gamepad fa-3x"></i></div> !-->
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Duel of the Mountain and the Viper</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				
			

		</div>
	</div>

	<div class="thumbBackward thumb_hidden" >
		<img src="${appBaseUrl}/static/img/icons/thumb_backward.png" alt="" width="21" height="31" />
	</div>
	<div class="thumbForward thumb_hidden">
		<img src="${appBaseUrl}/static/img/icons/thumb_forward.png" alt="" width="21" height="31" />
	</div>
</div>
