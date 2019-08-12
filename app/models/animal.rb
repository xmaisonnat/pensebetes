class Animal < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :name, presence: true
  validates :description, presence: true
  validates :race, presence: true
  validates :user_id, presence: true, uniqueness: true
end
