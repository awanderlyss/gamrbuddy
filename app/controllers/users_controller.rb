class UsersController < ApplicationController
  def ownerships
    @games = Game.all
    @ownerships = Ownership.where(user: current_user).paginate(:page => params[:page], :per_page => 6)
  end
end
