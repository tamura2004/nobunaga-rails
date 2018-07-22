class PlayersController < ApplicationController
  def march
    @player.dices.roll
    render "games/show"
  end
end
