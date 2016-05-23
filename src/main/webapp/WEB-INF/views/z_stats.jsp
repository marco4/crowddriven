<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="${appBaseUrl}/static/script/lib/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.func.js"></script>

<style>
.games-queue {
	z-index: 55000;
}
.game-queue table h4 {
    line-height: 24px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: 160px;
}
.game-queue table * {
    cursor: pointer;
   	color: #000;
}


img.bordered {

    border: 1px solid #999;

}
.game-queue table * {

    cursor: pointer;

}
table .span1 {

    float: none;
    width: 80px;
    margin-left: 0px;

}
.span1 {
    width: 100px;
}

table .span {
    float: none;
    width: 80px;
    margin-left: 0px;

}
.span {
    width: 100px;
}

[class*="span"] {

    float: left;
    margin-left: 20px;

}
.span1 {

    width: 60px;

}
		 .table-striped > tbody > tr:nth-child(2n+1) > td, .table-striped > tbody > tr:nth-child(2n+1) > th {
		   background-color: #d5d3d4;
		   color: #000;
		}

img {

    max-width: 100%;
    vertical-align: middle;
    border: 0px none;

}
a {

    color: #08C;

}
.table th, .table td {

    line-height: 18px;
    text-align: left;

}

		.box {
			clear:both;
			margin-top:0px;
			margin-bottom: 25px;
			padding: 0px;
		}

</style>

<tiles:insertDefinition name="baseLayout">
    <tiles:putAttribute name="body">
 		
 		<%@ include file="component/sidebar-container.jsp" %>
 	

        <!-- /#sidebar-wrapper -->
 		<%@ include file="component/top-slider-container.jsp" %>
 		<!-- End Top Slider -->

	<!-- AddThis Button BEGIN -->
	<div class="row" style="margin:0px; margin-right:10px;">
		<div class="col-md-8">
			<p class="online">
				<strong>${globalStats.currentlyPlaying} ${globalStats.currentlyPlaying == 1 ? 'player' : 'players'}</strong> currently online

			</p>
		</div>
		<div class="col-md-4">
			<div style="margin-top:10px; margin-right:10px;" class="addthis_default_style pull-right spaced-bottom"
				addthis:url="${staticModel.socialReferenceHome}"
		    	addthis:title="${staticModel.socialReferenceTitle}"
				addthis:description="${staticModel.socialReferenceDescription}">
				<a class="addthis_button_preferred_1"></a>
				<a class="addthis_button_preferred_2"></a>
				<a class="addthis_button_preferred_3"></a>
				<a class="addthis_button_preferred_4"></a>
				<a class="addthis_button_compact"></a>
				<a class="addthis_counter addthis_bubble_style"></a>
			</div>
		</div>	
	</div>

<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-55bfd5c53c9fb06f" async="async"></script>

<div id="content-wrapper">
	<h1>Statistics</h1>
	<p> - only accessible with admin permissions -  </p>
	<div class="col-md-4">
	    <div class="box well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
			<div class="bordered">
				<h2><i class="fa fa-user"></i> Users </h2>
				<table class="table table-condensed table-striped table-clean">
					<tr><td>Total Users </td><td> <strong><nf:format number="${globalStats.totalUsers}" /></strong></td></tr>
					<tr><td>Registered Users </td><td> <strong><nf:format number="${globalStats.totalRegisteredUsers}" /></strong></td></tr>
					<tr><td>Anonymous Users </td><td> <strong><nf:format number="${globalStats.totalUsers - globalStats.totalRegisteredUsers}" /></strong></td></tr>
					<tr><td>Returning Users </td><td> <strong><nf:format number="${globalStats.totalUsers - globalStats.totalRegisteredUsers}" /></strong></td></tr>	
		    	</table>
		    </div>
	   	</div>
	</div>
	<div class="col-md-4">
	    <div class="box well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
			<div class="bordered">
				<h2><i class="fa fa-tags"></i> Tags </h2>
				<table class="table table-condensed table-striped table-clean">
			    	<tr><td><i class="fa fa-tag"></i> Total tags: </td><td><strong><nf:format number="${globalStats.totalTags}" /></strong></td></tr>
			    	<tr><td><i class="fa fa-tag"></i> Total unique normalized tags: </td><td><strong><nf:format number="${globalStats.totalUniqueTags}" /></strong></td></tr>
			    	<tr><td><i class="fa fa-tags"></i> Total unmatched tags: </td><td><nf:format number="${globalStats.totalUnmatchedTags}" /></td></tr>			
			    	<tr><td><i class="fa fa-tags"></i> Total matched tags: </td><td><nf:format number="${globalStats.totalMatchedTags}" /></td></tr>
			    	<tr><td><i class="fa fa-flag"></i> Total pioneer tags: </td><td><nf:format number="${globalStats.totalPioneerTags}" /></td></tr>	
			    	<tr><td><i class="fa fa-book"></i> Total dictionary tags: </td><td><nf:format number="${globalStats.totalDictionaryTags}" /> </td></tr>			    	
			    	<tr><td> &nbsp;  - &nbsp; <i class="fa fa-map-marker"></i> Total real location tags: </td><td><nf:format number="${globalStats.totalRealLocationTags}" /> </td></tr>
			    	<tr><td> &nbsp;  - &nbsp; <i class="fa fa-map-o"></i> Total fictional location tags: </td><td><nf:format number="${globalStats.totalFictionalLocationTags}" /> </td></tr>
			    	<tr><td> &nbsp;  - &nbsp; <i class="fa fa-calendar"></i> Total event tags: </td><td><nf:format number="${globalStats.totalEventTags}" /> </td></tr>
			    	<tr><td> &nbsp;  - &nbsp; <i class="fa fa-user"></i> Total fictional person tags: </td><td><nf:format number="${globalStats.totalFictionalPersonTags}" /> </td></tr>
			    	<tr><td> &nbsp;  - &nbsp; <i class="fa fa-user-secret"></i> Total real person tags: </td><td><nf:format number="${globalStats.totalRealPersonTags}" /> </td></tr>
		    	</table>
		    </div>
	   	</div>
	</div>
	<div class="col-md-4">
	    <div class="box well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
			<div class="bordered">
				<h2><i class="fa fa-clock-o"></i> Time </h2>
				<table class="table table-condensed table-striped table-clean">

					<tr><td>Total hours played </td><td> <strong><fmt:formatNumber type="number" value="${globalStats.totalHours / 3600000}" maxFractionDigits="3" pattern="###.###" /></strong></td></tr>
					<tr><td>Registered Users </td><td> <strong><nf:format number="${globalStats.totalRegisteredUsers}" /></strong></td></tr>
					<tr><td>Anonymous Users </td><td> <strong><nf:format number="${globalStats.totalUsers - globalStats.totalRegisteredUsers}" /></strong></td></tr>		

		    	</table>
		    </div>
	   	</div>
	</div>	
	<div class="col-md-4">
	    <div class="box well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
			<div class="bordered">
				<h2><i class="fa fa-video-camera"></i> Videos </h2>
				<table class="table table-condensed table-striped table-clean">

					<tr><td>Total Users </td><td> <strong><nf:format number="${globalStats.totalUsers}" /></strong></td></tr>
					<tr><td>Registered Users </td><td> <strong><nf:format number="${globalStats.totalRegisteredUsers}" /></strong></td></tr>
					<tr><td>Anonymous Users </td><td> <strong><nf:format number="${globalStats.totalUsers - globalStats.totalRegisteredUsers}" /></strong></td></tr>		
		    	</table>
		    </div>
	   	</div>
	</div>
	<div class="col-md-4">
	    <div class="box well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
			<div class="bordered">
				<h2><i class="fa fa-gamepad"></i> Games </h2>
				<table class="table table-condensed table-striped table-clean">

					<tr><td>Total Games </td><td> <strong><nf:format number="${globalStats.totalMatches}" /></strong></td></tr>
					<tr><td>Registered Users </td><td> <strong><nf:format number="${globalStats.totalRegisteredUsers}" /></strong></td></tr>
					<tr><td>Anonymous Users </td><td> <strong><nf:format number="${globalStats.totalUsers - globalStats.totalRegisteredUsers}" /></strong></td></tr>		
		    	</table>
		    </div>
	   	</div>
	</div>
	<div class="col-md-4">
	    <div class="box well panel panel-default" style="background-color: #272727;color: #d5d3d4; ">
			<div class="bordered">
				<h2><i class="fa fa-calculator"></i> Averages</h2>
				<table class="table table-condensed table-striped table-clean">
					<tr><td>Total Users </td><td> <strong><nf:format number="${globalStats.totalUsers}" /></strong></td></tr>
					<tr><td>Registered Users </td><td> <strong><nf:format number="${globalStats.totalRegisteredUsers}" /></strong></td></tr>
					<tr><td>Anonymous Users </td><td> <strong><nf:format number="${globalStats.totalUsers - globalStats.totalRegisteredUsers}" /></strong></td></tr>					
			    	<tr><td>Total Tags: </td><td><strong><nf:format number="${globalStats.totalTags}" /></strong></td></tr>
			    	<tr><td>Total Matches: </td><td><nf:format number="${globalStats.totalMatches}" /> </td></tr>
			    	<tr><td>Average Tag per match: </td><td><fmt:formatNumber type="number" value="${globalStats.totalTags/globalStats.totalMatches}" maxFractionDigits="3" pattern="###.###" /></td></tr>

		    	</table>
		    </div>
	   	</div>
	</div>
</div>


 
 		
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.thumbGallery.min.js"></script>
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.prettyPhoto.js" charset="utf-8"></script> 
 
 	<tt:games-queue dynamic="true"/>
 
    </tiles:putAttribute>
</tiles:insertDefinition>