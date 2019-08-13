class Animal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :race, presence: true

  validates :user, presence: true, uniqueness: true

end
