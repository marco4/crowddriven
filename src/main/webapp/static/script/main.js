var Global = {
	easing: 'easeOutSine',
	animationDuration: 400
};

$(document).ready(function() {
	
	var loginContainer = $('#user-menu');
	
	/* user menu leave */
	$('#user-menu').on('mouseleave',function(event){
		if ($(loginContainer).is(':visible')){
			if (this.preventHideTimer){ return; }
			this.hideTimer = setTimeout(function(){
				$(loginContainer).velocity('stop').velocity('slideUp',{ duration: Global.animationDuration, queue: false,easing: Global.easing, });
			}.bind(this),1000);
		}
	}.bind(this));

	/* user menu leave */
	$('#user-menu').on('mouseenter',function(event){
		clearTimeout(this.hideTimer);
	}.bind(this));

	/* user menu leave */
	$('#user-menu').on('mousedown',function(event){
		this.preventHideTimer = true;
		clearTimeout(this.hideTimer);
		setTimeout(function(){ this.preventHideTimer = false; }, 2000);
	}.bind(this));
	
	
	
	/* user button hover */
	$('#user-button').on('mouseenter',function(event){
		if (!loginContainer.is(':visible')){
			clearTimeout(this.hideTimer);
			$(loginContainer).velocity('stop').velocity('slideDown',{ duration: Global.animationDuration, queue: false,easing: Global.easing, });
		}
	}.bind(this));

	
	
	/* user button clicked */
	$('#user-button').click(function(event){
		clearTimeout(this.hideTimer);
		if (loginContainer.is(':visible')){
			$(loginContainer).css('height','auto');
			$(loginContainer).velocity('stop').velocity('slideUp',{ duration: Global.animationDuration, queue: false,easing: Global.easing, });
		} else{
			$(loginContainer).css('height','auto');
			$(loginContainer).velocity('stop').velocity('slideDown',{ duration: Global.animationDuration, queue: false,easing: Global.easing, });
		}
		event.stopImmediatePropagation();
		return false;
	}.bind(this));
	
	
	
	/* help button clicked */
	$('#help-button').click(function(event){
		if ( !$('#help').hasClass('visible') ) {
			$('#help').addClass('visible').fadeTo(300,1);
		}
		
		event.stopImmediatePropagation();
		return false;
	});
	
	/* button Close help panel click */
	$('.top-help').click(function(event){
		if ($('#help').hasClass('visible')) {
			$('#help').removeClass('visible').fadeTo(300,0, function() { $(this).hide(); });
		}
		event.stopImmediatePropagation();
		return false;
	});
	
	
	/* signup */
	$(loginContainer).on('click','#signup', function() {
		// show register form
		var registerForm = $('#user-register');
			registerForm.show();
		
		$(loginContainer).html(registerForm);

		// activate checking for password
		document.getElementById("password").onchange = validatePassword;
		document.getElementById("re-password").onchange = validatePassword;
		
		
		return false;
	});
	
	/* when hyperlink has id Register activate register form */
	$('#register').on('click', function() {
		if (!loginContainer.is(':visible')){
			clearTimeout(this.hideTimer);
			$(loginContainer).velocity('stop').velocity('slideDown',{ duration: Global.animationDuration, queue: false,easing: Global.easing, });
		}
		
		// show register form
		var registerForm = $('#user-register');
			registerForm.show();
		
		$(loginContainer).html(registerForm);

		// activate checking for password
		document.getElementById("password").onchange = validatePassword;
		document.getElementById("re-password").onchange = validatePassword;
		
		return false;
	});
	
	/* when hyperlink has id log-in activate login form */
	$('#log-in').on('click', function() {
		clearTimeout(this.hideTimer);
		if (loginContainer.is(':visible')){
			$(loginContainer).css('height','auto');
			$(loginContainer).velocity('stop').velocity('slideUp',{ duration: Global.animationDuration, queue: false,easing: Global.easing, });
		} else{
			$(loginContainer).css('height','auto');
			$(loginContainer).velocity('stop').velocity('slideDown',{ duration: Global.animationDuration, queue: false,easing: Global.easing, });
		}

		return false;
	});

	/* forgot password */
	$(loginContainer).on('click','#forgot-password', function() {
		// show register form
		var forgotForm = $('#user-forgot-password');
			forgotForm.show();
		
		$(loginContainer).html(forgotForm);
		return false;
	});
	
	/* login form submit */
	$(loginContainer).on('submit','#user-login', function() {
		
	});
	
	
	/* login form submit */
	$(loginContainer).on('submit','#user-register', function() {
		
	});
	
});


function validateLogin() {

}

function validateRegister() {
	
}

function validatePassword() {
	var registerContainer = $('#user-register');
	var	password	= registerContainer.find('#password'),
		repassword	= registerContainer.find('#re-password');
	
	if (password.val() != repassword.val()) {
		document.getElementById("re-password").setCustomValidity("Passwords Don't Match");
	} else {
		document.getElementById("re-password").setCustomValidity('');
	}
}

function uploadFile(target) {
	$(target).parent().submit();
}


function loadpage() {
	
}