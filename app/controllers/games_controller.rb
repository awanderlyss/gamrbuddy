class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:add_ownership, :remove_ownership]
  before_action :set_game, only: [:show]

  # GET /games
  # GET /games.json
  def index
    @games = Game.paginate(:page => params[:page], :per_page => 6)
    if params[:search]
      @games = Game.search(params[:search].capitalize).paginate(:page => params[:page], :per_page => 6)
    else
      @games = Game.paginate(:page => params[:page], :per_page => 6)
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
  end

  # new
  def new
    @game = Game.new
  end

  # create
  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game)
  end

  # edit
  def edit
    @game = Game.find(params[:id])
  end

  # update
  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game)
  end

  # destroy
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  def add_ownership
    @game = Game.find(params[:id])
    @game.ownerships.create(user: current_user)
    redirect_back(fallback_location: @game)
  end

  def remove_ownership
    @game = Game.find(params[:id])
    Ownership.where(user: current_user, game: @game).destroy_all
    redirect_back(fallback_location: @game)
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
