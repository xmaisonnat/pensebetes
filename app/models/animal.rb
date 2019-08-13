class Animal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :race, presence: true
  # mount_uploader :photo, PhotoUploader
end
