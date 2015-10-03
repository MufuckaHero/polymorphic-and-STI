class Post < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 2 }

	has_many :comments, as: :target, dependent: :delete_all
end
