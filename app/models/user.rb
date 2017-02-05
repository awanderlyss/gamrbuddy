class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_one :profile, dependent: :destroy, autosave: true
  has_many :ownerships
  has_many :games, through: :ownerships, dependent: :destroy

  accepts_nested_attributes_for :profile
  before_create :build_profile
end
