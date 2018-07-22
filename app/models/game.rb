class Game < ApplicationRecord
	has_many :samurais, as: :owner
  has_many :castles, as: :owner
	has_many :dices, as: :owner

  scope :main, -> { find(1) }

  def reset(n)
    update(players_number:n, turn: 1, step: "準備", current_player: 1)
  end

end
