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
	#rampage-campaign, #focustitle {
    background-image: radial-gradient(#000 15%, transparent 16%), radial-gradient(#000 15%, transparent 16%), radial-gradient(rgba(255, 255, 255, 0.1) 15%, transparent 20%), radial-gradient(rgba(255, 255, 255, 0.1) 15%, transparent 20%);
    background-repeat: repeat, repeat, repeat, repeat;
    background-attachment: scroll, scroll, scroll, scroll;
    background-position: 0px 0px, 8px 8px, 0px 1px, 8px 9px;
    background-clip: border-box, border-box, border-box, border-box;
    background-origin: padding-box, padding-box, padding-box, padding-box;
    background-color: #282727;
    background-size: 16px 16px;

	}	

  </style>

  <div id="channels-slider-container" class="row">
		<div class="col-md-12 headline">
			<span><i class="fa fa-tag"></i> GoT game? Beat the high score!: <a style="cursor: pointer;" id="btn2"  data-toggle="popover" title="TAG video with the highest score" data-content="Many have tried, but few have succeeded. Try your hand at beating your friends and others by tagging as much and as correctly as you can." data-original-title="TAG video with the highest score"><i style="font-size:14px; color:grey;"class="fa fa-question-circle"></i></a><br></span>
			
		</div>
		<div id="highscore" class="col-md-12"></div>

	</div>

			<script type="text/javascript">
	 		$(window).load(function() {
	 	        $('#top-slider').nivoSlider();
	 	    });
	 		
	 		$(document).ready(function() {
	 			/**
	 			 * call webservice to get videos ordered by highscore descending
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_highscore-slider?gameType=normal"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#highscore').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#highscore').html('Fail to get videos');
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




 		</script>