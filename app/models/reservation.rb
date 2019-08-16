class Reservation < ApplicationRecord
  require 'date'
  belongs_to :user
  belongs_to :animal


  enum status: [:pending, :validated, :canceled]
end
