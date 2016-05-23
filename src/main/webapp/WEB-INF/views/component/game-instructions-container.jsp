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

<%@ include file="instruction-menu-container.jsp" %>



<div id="instruction-content" style="overflow:hidden; margin-left: 10px; margin-right: 10px;" class="row row-centered">
	
	<%@ include file="gameplay-container.jsp" %>


</div>


<script>
	$(function() {
		debugger;
		
		$('.btn-instruction').on('click', function() {
			 var url = $(this).attr("data-item");
			 
			 $.ajax({
	    			method: "GET",
	    			url: url
    		 })
    		 .done(function( data ) {
    			if (data) {
    				$('#instruction-content').html(data);
    			}
    		 })
    		 .fail(function(msg) {
    			$('#instruction-content').html('Fail to load data');
    		 });
		 });
	});
</script>