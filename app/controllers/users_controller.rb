class UsersController < ApplicationController
  def ownerships
    @ownerships = Ownership.where(user: current_user)
  end
end
