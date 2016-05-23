<script type="text/javascript">
	jQuery(document).ready(function($) {

		
		$('#componentWrapper11').thumbGallery({
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
	<div id="componentWrapper11" class="slider-wrapper">
		<div class="thumbContainer">
			<div class="thumbInnerContainer">

				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/vu#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-vid-S01E02F06"
						title="Browse Clip: The Kingsroad Clip 6">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-252-8.eu-central-1.compute.amazonaws.com/thmb/GOTS01E02-Thmb06.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED  !-->
								<div class="overlay trigger"><i class="fa fa-play-circle fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">The Kingsroad Clip 6</p>
					<!-- SEASON INFO !-->
					<p class="info">Season 1 Episode 2</p> 
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Winter is Coming Clip 3 !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/vu#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-vid-S01E01F03"
						title="Browse Clip: Winter is Coming Clip 3">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-252-8.eu-central-1.compute.amazonaws.com/thmb/GOTS01E01-Thmb03.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-play-circle fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Winter is Coming Clip 3</p>
					<!-- SEASON INFO !-->
					<p class="info">Season 1 Episode 1</p> 
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Winter is Coming Clip 11 !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/vu#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-vid-S01E01F11"
						title="Browse Clip: Winter is Coming Clip 11">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-252-8.eu-central-1.compute.amazonaws.com/thmb/GOTS01E02-Thmb11.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-play-circle fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Winter is Coming Clip 11</p>
					<!-- SEASON INFO !-->
					<p class="info">Season 1 Episode 1</p> 
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- The Kingsroad Clip 15 !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/vu#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-vid-S01E02F15"
						title="Browse Clip: The Kingsroad Clip 6">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-252-8.eu-central-1.compute.amazonaws.com/thmb/GOTS01E02-Thmb15.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-play-circle fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">The Kingsroad Clip 15</p>
					<!-- SEASON INFO !-->
					<p class="info">Season 1 Episode 2</p> 
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- The Kingsroad Clip 8 !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/vu#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-vid-S01E02F08"
						title="Browse Clip: The Kingsroad Clip 8">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-252-8.eu-central-1.compute.amazonaws.com/thmb/GOTS01E02-Thmb08.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-play-circle fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">The Kingsroad Clip 8</p>
					<!-- SEASON INFO !-->
					<p class="info">Season 1 Episode 2</p> 
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Winter is Coming Clip 5 !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/vu#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-vid-S01E01F05"
						title="Browse Clip: Winter is Coming Clip 5">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-252-8.eu-central-1.compute.amazonaws.com/thmb/GOTS01E02-Thmb05.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED 
							<div class="overlay trigger"><i class="fa fa-gamepad fa-3x"></i></div> !-->
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Winter is Coming Clip 5</p>
					<!-- SEASON INFO !-->
					<p class="info">Season 1 Episode 1</p> 
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- Winter is Coming Clip 17 !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/vu#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-vid-S01E01F17"
						title="Browse Clip: Winter is Coming Clip 17">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-252-8.eu-central-1.compute.amazonaws.com/thmb/GOTS01E02-Thmb17.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED 
							<div class="overlay trigger"><i class="fa fa-gamepad fa-3x"></i></div> !-->
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">Winter is Coming Clip 17</p>
					<!-- SEASON INFO !-->
					<p class="info">Season 1 Episode 1</p> 
					<!-- Social media
					<span class="diveStats"><i class="fa fa-mouse-pointer"></i> ${channel.diveClicks} <i style="color:#51adff;" class="fa fa-twitter"></i> ${channel.twitterShares} <i style="color:#d83733;" class="fa fa-pinterest"></i> ${channel.pinterestPins}</span> 
					!-->
				</div>
				<!-- The Kingsroad Clip 12 !-->
				<div class='thumbHolder' style="box-sizing: content-box;">
					<!-- URL !-->
					<a target="_top" href="http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php/vu#browser\entity\http://divetv.ops.labs.vu.nl/entity/gotw-vid-S01E02F12"
						title="Browse Clip: The Kingsroad Clip 12">
						<!-- Image !-->
						<div class="img">
							<img class="thumb_hidden" src="http://ec2-52-28-252-8.eu-central-1.compute.amazonaws.com/thmb/GOTS01E02-Thmb12.jpg"
								width="180" height="120" alt="Entity thumbnail" />
							<!-- Game Pad TAG RELATED !-->
								<div class="overlay trigger"><i class="fa fa-play-circle fa-3x"></i></div>
						</div>
					</a>
					<!-- Title!-->
					<p width="100%" class="title">The Kingsroad Clip 12</p>
					<!-- SEASON INFO !-->
					<p class="info">Season 1 Episode 2</p> 
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
