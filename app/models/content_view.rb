class ContentView < ActiveRecord::Base
  self.table_name = "content_views"
  self.primary_key = "id"

  scope :any_tags, -> (tags) { where('tag_ids && ARRAY[?]', Array.wrap(tags).map(&:to_i)) }
  scope :recently, -> { order(created_at: :desc) }

  def readonly?
    return true
  end
end
