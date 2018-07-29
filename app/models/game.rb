class Game < ApplicationRecord
	has_many :samurais, as: :owner
  has_many :castles, as: :owner
	has_many :dices, as: :owner
  belongs_to :player

  scope :main, -> { find(0) }

  def reset(n)
    update(players_number:n, turn: 1, step: "準備", player_id: 0)
  end

end
