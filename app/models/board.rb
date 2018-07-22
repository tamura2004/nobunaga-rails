class Board < ApplicationRecord
	has_many :samurais, as: :owner
	has_many :castles, as: :owner
	has_many :dices, as: :owner
end
