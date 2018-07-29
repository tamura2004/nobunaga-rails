class Castle < ApplicationRecord
	belongs_to :owner, polymorphic: true
  belongs_to :area
  include DeckModule
end
