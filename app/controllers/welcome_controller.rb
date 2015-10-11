class WelcomeController < ApplicationController
  def index
    @posts = Post.all.last(2)
    @events = Event.all.last(2)
    
    @tags = Tag.all
    @articles = [] 
    @tags.each do |tag|
      _tags_count = ContentView.any_tags(tag.id).count
      _class =
        case _tags_count
        when 0..15 then 's'
        when 15..25 then 'm'
        else 'l'
        end
      @articles << { tag: tag, css_class: _class }
    end
  end
end
