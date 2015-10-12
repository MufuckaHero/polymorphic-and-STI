class Post < ActiveRecord::Base
  include Taggable
  include Models
  
  has_one :picture, as: :assetable,  dependent: :destroy
  accepts_nested_attributes_for :picture
end