class Player < ApplicationRecord
	has_many :samurais, as: :owner
	has_many :castles, as: :owner
	has_many :dices, as: :owner

  scope :main, -> { order(:id).limit(Game.main.players_number) }
  scope :has_dice, -> { main.where(id: Dice.hand.select(:owner_id).group(:owner_id).having("count(owner_id) >= ?",0)) }

  scope :after, ->(pl) { has_dice.where("id > ?", pl.id) }
  scope :before, ->(pl) { has_dice.where("id <= ?", pl.id) }
  scope :remain, ->(pl) { after(pl) + before(pl) }
  scope :next, ->(pl) { remain(pl).first }

  def dice_amount
    x = samurais.size
    y = castles.size
    [x,y].min + 3
  end

  def get_dice
    Dice.pool(self).limit(dice_amount).get(self)
  end

  def self.prepare
    Dice.reset
    main.each(&:get_dice)
  end

end
