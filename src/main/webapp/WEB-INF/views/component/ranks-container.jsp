<style>
	.rankbox{
		display: block;
		min-width: 200px;
		min-height: 200px;
		padding: 5px;
	}
	.imgrank{
		width: 100%;
		max-width: 100%;
	}
	.rankboxinner{
		display: block;
		background-color: #333;
		padding:10px;
		border: 1px solid #444;
	}
	.rankboxdescription{
		display: block;
		color: #E6E6FA;
		background-color: #111;
		height: 100px;
		margin-top: 10px;
		text-align: left;
		line-height:20px;
		border: 1px solid #393939;
		box-shadow: 0px 0px 2px #000 inset;
	}
	.rankboxdescription>h2{
		display: block;
		font-size: 1.3em;
		margin: 10px 10px 0px;
		padding-bottom: 5px;
		font-weight: normal;
		color: #fff;
		text-shadow: 0px 0px 1px #FFF;
		border-bottom: 1px solid #666;
	}
	.rankboxdescription>span{
		display: block;
		font-size: 0.8em;
		margin: 10px 10px 10px 10px;
		padding-bottom: 20px;
		line-height: 20px;
		padding-top:5px;
		color: #fff;
		text-shadow: 0px 0px 1px #FFF;
	}
	/* centered columns styles */
	.row-centered {
	    text-align:center;
	}
	.col-centered {
	    display:inline-block;
	    float:none;
	    /* reset the text-align */
	    text-align:left;
	    /* inline-block space fix */
	    margin-right:-4px;
	}

</style>

<div class="row">

	<div style="margin-left:40px;"class="col-md-10 headline">
		<span><i class="fa fa-shield"></i>  Ranks</span>
		<p>A rank system is implemented in CrowDDriven Tag, the higher your score is, the higher your rank will be. Every player starts Unranked and is able to reach the highest rank: Khaleesi. Easier said than done, it takes a lot of effort and persistance to reach Khaleesi, do you have what it takes? When you are logged in, you can check which rank you already have earned in your <a href="/profilepage">profile page</a>. <br><br>Still don&apos;t have an account?  What are you waiting for, create one <a href="/registreren">here</a> right now and start earning you're first Rank! <br>&nbsp;</p>
	</div>
</div>

<div style="overflow:hidden; margin-left: 10px; margin-right: 10px;" class="row row-centered">
	<div class="col-md-12" >
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="Unranked">
				<img class="imgrank" src="/static/img/ranks/unranked.png" />
				<div class="rankboxdescription" >
					<h2>Unranked</h2><span>Required Points: 0</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="Ranger">
				<img class="imgrank" src="/static/img/ranks/ranger.png" />
				<div class="rankboxdescription">
						<h2>Ranger</h2><span>Required Points: 200</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="RangerII">
				<img class="imgrank" src="/static/img/ranks/ranger2.png" />
				<div class="rankboxdescription">
					<h2>Ranger II</h2><span>Required Points: 400</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="RangerIII">
				<img class="imgrank" src="/static/img/ranks/ranger3.png" />
				<div class="rankboxdescription">
					<h2>Ranger III</h2><span>Required Points: 800</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner">
				<img class="imgrank" src="/static/img/ranks/masterranger.png" />
				<div class="rankboxdescription" id="MasterRanger">
					<h2>Master Ranger</h2><span>Required Points: 1600</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="GoodMaster">
				<img class="imgrank" src="/static/img/ranks/goodmaster.png" />
				<div class="rankboxdescription">
					<h2>Good Master</h2><span>Required Points: 3200</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="FaithMilitant">
				<img class="imgrank" src="/static/img/ranks/faithmilitant.png" />
				<div class="rankboxdescription">
					<h2>Faith Militant</h2><span>Required Points : 6400</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="Unsullied">
				<img class="imgrank" src="/static/img/ranks/unsullied.png" />
				<div class="rankboxdescription">
						<h2>Unsullied</h2><span>Required Points : 12.800</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="Warden">
				<img class="imgrank" src="/static/img/ranks/warden.png" />
				<div class="rankboxdescription">
					<h2>Warden</h2><span>Required Points : 25.600</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="NightsWatch">
				<img class="imgrank" src="/static/img/ranks/nightswatch.png" />
				<div class="rankboxdescription">
					<h2>Nights Watch</h2><span>Required Points : 51.200</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="Knighthood">
				<img class="imgrank" src="/static/img/ranks/knighthood.png" />
				<div class="rankboxdescription">
					<h2>Knigthood</h2><span>Required Points : 102.400</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="Kingsguard">
				<img class="imgrank" src="/static/img/ranks/kingsguard.png" />
				<div class="rankboxdescription">
					<h2>Kingsguard</h2><span>Required Points : 204.800</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="TheKing">
				<img class="imgrank" src="/static/img/ranks/handoftheking.png" />
				<div class="rankboxdescription">
					<h2>The King</h2><span>Required Points : 405.600</span>
				</div>
			</div>
		</div>
		<div class="col-md-2 col-centered rankbox">
			<div class="rankboxinner" id="Khaleesi">
				<img class="imgrank" src="/static/img/ranks/khaleesi.png" />
				<div class="rankboxdescription">
					<h2>Khaleesi</h2><span>Required Points : 811.200</span>
				</div>
			</div>
		</div>

	</div>
</div>
<c:if test="${user.rank != null}">
	<script>
		$( document ).ready(function() {
			var rank = "${user.rank.title}";
			str = rank.replace(/\s+/g, '');
		    $('#' + str).css('background-color', '#6FB0DE');
		});
	</script>
</c:if>
