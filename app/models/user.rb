class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :animals
  has_many :reservations

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true, uniqueness: true
end
