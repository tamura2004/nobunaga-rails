class DicesController < ApplicationController
  before_action :set_player

  def move
    @dice = Dice.find(params[:id])
    @board = Board.find(@dice.number - 1)
    @player.dices.same(@dice).move(@board)

    if Player.remain(@player).empty?
      redirect_to employ_game_url
    else
      @game.player = Player.next(@player)
      @game.save
      redirect_to march_player_url(@game.player)
    end

  end

  def change
    from = params[:from].to_i
    to = params[:to].to_i

    if from != to
      @player.dices.each do |dice|
        if dice.number == from
          dice.update(number: to)
        end
      end
    end

    redirect_to game_path
  end


  private
    def set_dice
    end

    def set_player
      @player = Player.find(params[:player_id])
    end
end
