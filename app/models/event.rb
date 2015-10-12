class Event < ActiveRecord::Base
  include Models

  has_one :attachment, as: :assetable,  dependent: :destroy
  accepts_nested_attributes_for :attachment
end