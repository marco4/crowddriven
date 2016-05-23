<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>

<script src="${appBaseUrl}/static/script/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.func.js"></script>
<style>.navbar {display:none}
#search-field {
	padding: 10px 10px 10px 50px;
	border-radius: 25px;
	font-size: 1.2em;
	height: 40px;
	width: 250px;
	border: 0px none;
	outline: 0px none;
	background-image: url("http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/img/icon-search.png");
	background-size: 22px 22px;
	background-repeat: no-repeat;
	background-position: 15px center;
	margin-right: auto;
	margin-bottom: 30px;
	margin-left: auto;
	margin-top: 50px !important;
	display: block;
	color: #000 !important;
}
</style>


<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="body">
    	<div style="50px;" >
    		<input id="search-field" style="color:#000;">  </input>
    	</div>
      	<div id="channels-slider-container" class="row">

	    	<div class="col-md-12 headline">
				<span ><i style="color:#840000"class="fa fa-tint"></i> Game of Thrones' bloodiest events <a style="cursor: pointer;" id="btn5"  data-toggle="popover" title="Main events" data-content="Some of the most discussed events in TV history! Check these cards out and share them with your friends" data-original-title="Main events"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>
			</div>
 			<%@include file="component/diverow-container.jsp" %>

	    	<div class="col-md-12 headline">
				<span ><i style="color:#FDD017"class="fa fa-user"></i> Familiar faces and places: <a style="cursor: pointer;" id="btn3"  data-toggle="popover" title="Most popular DIVE persons and places" data-content="The night is dark and full of terrors, so here a few familiar faces and places you might recognize from the show. Share them with your friends, don’t be stingy" data-original-title="Most popular DIVE persons and places"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>
			</div>
 			<%@include file="component/diverow-container1.jsp" %>

 			<div class="col-md-12 headline">
				<span ><i style="color:#fff"class="fa fa-check-square-o "></i> Fresh from TAG! Check 'm out: <a style="cursor: pointer;" id="btn4"  data-toggle="popover" data-content="You know nothing, Jon Snow. But what you DO know you could put to good use by checking out these video entities that came from TAG and see if they contain the correct information" data-original-title="Describe/verify video entities from tag"><i style="color: grey; font-size:14px;"class="fa fa-question-circle"></i></a></span>
			</div>
 			<%@include file="component/diverow-container2.jsp" %>
        <!-- /#sidebar-wrapper -->
 			<%@ include file="component/dive-campaign-container.jsp" %>
 		<!-- End Top Slider -->
 		</div>
 
 		
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.thumbGallery.min.js"></script>
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.prettyPhoto.js" charset="utf-8"></script> 
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
<script>

	$('input').bind("enterKey",function(e){
		var query = $('#search-field').val();
		var url = 'http://ec2-52-28-200-8.eu-central-1.compute.amazonaws.com/dive/web/app_dev.php?q=' + query;
		location.href = url;
		//alert(url);
	});
	$('input').keyup(function(e){
		if(e.keyCode == 13){
	  		$(this).trigger("enterKey");
		}
	});
</script>
 
    </tiles:putAttribute>
</tiles:insertDefinition>