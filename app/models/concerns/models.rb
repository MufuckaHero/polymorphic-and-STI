module Models
  extend ActiveSupport::Concern

  included do
    validates :title, presence: true,
                      length: { minimum: 2 }

    default_scope -> { order(created_at: :desc) }

    paginates_per 10

    has_many :comments, :as => :target, dependent: :delete_all
  end
end