class ApplicationController < ActionController::Base
  before_action do
    @game = Game.main
    @boards = Board.all
    @player = Player.current
  end
end
