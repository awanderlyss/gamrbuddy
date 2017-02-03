class Ownership < ApplicationRecord
  #Associations
  belongs_to :user
  belongs_to :game
end
