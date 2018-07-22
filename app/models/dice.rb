class Dice < ApplicationRecord
	belongs_to :owner, polymorphic: true

  def self.reset
    update_all(owner_type: "Game", owner_id: 1)
  end

end
