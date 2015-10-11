class WelcomeController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").first(2)
    @events = Event.order("created_at DESC").first(2)
  end
end