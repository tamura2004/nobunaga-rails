COLORS = %w(blue red green yellow black white)

6.times do |n|
  Player.seed do |s|
    s.id = n
    s.color = COLORS[n]
  end
end