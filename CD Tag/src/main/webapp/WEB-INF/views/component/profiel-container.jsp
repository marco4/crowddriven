<%@page import="java.util.Map"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>

<c:choose>

	<c:when test="${user == null || user.anonymous}">
	<div>
		<div class="col-md-3">&nbsp;</div>
		<div overflow="hidden" scroll="no" class="col-md-6">
			<p>Currently you are playing anonymous.<br> Please register below and start saving your score, earn badges and ranks with your own personal statistics.</p>
			<div style="overflow:hidden;" scroll="no" id="registerss" class="col-md-12"></div>
		</div>
	</div>
		<script type="text/javascript">
			$(document).ready(function() {
				/**
				 * call webservice to get the videos for RANDOM CHANNEL 1
				 */  
				$.ajax({
				method: "GET",
					url: "/registreren"
				})
				.done(function( data ) {
					if (data) {
						$('#registerss').html(data);
					}
				})
				.fail(function(msg) {
					$('#registerss').html('Fail to get Profile information');
				});
			});
		</script>	
	</c:when>
	<c:otherwise>
	 		<div id="profileid" class="col-md-12"></div>

			<script type="text/javascript">
				$(document).ready(function() {
					/**
					 * call webservice to get the videos for RANDOM CHANNEL 1
					 */  
					$.ajax({
					method: "GET",
						url: "/profiel/${user.id}/"
					})
					.done(function( data ) {
						if (data) {
							$('#profileid').html(data);
						}
					})
					.fail(function(msg) {
						$('#profileid').html('Fail to get Profile information');
					});
				});
			</script>	
	 </c:otherwise>
</c:choose>
