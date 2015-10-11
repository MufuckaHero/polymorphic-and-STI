class CreateContentViews < ActiveRecord::Migration
  def up
    execute("
      CREATE OR REPLACE VIEW content_views AS
        SELECT id, title, 'Post' AS type, tag_ids, created_at, updated_at FROM posts
        UNION
        SELECT id, title, 'Event' AS type, tag_ids, created_at, updated_at FROM events
    ")
  end

  def down
    execute("DROP VIEW content_views;")
  end
end