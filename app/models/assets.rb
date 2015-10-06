class Assets < ActiveRecord::Base
  belongs_to :assetable, polymorphic: true
end
