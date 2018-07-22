class GamesController < ApplicationController

  def prepare
    Player.prepare

    @boards.each do |board|
      case board.id
      when 0,1
        if board.samurais.empty?
          board.samurais << Samurai.draw
        end
      when 2,3,4,5
        if board.castles.empty?
          board.castles << Castle.draw
        end
      end
    end

    @game.update(step: "行軍")
    redirect_to march_player_url(Player.current)
  end

  # GET /games/march/players/:player_id
  def march
    player_id = params["player_id"]
    Dice.where(owner_type: "Player", owner_id: player_id).each do |dice|
      dice.number = rand(6) + 1
      dice.save!
    end      
  end

  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # POST /games
  # POST /games.json
  def create
    # ゲームの初期化
    num = game_params[:players_number].to_i
    @game.reset(num)

    # デッキの初期化
    Samurai.reset
    Castle.reset

    # 侍カードをプレイヤーに配る
    num.times do |id|
      player = Player.find(id)
      player.samurais << Samurai.draw
    end

    if @game.save
      redirect_to :prepare_game, notice: 'ゲームを開始します'
    else
      render :new
    end
  end

  private
    def game_params
      params.require(:game).permit(:players_number)
    end

end
