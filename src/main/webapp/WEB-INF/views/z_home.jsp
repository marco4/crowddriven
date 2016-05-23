<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="nf" uri="/WEB-INF/tld/NumberFormat.tld"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tt"%>

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
	<c:choose>
		<c:when test="${isLogged != null && isLogged}">
			<%@ include file="component/profiel-container.jsp" %>
		
		</c:when>
		<c:when test="${isNotLogged != null && isNotLogged}">
			<%@ include file="component/loginwrong-container.jsp" %>
		
		</c:when>		
		<c:otherwise>
			<%@ include file="component/home-container.jsp" %>
		
		</c:otherwise>
	
	</c:choose>
	
</div>


 
 		
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.thumbGallery.min.js"></script>
		<script type="text/javascript" src="${appBaseUrl}/static/script/jsVideoSlider/jquery.prettyPhoto.js" charset="utf-8"></script> 
 
 	<tt:games-queue dynamic="true"/>
 
    </tiles:putAttribute>
</tiles:insertDefinition>