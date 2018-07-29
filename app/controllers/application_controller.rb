class ApplicationController < ActionController::Base
  before_action do
    @game = Game.main
    @boards = Board.all
    @player = @game.player
    @areas = Area.all
    @ranks = Rank.all
  end
end
