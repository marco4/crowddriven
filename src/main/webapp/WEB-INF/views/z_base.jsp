
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="keywords" content="spel, game, crowdsourcing, Game of Thrones, Vrije Universiteit Amsterdam, online video, free"/>
<meta name="description" content="CrowdDriven annotating video game on Game of Thrones Fragments."/>
<title>CrowDDriven Tag</title>

<%@ include file="z_init.jsp"%>

<%-- <link href="${appBaseUrl}/static/styles/css/styles.css" rel="stylesheet" type="text/css"> --%>
<link href="${appBaseUrl}/static/styles/css/bootstrap.min.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/jquery-ui.min.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/my-slider.css" rel="stylesheet" />

<link href="${appBaseUrl}/static/styles/css/mainSlider.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/main.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/styleCDT.css" rel="stylesheet" />
<link href="${appBaseUrl}/static/styles/css/simple-sidebar.css" rel="stylesheet" />

<script src="${appBaseUrl}/static/script/lib/jquery-1.11.3.min.js"></script>
<script src="${appBaseUrl}/static/script/lib/jquery-ui.min.js"></script>
<script src="${appBaseUrl}/static/script/lib/bootstrap.min.js"></script>
<script src="${appBaseUrl}/static/script/ie10-viewport-bug-workaround.js"></script>
<script src="${appBaseUrl}/static/script/jquery.spincrement.js"></script>
<script src="${appBaseUrl}/static/script/jquery.nivo.slider.js"></script>


<script src="${appBaseUrl}/static/script/silverlight.js"></script>
<script src="${appBaseUrl}/static/script/plugins/jquery.equalheights.js"></script>
<script src="${appBaseUrl}/static/script/plugins/jquery.color.js"></script>
<script src="/currentUser.js?dummy=<%= new java.util.Date().getTime() %>"></script>
<script src="${appBaseUrl}/static/script/global.js"></script>
<script src="${appBaseUrl}/static/script/games-queue.js"></script>
<script src="https://base2.googlecode.com/svn/version/1.0.2/src/base2.js"></script>
<script src="${appBaseUrl}/static/mediaplayer-5.9/jwplayer.js"></script>
<script src="${appBaseUrl}/static/script/velocity.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" />


<script src="${appBaseUrl}/static/script/main.js"></script>


<script>
	jQuery("body").css('opacity', 0);
	var fadeInTimeout = setTimeout(function() {
		jQuery("body").animate({ 'opacity' : 1 }, 350);
	}, 1000);
</script>


    <script>
    $(window).load(function(){
		
		/**
		 * call webservice to get menu items working
		 */  
		 $('.change-item').click(function(){
		        var this_item = $(this).attr("data-item");
		        
		        $.ajax({
	    			method: "GET",
	    			url: this_item
	    		})
	    		.done(function( data ) {
	    			if (data) {
	    				$('#content-wrapper').html(data);
	    			}
	    		})
	    		.fail(function(msg) {
	    			$('#content-wrapper').html('Loading data...');
	    		});
		    });
		 
    });
    
    </script>
    <script>
    $(window).load(function(){
		var url = window.location.href;

		var pieces = url.split("?");

		//alert(pieces[2] + " = " + $.inArray("page=yes", pieces));

		if(pieces[1]){
			$.ajax({
				method: "GET",
				url: pieces[1]
			})
			.done(function( data ) {
				if (data) {
					$('#content-wrapper').html(data);
				}
			})
			.fail(function(msg) {
				$( "#homepage" ).trigger( "click" );
			});
		}
		
	});

	function myfunction(){
			$.ajax({
				method: "GET",
				url: pieces[1]
			})
			.done(function( data ) {
				if (data) {
					$('#content-wrapper').html(data);
				}
			})
			.fail(function(msg) {
				myfunction() ;
			});
	}

    </script>
    <script>
		var make_button_active = function()
		{
		  //Get item siblings
		  var siblings =($(this).siblings());

		  //Remove active class on all buttons
		  siblings.each(function (index)
		    {
		      $(this).removeClass('active');
		    }
		  )


		  //Add the clicked button class
		  $(this).addClass('active');
		}

		//Attach events to menu
		$(document).ready(
		  function()
		  {
		    $(".sidebar-nav li").click(make_button_active);
		  }  
		)
    </script>
</head>
<body>
	<!-- HEADER -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="http://crowddriven.nl">

				</a>
			</div>
				
				<!-- RIGHT LOGIN -->
				<ul class="nav navbar-nav pull-right is-sp">
					<li>
						<div id="user-button" title="Registered users"></div>
					</li>
					<li>
						<div id="help-button" title="Help"></div>					
					</li>
				</ul>
			</div>

		</div>
	</nav>

	
	<!-- // HEADER End -->

	<div id="main-container" class="container-fluid">
		<tiles:insertAttribute name="body" />
	</div>


    <!-- HELP -->
	<%@include file="component/login-container.jsp" %>
	
	
	<!-- HELP -->
	<%@include file="component/help-container.jsp" %>

</body>
</html>