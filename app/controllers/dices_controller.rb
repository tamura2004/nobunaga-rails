class DicesController < ApplicationController

  def move
    @game = Game.main
    @boards = Board.all
    @player = Player.find(params[:player_id])
    @dice = Dice.find(params[:id])

    @board = Board.find_by(number: @dice.number)
    @board.dices << @dice

    render "games/show"
  end

end
