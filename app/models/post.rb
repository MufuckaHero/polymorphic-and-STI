class Post < ActiveRecord::Base
  include Taggable
  include Models
  include CustomFields
  
  has_one :picture, as: :assetable,  dependent: :destroy
  accepts_nested_attributes_for :picture

  custom_fields :title_color
end