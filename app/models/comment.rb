class Comment < ActiveRecord::Base
  validates :author_name, presence: true,
                          length: { minimum: 2 }


  belongs_to :target, polymorphic: true
end