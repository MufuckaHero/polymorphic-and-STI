class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string   :author_name
      t.string   :author_email
      t.text     :content
      t.references :target, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
