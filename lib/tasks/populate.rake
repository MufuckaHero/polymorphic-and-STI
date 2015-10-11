require "populator"

namespace :populate do
  desc "Create random tags"
  task tags: :environment do
    Tag.populate(25) do |tag|
      tag.name = Populator.words(1)
      tag.slug = Populator.words(1)
    end
   end
 
  desc "Create random posts"
  task posts: :environment do
    tags = %w[0 1 2 3 4 5]
    Post.populate(100..200) do |post|
    tags = ('1'..'25').to_a
    end
    Post.populate(50..100) do |post|
      post.title = Populator.words(5..10)
      post.content = Populator.paragraphs(3..4)
      array = tags.sample(rand(1..6)).sort
      array = tags.sample(3).sort
      post.tag_ids = "{" + array.map{ |i| '"%s"' % i }.join(', ').to_s + "}"
    end
  end

  desc "Create random events"
  task events: :environment do
    tags = %w[0 1 2 3 4 5]
    Event.populate(100..200) do |event|
    tags = ('1'..'25').to_a
    end
    Event.populate(50..100) do |event|
      event.title = Populator.words(5..10)
      event.address = Populator.paragraphs(3..4)
      array = tags.sample(rand(1..6)).sort
      array = tags.sample(3).sort
      event.tag_ids = "{" + array.map{ |i| '"%s"' % i }.join(', ').to_s + "}"
    end
  end
end