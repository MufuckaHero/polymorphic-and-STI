namespace :populate do
  require 'populator'
  desc "Create random tags"
  task tags: :environment do
    Tag.populate(25) do |tag|
      tag.name = Populator.words(1)
      tag.slug = Populator.words(1)
    end
   end
 
  desc "Create random posts"
  task posts: :environment do
    tags = ('1'..'25').to_a
    Post.populate(50..100) do |post|
      post.title = Populator.words(5..10)
      post.content = Populator.paragraphs(3..4)
      array = tags.sample(3).sort
      post.tag_ids = "{" + array.map{ |i| '"%s"' % i }.join(', ').to_s + "}"
    end
  end

  desc "Create random events"
  task events: :environment do
    tags = ('1'..'25').to_a
    Event.populate(50..100) do |event|
      event.title = Populator.words(5..10)
      event.address = Populator.paragraphs(3..4)
      array = tags.sample(3).sort
      event.tag_ids = "{" + array.map{ |i| '"%s"' % i }.join(', ').to_s + "}"
    end
  end
end