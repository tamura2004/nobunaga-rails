COLORS = %w(blue red green yellow black white)

Game.seed do |s|
	s.id = 1
	s.turn = 1
	s.players_number = 5
	s.step = "準備"
	s.current_player = 1
end

6.times do |n|
	Board.seed do |s|
		s.id = n
		s.number = n + 1
	end
	Player.seed do |s|
		s.id = n
		s.number = n + 1
		s.color = COLORS[n]
	end
end

Dice.delete_all

10.times do |n|
	6.times do |color|
		Dice.seed do |s|
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

samurais = [
	["弥助","1/2->6"],
	["木下藤吉郎","3/4->1"],
	["明智光秀","5/6->1"],
	["柴田勝家","3/4->5"],
	["前田利家","5/6->3"],
	["滝川一益","1/2->4"],
	["毛利元就","5/6->4"],
	["徳川家康","3/4->2"],
	["今川義元","5/6->1"],
	["北条氏康","1/2->3"],
	["島津義弘","3/4->6"],
	["松永久秀","交換：侍"],
	["武田信玄","補給2"],
	["上杉謙信","合戦2"],
	["伊達政宗","5->x"],
	["九鬼義隆","東3"],
	["伊藤マンショ","西3"],
	["足利義昭","1->x"],
	["大友宗麟","6->x"]
]

samurais.each_with_index do |value,i|
	name, ability = value
	Samurai.seed do |s|
		s.id = i
		s.name = name
		s.ability = ability
		if rand() < 0.5
			s.owner_type = "Game"
			s.owner_id = 1
		else
			s.owner_type = "Player"
			s.owner_id = rand(6)
		end
	end
end

castles = [
	["東1", "三河", "岡崎城", "2"],
	["東1", "尾張", "名古屋城", "4"],
	["東1", "美濃", "稲葉山城", "5"],
	["東2", "甲斐", "躑躅ヶ崎館", "5"],
	["東2", "相模", "小田原城", "2,3,4"],
	["東2", "駿河", "駿府城", "3"],
	["東3", "武蔵", "江戸城", "3,4"],
	["東3", "越後", "春日山城", "2,3"],
	["東4", "出羽", "米沢城", "3"],
	["東4", "蝦夷", "五稜郭", "5"],
	["東5", "桜面戸", "金門橋", "1,1"],
	["東6", "紐育", "萬八端島", "3,4,5"],
	["西1", "大和", "東大寺", "1,1"],
	["西1", "山城", "二条城", "1,1,1"],
	["西1", "河内", "石山本願寺", "5"],
	["西2", "備前", "岡山城", "2"],
	["西2", "播磨", "姫路城", "3,4"],
	["西3", "出雲", "出雲大社", "1,1"],
	["西3", "土佐", "高知城", "5"],
	["西4", "琉球", "首里城", "2"],
	["西4", "薩摩", "鹿児島城", "5"],
	["西5", "唐", "万里の長城", "6"],
	["西5", "天竺", "東インド会社", "2,3"],
	["西6", "羅馬", "法王庁", "1,1,1"]
]

castles.each_with_index do |value,i|
	area, country, name, ability = value
	Castle.seed do |s|
		s.id = i
		s.area = area
		s.country = country
		s.name = name
		s.ability = ability
		if rand() < 0.5
			s.owner_type = "Game"
			s.owner_id = 1
		else
			s.owner_type = "Player"
			s.owner_id = rand(6)
		end
	end
end
