class Dice < ApplicationRecord
	belongs_to :owner, polymorphic: true

  scope :hand, -> { where(owner_type: "Player") }
  scope :onboard, -> { where(owner_type: "Board") }
  scope :game, -> { where(owner_type: "Game") }
  scope :pool, ->(pl) { game.where(color: pl.color) }
  scope :get, ->(pl) { update(owner_type: "Player", owner_id: pl.id) }
  scope :same, ->(d) { where(color: d.color, number: d.number) }
  scope :move, ->(b) { update_all(owner_type: "Board", owner_id: b.id) }
  scope :roll, -> { each(&:roll) }
  scope :timed, -> { order(:updated_at) }

  def self.reset
    update_all(owner_type: "Game", owner_id: 1)
  end

  def roll
    update(number: rand(6) + 1)
  end

end
