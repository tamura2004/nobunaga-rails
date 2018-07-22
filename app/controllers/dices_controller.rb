class DicesController < ApplicationController
  before_action :set_player
  before_action :set_dice

  def move
    @board = Board.find_by(number: @dice.number)
    @player.dices.same(@dice).move(@board)

    unless Player.remain(@player).empty?
      @game.update(current_player: Player.next(@player).number)
    end

    redirect_to march_player_url(Player.current)
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
