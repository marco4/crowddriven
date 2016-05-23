<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<%@ attribute name="dynamic" required="true" %>
<div id="games-queue" class="game-queue ${dynamic == 'true' ? 'dynamic' : 'col'}">
	<header class="header rich"><h2 style="margin-left: 10px !important;" class="h3 reset">Join now <small>(<span id="games-queue-count">0 games</span>)</small></h2></header>
	<section class="reset">
		<!-- Als game-queue class="empty" heeft verschijnt de onderstaande boodschap en wordt de tabel verborgen -->
		<p class="box-inner show" style="color: #000; font-size: 12px;">Currently there are no games to join. <br>Start one yourself by selecting one of the channels on the <a href="/">homepage</a> .</p>
		<div class="hide">
			<div class="row box-inner">
				<h3 style="color:#000; margin-left: 15px !important;" class="h5 pull-left">Click to select a game</h3>
				<h3 style="color:#000; margin-right: 15px;" class="h5 pull-right">Starts in</h3>
			</div>
			<div class="scroll-box bordered">
				<table class="table table-condensed-ext table-striped table-clean"></table>
			</div>
		</div>
	</section>
	
</div>	
