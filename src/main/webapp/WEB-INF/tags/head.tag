<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ attribute name="title" required="true" type="java.lang.String" %>
<head>
	<title>${title} - CrowdDriven</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<meta name="description" content="CrowdDriven annotating video game on Game of Thrones Fragments."/>
	<meta name="keywords" content="spel, game, crowdsourcing, Game of Thrones, Vrije Universiteit Amsterdam, online video, gratis"/>
	<link rel="shortcut icon" href="/static/img/favicon-waisda.ico" />
	
	<!-- default styles -->
	<link href="/static/styles/css/styles.css" rel="stylesheet"/>
	<!-- load responsive.css if site has to scale at specific screensizes e.g. mobile or low-res screens -->
	<link href="/static/styles/css/jquery-ui.min.css" rel="stylesheet"/>
	<link href="/static/styles/css/responsive.css" rel="stylesheet"/>
  
	  <!--[if lt IE 9]>
		<link href="/static/styles/css/ie8andbelow.css" rel="stylesheet"/>

	  	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    	<script src="/static/script/lib/less.js"></script>
	  <![endif]-->
	  <!--[if lt IE 8]>
		<link href="/static/styles/css/ie7andbelow.css" rel="stylesheet"/>
	  <![endif]-->
    
	<script src="/static/script/lib/jquery-1.11.3.min.js"></script>
<!-- 	<script src="/static/script/lib/jquery.min.js"></script> -->
	<script src="/static/script/lib/jquery-ui.min.js"></script>
	<script src="/static/script/silverlight.js"></script>
	<script src="/static/script/plugins/jquery.equalheights.js"></script>
	<script src="/static/script/plugins/jquery.color.js"></script>

	<script src="/currentUser.js?dummy=<%= new java.util.Date().getTime() %>"></script>
	<script src="/static/script/global.js"></script>
	<script src="/static/script/games-queue.js"></script>
	<script src="https://base2.googlecode.com/svn/version/1.0.2/src/base2.js"></script>
	<script src="/static/mediaplayer-5.9/jwplayer.js"></script>
	<jsp:doBody/>
</head>
