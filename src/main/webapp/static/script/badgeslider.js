$(function() {
	/**
	* navR,navL are flags for controlling the albums navigation
	* first gives us the position of the album on the left
	* positions are the left positions for each of the 5 albums displayed at a time
	*/
    var navR,navL	= false;
	var first		= 1;
	var positions 	= {
		'0'		: 0,
		'1' 	: 240,
		'2' 	: 480,
		'3' 	: 720,
		'4' 	: 960
	}
	var $ps_albums 		= $('#ps_albums');
	/**
	* number of albums available
	*/
	var elems			= $ps_albums.children().length;
	var $ps_slider		= $('#ps_slider');
	
	/**
	* let's position all the albums on the right side of the window
	*/
	var hiddenRight 	= $(window).width() - $ps_albums.offset().left;
	$ps_albums.children('div').css('left',hiddenRight + 'px');
	
	/**
	* move the first 5 albums to the viewport
	*/
	$ps_albums.children('div:lt(5)').each(
		function(i){
			var $elem = $(this);
			$elem.animate({'left': positions[i] + 'px','opacity':1},800,function(){
				if(elems > 5)
					enableNavRight();
			});
		}
	);
	
	/**
	* next album
	*/
	$ps_slider.find('.next').bind('click',function(){
		if(!$ps_albums.children('div:nth-child('+parseInt(first+5)+')').length || !navR) return;
		disableNavRight();
		disableNavLeft();
		moveRight();
	});
	
	/**
	* we move the first album (the one on the left) to the left side of the window
	* the next 4 albums slide one position, and finally the next one in the list
	* slides in, to fill the space of the first one
	*/
	function moveRight () {
		var hiddenLeft 	= $ps_albums.offset().left + 163;
		
		var cnt = 0;
		$ps_albums.children('div:nth-child('+first+')').animate({'left': - hiddenLeft + 'px','opacity':0},500,function(){
				var $this = $(this);
				$ps_albums.children('div').slice(first,parseInt(first+4)).each(
					function(i){
						var $elem = $(this);
						$elem.animate({'left': positions[i] + 'px'},800,function(){
							++cnt;
							if(cnt == 4){
								$ps_albums.children('div:nth-child('+parseInt(first+5)+')').animate({'left': positions[cnt] + 'px','opacity':1},500,function(){
									//$this.hide();
									++first;
									if(parseInt(first + 4) < elems)
										enableNavRight();
									enableNavLeft();
								});
							}		
						});
					}
				);		
		});
	}
	
	/**
	* previous album
	*/
	$ps_slider.find('.prev').bind('click',function(){
		if(first==1  || !navL) return;
		disableNavRight();
		disableNavLeft();
		moveLeft();
	});
	
	function moveLeft () {
		var hiddenRight 	= $(window).width() - $ps_albums.offset().left;
	
		var cnt = 0;
		var last= first+4;
		$ps_albums.children('div:nth-child('+last+')').animate({'left': hiddenRight + 'px','opacity':0},500,function(){
				var $this = $(this);
				$ps_albums.children('div').slice(parseInt(last-5),parseInt(last-1)).each(
					function(i){
						var $elem = $(this);
						$elem.animate({'left': positions[i+1] + 'px'},800,function(){
							++cnt;
							if(cnt == 4){
								$ps_albums.children('div:nth-child('+parseInt(last-5)+')').animate({'left': positions[0] + 'px','opacity':1},500,function(){
									//$this.hide();
									--first;
									enableNavRight();
									if(first > 1)
										enableNavLeft();
								});
							}										
						});
					}
				);
		});
	}
	
	/**
	* disable or enable albums navigation
	*/
	function disableNavRight () {
		navR = false;
		$ps_slider.find('.next').addClass('disabled');
	}
	function disableNavLeft () {
		navL = false;
		$ps_slider.find('.prev').addClass('disabled');
	}
	function enableNavRight () {
		navR = true;
		$ps_slider.find('.next').removeClass('disabled');
	}
	function enableNavLeft () {
		navL = true;
		$ps_slider.find('.prev').removeClass('disabled');
	}		
	
	var $ps_container 	= $('#ps_container');
	var $ps_overlay 	= $('#ps_overlay');
	var $ps_close		= $('#ps_close');

});