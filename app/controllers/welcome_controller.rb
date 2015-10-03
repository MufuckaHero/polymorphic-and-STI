class WelcomeController < ApplicationController
	def index
		@events = Event.all
		@posts = Post.all
		@videos = Video.all
	end
end
