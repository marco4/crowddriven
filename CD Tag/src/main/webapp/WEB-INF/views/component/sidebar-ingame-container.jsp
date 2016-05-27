<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<div id="wrapper">

<!-- Sidebar -->
<div id="sidebar-wrapper"style="overflow-y: auto;">
    <ul class="sidebar-nav">
        <a href="http://www.crowddriven.nl"><img width="300px" src="${appBaseUrl}/static/img/CDT-logo.jpg" alt="Crowddriven Tag Logo"></a>


        <li>
            <a href="/"><i class="fa fa-gamepad"></i> <span class="tabspace">Play <img style="bottom:10px;" height="30px;" src="${appBaseUrl}/static/img/tag-solo.png" /> Game</span></a>
        </li>
        <li>
            <a href="/?dive"><i class="fa fa-search"></i> <span class="tabspace">Explore <img style="bottom:10px;" height="30px;" src="${appBaseUrl}/static/img/dive-solo.png" /></span></a>
        </li>
        <li>
            <a href="/?profile"><i class="fa fa-user-plus"></i><span class="tabspace">Profile</a>
        </li>
        <li>
            <a href="?leaderbords"><i class="fa fa-sort-amount-desc"></i><span class="tabspace">Leaderbords</a>
        </li>
        <li>
            <a href="/?game-instructions"><i class="fa fa-info-circle"></i><span class="tabspace"> Instructions</a>
        </li>
    </ul>
    <div class="sidebar-statistics" style="overflow-y: auto;">
		
		<c:choose>
			
			<c:when test="${user == null || user.anonymous}">
				<h3 style="text-align:center; width: 300px;">Overall Statistics </h3>

					<p>With a lot of thanks to The Crowddriven-Community! Check the statistics below, we are making good progress but we need more annotated footage to enrich DIVE! </p>

				<table>
		            <tr>
		                <td width="15px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#5cbbf2;"><a href="/?gamesplayed"><span class="change-item" data-item="gamesplayed">GAMES PLAYED</span><br></a><span class="bignumber spincrement"><nf:format number="${globalStats.totalMatches}" /></span></td>
		                <td width="30px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#e64c65;"><a href="javascript:;"><span class="change-item" data-item="hoursplayed">HOURS PLAYED<br></span></a>
		                <span class="bignumber spincrement">
		                	<fmt:formatNumber type="number" value="${globalStats.totalHours / 3600000}" maxFractionDigits="0" pattern="###.###" />
		               	</span>
		            </tr>
		            <tr height="5px">
		                <td>&nbsp;</td>
		            </tr>
		            <tr>
		                <td width="15px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#fcb150;"><a href="javascript:;"><span class="change-item" data-item="divesearches">DIVE SEARCHES</span><br></a>
		                	<span class="bignumber spincrement">
		                		<fmt:formatNumber type="number" value="${globalStats.totalDiveSearches}" maxFractionDigits="0" pattern="###.###" />
		                	 </span>
		                	
		                </td>
		                <td width="30px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#11a8ab;"><a href="javascript:;"><span class="change-item" data-item="diveclicks">DIVE <BR>CLICKS</span><br>
		                </a><span class="bignumber spincrement">
		                		<fmt:formatNumber type="number" value="${globalStats.totalDiveClicks}" maxFractionDigits="0" pattern="###.###" />
		                	 </span>
		               	</td>
		                <td width="15px">&nbsp;</td>
		            </tr>
		            <tr height="5px">
		                <td>&nbsp;</td>
		            </tr>
		            <tr>
		                <td width="15px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#e64c65;"><a href="javascript:;"><span class="change-item" data-item="curatedtags">CURATED<br>TAGS<br></span></a>
		                	<span class="bignumber spincrement">
		                		<fmt:formatNumber type="number" value="${globalStats.totalDiveCurated}" maxFractionDigits="0" pattern="###.###" />
		                	 </span>
		                	
		                </td>
		                <td width="30px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#5cbbf2;"><a href="javascript:;"><span class="change-item" data-item="tagsadded">TAGS <BR>ADDED<br></span></a>
		                <span class="bignumber spincrement">
		                		<fmt:formatNumber type="number" value="${globalStats.totalTags}" maxFractionDigits="0" pattern="###.###" />
		                	 </span>
		               	</td>
		                <td width="15px">&nbsp;</td>
		            </tr>
				            <tr height="5px">
		                <td>&nbsp;</td>
		            </tr>
		         </table>
			</c:when>
			
			<c:otherwise>
					<h3 style="text-align:center; width: 300px;">${user.name}'s Statistics </h3>

					<p style="	text-align: justify;">What a job ${user.name}! Check your personal statistics below, You need to work on your rank! Do you know you can earn a lot of more badges by playing the different types of games? The profile page will give you more info about detailled statistics.</p>

				<table>
		            <tr>
		                <td width="15px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#5cbbf2;"><a href="javascript:;"><span class="change-item" data-item="gamesplayed">GAMES PLAYED</span></a><br>
		                	<span class="bignumber spincrement">
		                		<nf:format number="${user.totalMatches}" /></span> / 
		                		<span class="smallnumber spincrement">
		                			<nf:format number="${globalStats.totalMatches}" />
		                		</span></td></td>
		                <td width="30px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#e64c65;"><a href="javascript:;"><span class="change-item" data-item="hoursplayed">HOURS PLAYED<br></span></a>
		                	<span class="bignumber spincrement">
		                		<fmt:formatNumber type="number" value="${user.totalHours / 3600000}" maxFractionDigits="0" pattern="###.###" />
		                	</span>
		                		/
		                	<span class="smallnumber"><fmt:formatNumber type="number" value="${globalStats.totalHours / 3600000}" maxFractionDigits="0" pattern="###.###" />
		                	 </span>
		                	
		                </td>
		                <td width="15px">&nbsp;</td>
		            </tr>

		            <tr height="5px">
		                <td>&nbsp;</td>
		            </tr>
		            <tr>
		                <td width="15px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#fcb150;"><a href="javascript:;"><span class="change-item" data-item="divesearches">DIVE SEARCHES</span><br></a>
		                	<span class="bignumber spincrement">
		                		<fmt:formatNumber type="number" value="${globalStats.totalDiveSearches}" maxFractionDigits="0" pattern="###.###" />
		                	 </span>
		                	
		                </td>
		                <td width="30px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#11a8ab;"><a href="javascript:;"><span class="change-item" data-item="diveclicks">DIVE <BR>CLICKS</span><br>
		                </a><span class="bignumber spincrement">
		                		<fmt:formatNumber type="number" value="${globalStats.totalDiveClicks}" maxFractionDigits="0" pattern="###.###" />
		                	 </span>
		               	</td>
		                <td width="15px">&nbsp;</td>
		            </tr>
		            <tr height="5px">
		                <td>&nbsp;</td>
		            </tr>
		            <tr>
		                <td width="15px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#e64c65;"><a href="javascript:;"><span class="change-item" data-item="curatedtags">CURATED<br>TAGS<br></span></a>
		                	<span class="bignumber spincrement">
		                		<fmt:formatNumber type="number" value="${globalStats.totalDiveCurated}" maxFractionDigits="0" pattern="###.###" />
		                	 </span>
		                	
		                </td>
		                <td width="30px">&nbsp;</td>
		                <td class="statfont" width="120px" height="120px" style="background-color:#5cbbf2;"><a href="javascript:;"><span class="change-item" data-item="tagsadded">TAGS <BR>ADDED<br></span></a>
		                <span class="bignumber spincrement">
		                		<span class="bignumber spincrement"><fmt:formatNumber type="number" value="${user.totalTags}" maxFractionDigits="0" pattern="###.###" /> </span> /
		                		<span class="smallnumber spincrement"><fmt:formatNumber type="number" value="${globalStats.totalTags}" maxFractionDigits="0" pattern="###.###" /> </span>
		                	 </span>
		               	</td>
		                <td width="15px">&nbsp;</td>
		            </tr>
				    <tr height="5px">
		                <td>&nbsp;</td>
		            </tr>
		         </table>
			</c:otherwise>
		</c:choose>

         
    </div>

</div>
