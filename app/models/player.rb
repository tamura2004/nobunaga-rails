class Player < ApplicationRecord
	has_many :samurais, as: :owner
	has_many :castles, as: :owner
	has_many :dices, as: :owner

  scope :main, -> { order(:number).limit(Game.main.players_number) }
  scope :has_dice, -> { main.where(id: Dice.select(:owner_id).where(owner_type: "Player").group(:owner_id).having("count(owner_id) >= ?",0)) }
  scope :current, -> { find_by(number: Game.main.current_player) }

  def dice_amount
    x = samurais.size
    y = castles.size
    [x,y].min + 3
  end

  def get_dice
    Dice.where(color: color).where(owner_type: "Game").limit(dice_amount).each do |dice|
      self.dices << dice
    end
  end

end
