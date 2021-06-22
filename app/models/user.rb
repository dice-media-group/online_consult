class User < ApplicationRecord
  acts_as_booker
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :omniauthable

  has_one_attached :avatar
  has_person_name

  has_many :notifications, as: :recipient
  has_many :services

  has_many :meetings, dependent: :destroy
  has_many :comments, dependent: :destroy
end
