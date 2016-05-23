<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tt" %>

<tt:html>
<tt:head title="STATS VIDEO PER TAG">
<style>
	pre {
	  white-space: pre-wrap;
	  word-wrap: break-word;
	  -moz-control-character-visibility: visible;
	}
</style>

</tt:head>
<tt:body pageName="tag" cssClass="body">

<h1>OUTPUT TTL - TAGS PER VIDEO</h1>
<h2>DESCENDING COUNT OF TAGS PER VIDEO</h2>



<c:forEach items="${tagEntryStats.videoStats}" var="vs">
	<pre>entity: ${vs.video.fragmentID}
	 a dive:Video ;
	 dive:placeholder &lt;${vs.video.imageUrl}&gt;; 
	 dive:relatedActor entity:<!--gotw-ficloc-BeyondtheWall ,
	     entity:gotw-ficloc-KingsLanding ,
	     entity:gotw-ficloc-Winterfell ,
	     entity:gotw-ficper-Gared , 
	     entity:gotw-ficper-WhiteWalker , 
	     entity:gotw-ficper-Wildlinggirl ,
	     entity:gotw-ficper-Will ; !-->
	 dive:source &lt;${vs.video.sourceUrl}&gt;; 
	 dcterms:description: <!--"Winter is coming (Winter is coming)\nEpisode no.: Season 1 Episode 1\nDirected By: Tim van Patten\nWritten by: David Benioff & D.B. Weiss\nFeatured music: Ramin Djawadi\nOriginal air date: April 17 2011\nRunning Time: 62 minutes" ;!-->
	 rdfs:label "${vs.video.title}"@nl . 
	 dive:tags "<c:forEach items="${vs.topTags}" var="topTag" varStatus="topTagStatus">${topTag}<c:if test="${topTagStatus.index < fn:length(vs.topTags) - 1}">, </c:if></c:forEach>" </pre>
<br> <br>
</c:forEach>


</tt:body>
</tt:html>