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
    redirect_to march_player_url(Game.main.player)
  end

  def employ
    @boards.each do |board|
      next if board.samurais.empty?
      # total = { "red" => 2, "blue" => 2 }
      total = board.dices.order(:id).pluck(:color).group_by(&:itself).transform_values(&:size)
      maxnum = total.values.max
      winner = total.select{|k,v| v == maxnum}.keys.last
      next if winner.nil?
      player = Player.find_by(color: winner)
      player.samurais << board.samurais.first
    end
    redirect_to prepare_game_path
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
