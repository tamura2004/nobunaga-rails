class PlayersController < ApplicationController
  def march
    @player.dices.roll
    redirect_to game_path
  end
end
