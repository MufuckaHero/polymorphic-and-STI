class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string   :author_name
      t.string   :author_email
      t.text     :content
      t.integer  :target_id, null: false
      t.string   :target_type, null: false

      t.timestamps null: false
    end
  end
end
