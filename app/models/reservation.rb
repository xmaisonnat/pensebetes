class Reservation < ApplicationRecord
  require 'date'
  belongs_to :user
  belongs_to :animal
end
