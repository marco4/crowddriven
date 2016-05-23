<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>

<script src="${appBaseUrl}/static/script/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.func.js"></script>

<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="body">
 		
 		<%@ include file="component/statistic-container.jsp" %>
 		<!-- End statistic-container -->
 
 		
 		<%@ include file="component/top-slider-container.jsp" %>
 		<!-- End Top Slider -->
 		
 		
 		<div id="campaign-slider-container" class="row">
 			<div class="col-md-12 headline">
 				<span> Rampage Game Campaign </span>
 				<p>Tag as much as possible and stretch the time till you are Game over</p>
 			</div>
 			<div id="rampage-campaign" class="col-md-12"></div>
 			
 			<div class="col-md-12 headline">
 				<span> Personel Tagging Campaign </span>
 			</div>
 			<div id="personel-campaign" class="col-md-12"></div>

 			<div class="col-md-12 headline">
 				<span> Location Tagging Campaign </span>
 			</div>
 			<div id="location-campaign" class="col-md-12"></div>
 			
 			<div class="col-md-12 headline">
 				<span> Event Tagging Campaign </span>
 			</div>
 			<div id="event-campagin" class="col-md-12"></div>
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
	 				url: "z_rampage-slider"
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
	 				url: "z_videoslider"
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
	 				url: "z_videoslider"
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
	 				url: "z_videoslider"
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
	 			$('.spincrement').spincrement({
	 				from: 0.0,
	 				decimalPlaces: 0,
	 				duration: 20000,
	 			});
	 			
	 		});
 		</script>
 
    </tiles:putAttribute>
</tiles:insertDefinition>