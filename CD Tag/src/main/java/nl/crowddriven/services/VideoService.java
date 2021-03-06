/*  This file is part of Waisda 

    Copyright (c) 2012 Netherlands Institute for Sound and Vision
    https://github.com/beeldengeluid/waisda
	
    Waisda is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Waisda is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Waisda.  If not, see <http://www.gnu.org/licenses/>.
*/

package nl.waisda.services;

import java.util.ArrayList;
import java.util.List;

import nl.waisda.domain.Video;
import nl.waisda.model.Cache;
import nl.waisda.model.Channel;
import nl.waisda.model.Value;
import nl.waisda.repositories.VideoRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VideoService {

	public static final long MAX_CHANNEL_AGE = 5000;

	@Autowired
	private VideoRepository videoRepo;

	private Value<List<Channel>> channelContent;

	{
		channelContent = new Value<List<Channel>>() {

			@Override
			public List<Channel> get() {
				List<Video> videos = videoRepo.getFeaturedVideosMostTags();
				List<Channel> channels = new ArrayList<Channel>(videos.size());
				for (Video video : videos) {

					int highscore = videoRepo.getHighscore(video.getId());
					int diveClicks = videoRepo.getDiveClicks(video.getId());
					int pinterestPins = videoRepo.getPinterestPin(video.getId());
					int twitterShares = videoRepo.getTwitterShare(video.getId());
					channels.add(new Channel(video, highscore, diveClicks, pinterestPins, twitterShares));
				}
				return channels;
			}

		};
		channelContent = new Cache<List<Channel>>(channelContent,
				MAX_CHANNEL_AGE);
	}
	
	public List<Channel> getVideosByChannel(final String channel) {
		Value<List<Channel>> channelValues = new Value<List<Channel>>() {
			
			@Override
			public List<Channel> get() {
				List<Video> videos = videoRepo.getVideosByChannel(channel);
				List<Channel> channels = new ArrayList<Channel>();

				for (Video video : videos) {
					int highscore = videoRepo.getHighscore(video.getId());
					int diveClicks = videoRepo.getDiveClicks(video.getId());
					int pinterestPins = videoRepo.getPinterestPin(video.getId());
					int twitterShares = videoRepo.getTwitterShare(video.getId());
					channels.add(new Channel(video, highscore, diveClicks, pinterestPins, twitterShares));
				}
				
				return channels;
			}
		};
		
		channelValues = new Cache<List<Channel>>(channelValues, MAX_CHANNEL_AGE);
		
		return channelValues.get();
	}

	public List<Channel> getMostFeaturedTags() {
		Value<List<Channel>> channelValues = new Value<List<Channel>>() {
			
			@Override
			public List<Channel> get() {
				List<Video> videos = videoRepo.getFeaturedVideosMostTags();
				List<Channel> channels = new ArrayList<Channel>(videos.size());
				for (Video video : videos) {

					int highscore = videoRepo.getHighscore(video.getId());
					int diveClicks = videoRepo.getDiveClicks(video.getId());
					int pinterestPins = videoRepo.getPinterestPin(video.getId());
					int twitterShares = videoRepo.getTwitterShare(video.getId());
					channels.add(new Channel(video, highscore, diveClicks, pinterestPins, twitterShares));
				}
				return channels;
			}
		};
		
		channelValues = new Cache<List<Channel>>(channelValues, MAX_CHANNEL_AGE);
		
		return channelValues.get();
	}

	public List<Channel> getVideoWithHighestScore() {
		Value<List<Channel>> channelValues = new Value<List<Channel>>() {
			
			@Override
			public List<Channel> get() {
				List<Video> videos = videoRepo.getFeaturedVideosHighestScore();
				List<Channel> channels = new ArrayList<Channel>(videos.size());
				for (Video video : videos) {

					int highscore = videoRepo.getHighscore(video.getId());
					int diveClicks = videoRepo.getDiveClicks(video.getId());
					int pinterestPins = videoRepo.getPinterestPin(video.getId());
					int twitterShares = videoRepo.getTwitterShare(video.getId());
					channels.add(new Channel(video, highscore, diveClicks, pinterestPins, twitterShares));
				}
				return channels;
			}
		};
		
		channelValues = new Cache<List<Channel>>(channelValues, MAX_CHANNEL_AGE);
		
		return channelValues.get();
	}

	public Video getVideoById(int videoId) {
		return videoRepo.getById(videoId);
	}

	public List<Channel> getChannelContent() {
		return channelContent.get();
	}

	public List<Channel> getTagsPerVideo() {
		Value<List<Channel>> channelValues = new Value<List<Channel>>() {
			
			@Override
			public List<Channel> get() {
				List<Video> videos = videoRepo.getFeaturedVideosMostTags();
				List<Channel> channels = new ArrayList<Channel>(videos.size());
				for (Video video : videos) {

					int highscore = videoRepo.getHighscore(video.getId());
					int diveClicks = videoRepo.getDiveClicks(video.getId());
					int pinterestPins = videoRepo.getPinterestPin(video.getId());
					int twitterShares = videoRepo.getTwitterShare(video.getId());
					channels.add(new Channel(video, highscore, diveClicks, pinterestPins, twitterShares));
				}
				return channels;
			}
		};
		
		channelValues = new Cache<List<Channel>>(channelValues, MAX_CHANNEL_AGE);
		
		return channelValues.get();
	}


}
