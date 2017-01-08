class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:add_ownership, :remove_ownership]
  before_action :set_game, only: [:show]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
  end

  def add_ownership
    @game = Game.find(params[:id])
    @game.ownerships.create(user: current_user)
    redirect_to :back
  end

  def remove_ownership
    @game = Game.find(params[:id])
    Ownership.where(user: current_user, game: @game).destroy_all
    redirect_back fallback_location: proc { ownerships_user_path(@current_user) }
  end

  def ownerships
    @game = Game.find(params[:id])
    @ownerships = Ownership.where(game: @game)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:title, :genre, :developer, :release_date, :img_url)
    end
end
