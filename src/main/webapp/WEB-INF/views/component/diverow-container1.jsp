<script type="text/javascript">
	jQuery(document).ready(function($) {

		
		$('#componentWrapper10').thumbGallery({
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

<div class="col-md-12">
	<div id="componentWrapper10" class="slider-wrapper">
		<div class="thumbContainer">
			<div class="thumbInnerContainer">

				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-ficper-JonSnow"
						title="Browse Entity: Jon Snow">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/frontpageMedia/JonSnowLandscape.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED  !-->
								<div class="overlay trigger"><i class="fa fa-search fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Jon Snow</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Dorne !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-ficloc-Dorne"
						title="Browse Entity: Dorne">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/frontpageMedia/SunspearLandscape.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-search fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Dorne</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Eddard Stark !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-ficper-EddardStark"
						title="Browse Entity: Eddard Stark">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/frontpageMedia/NedStarkLandscape.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED  !-->
								<div class="overlay trigger"><i class="fa fa-search fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Eddard Stark</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- King's Landing !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-ficloc-KingsLanding"
						title="Browse Entity: King's Landing">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/frontpageMedia/KingsLandingLandscape.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED  !-->
								<div class="overlay trigger"><i class="fa fa-search fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">King's Landing</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Daenerys Targaryen !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-ficper-DaenerysTargaryen"
						title="Browse Entity: Daenerys Targaryen">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/frontpageMedia/DanaerysTargaryenLandscape.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED  !-->
								<div class="overlay trigger"><i class="fa fa-search fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Daenerys Targaryen</p>
					<!-- SEASON INFO 
					<p class="info">Season 1 Episode 2</p> !-->
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
					<!-- carrousel 2 !-->
					<!-- Joffrey Baratheon !-->
					<div class='thumbHolder' style="box-sizing: content-box;">
						<!-- URL !-->
						<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-ficper-JoffreyIBaratheon"
							title="Browse Entity: Joffrey Baratheon">
							<!-- Image !-->
							<div class="img">
								<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/frontpageMedia/JoffreyLandscape.jpg"
									width="180" height="120" alt="Entity thumbnail" />
								<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-search fa-3x"></i></div> 
							</div>
						</a>
						<!-- Title!-->
						<p width="100%" class="title">Joffrey Baratheon</p>
						<!-- SEASON INFO 
						<p class="info">Season 1 Episode 2</p> !-->
						<!-- Social media
						<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
						!-->
					</div>
					<!-- Castle Black !-->
					<div class='thumbHolder' style="box-sizing: content-box;">
						<!-- URL !-->
						<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-ficloc-CastleBlack"
							title="Browse Entity: Castle Black">
							<!-- Image !-->
							<div class="img">
								<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/frontpageMedia/castleblackLandscape.jpg"
									width="180" height="120" alt="Entity thumbnail" />
								<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-search fa-3x"></i></div> 
							</div>
						</a>
						<!-- Title!-->
						<p width="100%" class="title">Castle Black</p>
						<!-- SEASON INFO 
						<p class="info">Season 1 Episode 2</p> !-->
						<!-- Social media
						<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
						!-->
					</div>
					<!-- Stannis Baratheon !-->
					<div class='thumbHolder' style="box-sizing: content-box;">
						<!-- URL !-->
						<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-ficper-StannisIBaratheon"
							title="Browse Entity: Stannis Baratheon">
							<!-- Image !-->
							<div class="img">
								<img class="thumb_hidden" src="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/frontpageMedia/StannisLandscape.jpg"
									width="180" height="120" alt="Entity thumbnail" />
								<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-search fa-3x"></i></div> 
							</div>
						</a>
						<!-- Title!-->
						<p width="100%" class="title">Stannis Baratheon</p>
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
</div>
