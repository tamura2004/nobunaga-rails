class DicesController < ApplicationController
  before_action :set_player
  before_action :set_dice

  def move
    @board = Board.find(@dice.number - 1)
    @player.dices.same(@dice).move(@board)

    unless Player.remain(@player).empty?
      @game.player = Player.next(@player)
      @game.save
    end

    redirect_to march_player_url(@game.player)
    # render "games/show"
  end

  private
    def set_dice
      @dice = Dice.find(params[:id])
    end

    def set_player
      @player = Player.find(params[:player_id])
    end
end
