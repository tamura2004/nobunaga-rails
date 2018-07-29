COLORS = %w(blue red green yellow black white)

7.times do |n|
  Board.seed do |s|
    s.id = n
    case n
      when 0,1 then s.name = "調略"
      when 2..5 then s.name = "合戦"
      when 6 then s.name = "籠城戦"
    end
  end
end
