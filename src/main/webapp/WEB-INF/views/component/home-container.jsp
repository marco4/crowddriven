	<style>
		.popover-title {
			    padding: 8px 14px;
			    margin: 0px;
			    color: #000;
			    font-size: 14px;
			    background-color: grey;
			    border-bottom: 1px solid #EBEBEB;
			    border-radius: 5px 5px 0px 0px;
		}
		.popover-content {
			   color:#000;
		}	


	</style>

  	<div id="channels-slider-container" class="row">

		
		<div id="focustitle" class="col-md-12 headline">
			<span ><i style="color:#840000"class="fa fa-bomb"></i> New Game - RAMPAGE MODE! <a style="cursor: pointer;" id="btn3"  data-toggle="popover" title="Rampage game" data-content="Tag as much as correct tags to stretch the time over and over again. If you are not earned enough points on time, you will be Game over!" data-original-title="Random Tagging"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>
		</div>
		<div id="rampage-campaign" class="col-md-12"></div>

		<div class="col-md-12 headline">
			<span ><i style="color:#41BF28" class="fa fa-calendar-check-o"></i> Tag all events! <a style="cursor: pointer;" id="btn4"  data-toggle="popover" title="Event Tagging Game" data-content="You earn only points by tagging events like Kill, play and fight. We only got 210 assigned events jet, Dive needs help from you!" data-original-title="Random Tagging"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>
		</div>
		<div id="event-campaign" class="col-md-12"></div>

	
		<div class="col-md-12 headline">
			<span><i style="color:#9CA59D" class="fa fa-user-secret"></i> Do you know the names?! <a style="cursor: pointer;" id="btn5"  data-toggle="popover" title="Person Tagging Game" data-content="You earn only points by tagging real persons or characternames. By playing this game you enrich Dive with the data they really need!" data-original-title="Random Tagging"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>
		</div>
		<div id="personel-campaign" class="col-md-12"></div>

		<div class="col-md-12 headline">
			<span><i style="color:#712083" class="fa fa-street-view"></i> expert in GoT Locations!? <a style="cursor: pointer;" id="btn6"  data-toggle="popover" title="Location Tagging Game" data-content="You earn only points by tagging real locations or GoT Location names. We really want to know where all fragments took place so we can enrich Dive with new beautiful data!" data-original-title="Random Tagging"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>
		</div>
		<div id="location-campaign" class="col-md-12"></div>

		<div class="col-md-12 headline">
			<span><i class="fa fa-tag"></i> Random Tagging <a style="cursor: pointer;" id="btn2"  data-toggle="popover" title="Random Tagging" data-content="Choose a video, when the video is loaded, you can start entering tags what all describes what you see, hear and feel." data-original-title="Random Tagging"><i style="font-size:14px; color:grey;"class="fa fa-question-circle"></i></a><br></span>
		</div>
		<div id="channel1" class="col-md-12"></div>
	</div>

			<script type="text/javascript">
	 		$(document).ready(function() {
	 			/**
	 			 * call webservice to get the videos for RANDOM CHANNEL 1
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_videoslider?channel=s1&gameType=normal"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#channel1').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#channel1').html('Fail to get videos');
	 			});
	 			
	 			/**
	 			 * call webservice to get the videos for RAMPAGE - channel rampage
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_videoslider?gameType=rampage"
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
	 			 * call webservice to get the videos for CHANNEL 4
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_videoslider?channel=s2&gameType=event"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#event-campaign').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#event-campaign').html('Fail to get videos');
	 			});
	 			

	 			/**
	 			 * call webservice to get the videos for Person Tagging
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_videoslider?channel=s3&gameType=personel"
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
	 			 * call webservice to get the videos for Location Tagging
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_videoslider?channel=s4&gameType=location"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#location-campaign').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#location-campaign').html('Fail to get videos');
	 			});
	 			
	 		});
 		</script>

 		<script>
 		var $btn2 = $('#btn2');
		$btn2.data('state', 'hover');

		var enterShow = function () {
		    if ($btn2.data('state') === 'hover') {
		        $btn2.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn2.data('state') === 'hover') {
		        $btn2.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn2.data('state') === 'hover') {
		        $btn2.data('state', 'pinned');
		    } else {
		        $btn2.data('state', 'hover')
		        $btn.popover('hover');
		    }
		};

		$btn2.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);


		var $btn3 = $('#btn3');
		$btn3.data('state', 'hover');

		var enterShow = function () {
		    if ($btn3.data('state') === 'hover') {
		        $btn3.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn3.data('state') === 'hover') {
		        $btn3.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn3.data('state') === 'hover') {
		        $btn3.data('state', 'pinned');
		    } else {
		        $btn3.data('state', 'hover')
		        $btn.popover('hover');
		    }
		};

		$btn3.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);

		var $btn4 = $('#btn4');
		$btn4.data('state', 'hover');

		var enterShow = function () {
		    if ($btn4.data('state') === 'hover') {
		        $btn4.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn4.data('state') === 'hover') {
		        $btn4.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn4.data('state') === 'hover') {
		        $btn4.data('state', 'pinned');
		    } else {
		        $btn4.data('state', 'hover')
		        $btn.popover('hover');
		    }
		};

		$btn4.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);

		var $btn5 = $('#btn5');
		$btn5.data('state', 'hover');

		var enterShow = function () {
		    if ($btn5.data('state') === 'hover') {
		        $btn5.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn5.data('state') === 'hover') {
		        $btn5.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn5.data('state') === 'hover') {
		        $btn5.data('state', 'pinned');
		    } else {
		        $btn5.data('state', 'hover')
		        $btn.popover('hover');
		    }
		};

		$btn5.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);

		var $btn6 = $('#btn6');
		$btn6.data('state', 'hover');

		var enterShow = function () {
		    if ($btn6.data('state') === 'hover') {
		        $btn6.popover('show');
		    }
		};
		var exitHide = function () {
		    if ($btn6.data('state') === 'hover') {
		        $btn6.popover('hide');
		    }
		};

		var clickToggle = function () {
		    if ($btn6.data('state') === 'hover') {
		        $btn6.data('state', 'pinned');
		    } else {
		        $btn6.data('state', 'hover')
		        $btn.popover('hover');
		    }
		};

		$btn6.popover({trigger: 'manual'})
		    .on('mouseenter', enterShow)
		    .on('mouseleave', exitHide)
		    .on('click', clickToggle);
 		</script>
