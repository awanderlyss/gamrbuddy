class Game < ApplicationRecord
  has_many :ownerships
  has_many :users, through: :ownerships

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
