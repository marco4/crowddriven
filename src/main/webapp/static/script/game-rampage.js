var progress;

var Game = base2.Base.extend({
	
	videoplayer: null,
	startTime: null,
	duration: null,
	gameId: null,
	history: null,
	scoreboard: null,
	updateIntervalId: null,
	beenPlaying: false,
	lastKnownUserId: CurrentUser.id,
	gameType: null,
	remainingTime: 0,

	
	constructor: function(gameId, video, startTime, gameType) {
		this.gameId = gameId;
		this.startTime = startTime;
		this.duration = video.duration;
		this.loadTime = new Date().getTime();
		this.gameType = gameType;
		this.history = new TaggingHistory();
		this.scoreboard = new Scoreboard();

		if (video.playerType == 'NPO') {
			var playerArgs = {
				fragmentID: video.fragmentId,
				startTimeWithinEpisode: video.startTimeWithinEpisode,
				duration: video.duration,
				startTime: startTime
			};
			this.videoplayer = new NPOPlayer('video', playerArgs);
		} else if (video.playerType == 'JW') {
			this.videoplayer = new JWPlayer('video', video.imageUrl, video.sourceUrl);
		}

		if (this.videoplayer != null) {
			this.updateIntervalId = setTimeout(jQuery.proxy(this.update, this), 1000);
			this.initVideoPlayer();
		}
		
	},
	
	initVideoPlayer: function()
	{
		var realElapsed = this.getRealTimeElapsed();

		if (this.startTime > this.duration) {
			// The page was loaded after the game had already ended.
			this.endGame();
//				this.update();
		} else if (realElapsed >= 0) {
			this.setIntroText('<small>Game starts...</small>');
			jQuery('#vid-overlay-screen').addClass('compact-overlay');
			jQuery('#gameCanvas .outside').removeClass('outside');
			jQuery('#playerList').attr('class','container clear-both spaced-top');
			jQuery('#playerList').attr('style','');
			jQuery('#playerList ul').attr('class','clear-both unstyled horizontal row');
			jQuery('#playerList').insertAfter(jQuery('#rightColumn'));
			jQuery('.equal-cols-game').equalHeights('.col-game');
			jQuery('#inputBar').show();

			setTimeout(jQuery.proxy(function() {
                this.videoplayer.addEvent("tick", jQuery.proxy(this.onVideoTick, this));
                this.videoplayer.addEvent("fragmentEnd", jQuery.proxy(this.endGame, this));

				this.videoplayer.play();

				jQuery("#inputField").keydown(jQuery.proxy(this.addTag, this));
				jQuery("#inputField").keydown(jQuery.proxy(this.setStartTime, this));
			}, this), 100); // Deze delay is een fix voor een bug in IE7/8
			
			// create progress bar
			progress = jQuery( "#progress-container #progressbar" );
			var progressLabel = jQuery( "#progressbar .progress-label" );
			
			progress.progressbar({
		      value: 0,
		      max: 10,
		      create: function() {
		    	  progressLabel.text( progress.progressbar('option', 'max') + ' points left ' );
		      },
		      /*change: function() {
		        progressLabel.text( progress.progressbar( 'value' ) + ' points' );
		      },*/
		      complete: function() {
		    	  
		    	  game.duration = game.duration * 2;
//		    	  game.remainingTime = game.duration
		    	  
		    	  progress.progressbar('value', 0);
		    	  progress.progressbar('option', 'max', progress.progressbar('option', 'max') + 25);
		    	  progressLabel.text( progress.progressbar('option', 'max') + ' points left ' );
		      }
		    });
			
//			progress.progressbar('option', 'max', 25);
			
		} else {
			this.updateQueueTime(realElapsed);
			setTimeout(jQuery.proxy(this.initVideoPlayer, this), 100);
		}
	},
	
	getRealTimeElapsed: function() {
		var supposedVideoStartTime = this.loadTime - this.startTime;
		var now = new Date().getTime();
		return now - supposedVideoStartTime;
	},
	
	updateQueueTime: function(realElapsed) {
		if (realElapsed < 0) {
			var pretty = Utils.prettyPrintTime(-realElapsed);
			this.setIntroText('<small>Game starts in</small><strong>' + pretty + '</strong>');
		}
	},
	
	setRemainingText: function(s) {
		if (jQuery("#timer-remaining").html() != s) {
			jQuery("#timer-remaining").html(s);
		}
	},
	setIntroText: function(s) {
		if (jQuery("#timer-intro").html() != s) {
			jQuery("#timer-intro").html(s);
		}
	},
	
	update: function() {
		var elapsed = this.videoplayer.getElapsed();
		
		if (elapsed > 0) {
			this.beenPlaying = true;
		}
		
		if (elapsed == 0 && this.beenPlaying) {
			// The videoplayer has reached the end of the video and jumped back to elaped = 0. The game is over.
//			this.endGame();
		} else {
			var elapsed = this.videoplayer.getElapsed();
			if (!elapsed) {
				elapsed = 0;
			}
			var url = "/game/" + this.gameId + "/update/" + elapsed;
			jQuery.ajax(url, {
				success: jQuery.proxy(function(responseJSON) {
					if (!responseJSON) {
						return;
					}
					if (responseJSON.state == "ENDED") {
						this.endGame();
					} else {
						this.history.update(responseJSON.tagEntries, this.videoplayer.getElapsed());
						if (jQuery('#playerSessionScore')) {
							jQuery('#playerSessionScore').html(responseJSON.gameScore);
						}
						
						this.lastKnownUserId = responseJSON.ownId;
						this.scoreboard.update(responseJSON.students, responseJSON.ownId);

						this.updateIntervalId = setTimeout(jQuery.proxy(this.update, this), 1000);
					}
				}, this)
			});
		}
	},
	
	cleanTag: function(tagName)
	{
		return tagName.trim().replace(/\s+/g, " ");
	},
	
	isValidTag: function(tagName) {
		return tagName;
	},
	
	setStartTime: function(evt) {
		if (evt.keyCode != 13 && evt.target.value.length == 0)
			this.tagStartTime = this.videoplayer.getElapsed();
	},
	
	addTag: function(evt) {
		if (evt.keyCode == 13) {
			var tagName = this.cleanTag(evt.target.value);
			var time = this.videoplayer.getElapsed();
			// store tag if not already added
			if (this.isValidTag(tagName)) {
				jQuery.ajax("/tag-entry", {
					type: "POST",
					success:
						jQuery.proxy(function(tagEntryJson) {
							// add tag to history
							if (tagEntryJson) {
								this.history.update([tagEntryJson]);
								progress.progressbar('value', progress.progressbar("value") + tagEntryJson.score);
							}
						}, this),
					data:
						{
							tag: tagName,
							gameTime: time,
							typingDuration: time - this.tagStartTime,
							'game.id': this.gameId,
							gameType: this.gameType
						}
				});
			}
		}
		if (evt.keyCode == 27 || evt.keyCode == 13)
			document.getElementById("inputField").value = "";
	},
	
	onVideoTick: function(elapsed, duration) {
		// update view
		if (elapsed > 0 || !this.beenPlaying) {
			if ( !this.duration ) {
				this.duration = (duration / 4);
			}
			this.remainingTime = this.duration - elapsed;
			
			if (this.remainingTime < 0) {
				this.endGame();
			}
			
			// show time remaining
			var prettyRemaining = '<small>Time left </small><strong>' + Utils.prettyPrintTime(this.remainingTime) + '</strong>';
			if (jQuery("#timer-remaining").html() != prettyRemaining) {
				jQuery("#timer-remaining").html(prettyRemaining);
				jQuery("#time-container").removeClass('hide');
			}
			// show progress bar
			jQuery("#progress-container").removeClass('hide');
		}
	},
	
	endGame: function() {
		clearInterval(this.updateIntervalId);
		window.location.href = "/game/" + this.gameId + "/recap/" + this.lastKnownUserId + "/rampage";
	}
	
});

var Scoreboard = base2.Base.extend({
	idPrefix : 'player-',

	update : function(players, ownId) {
		jQuery('#playerPositionTotal').text(players.length > 0 ? players.length : '-');
		
		var playersById = {};
		var idPrefix = this.idPrefix;

		jQuery.each(players, function(index, player) {
			var you = player.id == ownId;
			if (you) {
				jQuery('#playerPositionMine').text(index + 1);
			}
			playersById[player.id] = player;
			var elId = idPrefix + player.id;
			var el = jQuery('#' + elId);
			if (el.length == 0) {
				el = jQuery('<li/>', { 'id' : elId, 'class' : you ? 'chart-entry highlight' : 'chart-entry' });
				el.append(jQuery('<span/>', { 'class' : 'index pull-left' }));
				var avatarSpan = jQuery('<span/>', { 'class' : 'avatar' });
				avatarSpan.append(jQuery('<img/>', { src : player.smallAvatarUrl }));
				el.append(avatarSpan);
				el.append(player.name ? player.name : 'Anonymous');
			}
			jQuery('.index', el).text(index + 1);
			jQuery('#playerList ul').append(el);
		});

		jQuery('#playerList ul li').each(function(i, el) {
			el = jQuery(el);
			var elId = el.attr('id');
			if (elId.indexOf(idPrefix) === 0) {
				var playerId = parseInt(elId.substring(idPrefix.length));
				if (!playersById[playerId]) {
					el.detach();
				}
			}
		});
	}

});