class Animal < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :race, presence: true

  mount_uploader :photo, PhotoUploader

  include PgSearch::Model
  pg_search_scope :search_by_race_and_description,
    against: [ :race, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
