COLORS = %w(blue red green yellow black white)

Dice.delete_all

10.times do |n|
  6.times do |color|
    Dice.seed do |s|
      s.id = n * 6 + color
      s.number = rand(6)+1
      s.color = COLORS[color]
      if rand() < 0.3
        s.owner_type = "Game"
        s.owner_id = 1
      elsif rand() < 0.5
        s.owner_type = "Board"
        s.owner_id = rand(6)
      else
        s.owner_type = "Player"
        s.owner_id = color
      end
    end
  end
end
