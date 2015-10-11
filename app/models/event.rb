class Event < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 2 }

  has_many :comments, as: :target, dependent: :delete_all

  has_one :attachment, as: :assetable,  dependent: :destroy
  accepts_nested_attributes_for :attachment

  paginates_per 10
end