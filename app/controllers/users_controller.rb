class UsersController < ApplicationController
  def ownerships
    @ownerships = Ownership.where(user: current_user).paginate(:page => params[:page], :per_page => 6)
  end
end
