module DeckModule
  extend ActiveSupport::Concern

  included do
    scope :deck, -> { where(owner_type: "Game").order(:number) }
  end

  module ClassMethods
    def reset
      update_all(owner_type: "Game", owner_id: 1)
      shuffle
    end

    def shuffle
      deck.shuffle.each_with_index do |card, i|
        card.number = i
        card.save!
      end
    end

    def draw
      deck.first
    end
  end
end

