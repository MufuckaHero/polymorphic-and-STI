class WelcomeController < ApplicationController
	def index
		@events = Event.order("created_at DESC").first(3)
		@posts = Post.order("created_at DESC").first(3)
		@videos = Video.order("created_at DESC").first(3)
	end
end
