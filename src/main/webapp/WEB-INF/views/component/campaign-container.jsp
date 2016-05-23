	
 		<div id="campaign-slider-container" class="row">
 			<div class="col-md-12 headline">
 				<span> Rampage Game Campaign </span>
 				<p style="text-align:center; font-size: 13px; color: grey;">"Rampage Game, tag as much as possible to stretch the time over and over again. If you are not earned enough points on time, you will be Game over!"</p>
 			</div>
 			<div id="rampage-campaign" class="col-md-12"></div>
 			


 			<div class="col-md-12 headline">
 				<span> Person Tagging Campaign </span>
 				<p style="text-align:center; font-size: 13px; color: grey;">"Person Tagging Game, You earn only points by tagging real persons or characternames. By playing this game you enrich Dive with the data they really need!"</p>
 			</div>

 			<div id="personel-campaign" class="col-md-12"></div>
 			<div class="col-md-12 headline">
 				<span> Location Tagging Campaign </span>
 				 <p style="text-align:center; font-size: 13px; color: grey;">"Location Tagging Game, You earn only points by tagging real locations or GoT Location names. We really want to know where all fragments took place to enrich Dive!"</p>
 			</div>
 			<div id="location-campaign" class="col-md-12"></div>
 			

 		</div>
 
 
 
 		
 		
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.thumbGallery.min.js"></script>
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.prettyPhoto.js" charset="utf-8"></script> 
 
 		<script type="text/javascript">
	 		$(window).load(function() {
	 	        $('#top-slider').nivoSlider();
	 	    });
	 		
	 		$(document).ready(function() {
	 			/**
	 			 * call webservice to get the videos for CHANNEL 1
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_rampage-slider?channel=s4"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#rampage-campaign').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#rampage-campaign').html('Fail to get videos');
	 			});
	 			
	 			/**
	 			 * call webservice to get the videos for CHANNEL 2
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_videoslider?channel=s3"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#personel-campaign').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#personel-campaign').html('Fail to get videos');
	 			});

	 			/**
	 			 * call webservice to get the videos for CHANNEL 3
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_videoslider?channel=s2"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#location-campaign').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#location-campaign').html('Fail to get videos');
	 			});

	 			/**
	 			 * call webservice to get the videos for CHANNEL 4
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_videoslider?channel=s1"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#event-campagin').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#event-campagin').html('Fail to get videos');
	 			});
	 			
	 			
	 			// SHOW NUMBER AS INSCREASING
	 			/* $('.spincrement').spincrement({
	 				from: 0.0,
	 				decimalPlaces: 0,
	 				duration: 20000,
	 			}); */
	 			
	 		});
 		</script>
