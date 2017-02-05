class Profile < ApplicationRecord
  #Associations
  belongs_to :user

  # Validations
  #validates :gamertag, presence: true
end
