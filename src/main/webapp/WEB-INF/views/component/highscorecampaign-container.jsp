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
	#channels-slider-container {
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
			<span ><i style="color:#840000"class="fa fa-bomb"></i> Rampage Game Campaign <a style="cursor: pointer;" id="btn3"  data-toggle="popover" title="Rampage game" data-content="Tag as much as possible to stretch the time over and over again. If you are not earned enough points on time, you will be Game over!" data-original-title="Random Tagging"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>
		</div>
		<div id="rampage-campaign" class="col-md-12"></div>

	</div>

			<script type="text/javascript">
	 		$(window).load(function() {
	 	        $('#top-slider').nivoSlider();
	 	    });
	 		
	 		$(document).ready(function() {
	
	 			
	 			/**
	 			 * call webservice to get the videos for RAMPAGE - channel rampage
	 			 */  
	 			$.ajax({
					method: "GET",
	 				url: "z_highscorecampaign?gameType=rampage"
	 			})
	 			.done(function( data ) {
	 				if (data) {
	 					$('#rampage-campaign').html(data);
	 				}
	 			})
	 			.fail(function(msg) {
	 				$('#rampage-campaign').html('Fail to get videos');
	 			});
	


	 			
	 			// SHOW NUMBER AS INSCREASING
	 			$('.spincrement').spincrement({
	 				from: 0.0,
	 				decimalPlaces: 0,
	 				duration: 20000,
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