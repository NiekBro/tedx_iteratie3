class FrontpageController < ApplicationController

	def index
		@videos = yt_client.videos_by(:user => 'TEDxTalks').videos
		add_youtube_videos @videos
		@circles = Circle.evaluated_by(:votes, current_user)
	end

	private
	def add_youtube_videos videos
		videos.each do |video|
			if Video.find_by_youtube_id(video.unique_id).nil?
				Video.create([{
					:youtube_id => video.unique_id,
					:title => video.title,
					:description => video.description,
					:thumbnail_url => video.thumbnails.first.url
					}])
			end
		end
	end
	def yt_client
		require 'youtube_it'
		client = YouTubeIt::Client.new(:dev_key => "AI39si7PkNZ1Mm65rI-5TIYs-_uJd8x5uF_MHP06Kb0NpzgTDPlQDVGt5LwtjuXLkpH0oeKGw4G3uj_5bPYV6quCkRZAGL4FdA")
		return client
	end
end

