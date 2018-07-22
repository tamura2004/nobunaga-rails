class Samurai < ApplicationRecord
	belongs_to :owner, polymorphic: true
  include DeckModule
end
