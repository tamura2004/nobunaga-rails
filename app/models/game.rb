class Game < ApplicationRecord
	has_many :samurais, as: :owner
  has_many :castles, as: :owner
	has_many :dices, as: :owner

  scope :main, -> { find(1) }

  def reset(players_number)
    self.players_number = players_number
    self.turn = 1
    self.step = "準備"
    self.current_player = 1
    save!
  end

end
