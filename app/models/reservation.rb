class Reservation < ApplicationRecord
  belongs_to :animals
  belongs_to :users

  validates :user_id
  validates :animal_id
  validates :date, presence: true
end
