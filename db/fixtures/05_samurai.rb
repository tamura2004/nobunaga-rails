
samurais = <<EOD
0 毛利元就  0 ダイス交換1  5,6,4
1 木下藤吉郎 0 ダイス交換1  3,4,1
2 明智光秀  0 ダイス交換1  5,6,2
3 松永久秀  1 武将交換  
4 武田信玄  0 ダイスボーナス 1
5 徳川家康  0 ダイス交換1  3,4,2
6 柴田勝家  0 ダイス交換1  3,4,5
7 今川義元  0 ダイス交換1  5,6,1
8 北条氏康  0 ダイス交換1  1,2,3
9 前田利家  0 ダイス交換1  5,6,3
10  上杉謙信  0 合戦  2
11  滝川一益  0 ダイス交換1  1,2,4
12  伊達政宗  0 ダイス交換1  1,2,5
13  九鬼義隆  0 領地  東
14  大友宗麟  0 ダイス交換2  6,3,4
15  竜造寺隆信 0 ダイス交換1  3,4,6
16  伊藤マンショ  0 領地  西
17  足利義昭  0 ダイス削除 1,2
18  弥助  0 ダイス交換1  1,2,6
19  黒田官兵衛 0 ダイス交換2  3,1,6
20  お市  2 城交換 
21  竹中半兵衛 0 ダイス削除 5,6
22  本願寺顕如 0 ダイス削除 3,4
23  島津義弘  0 ダイス交換2  1,5,6
24  石田三成  0 ダイス交換2  2,4,5
EOD

samurais.split(/\n/).each do |line|
  id, name, vp, ability, value = line.split(/\s+/)
  Samurai.seed do |s|
    s.id = id
    s.order = id
    s.name = name
    s.ability = ability
    s.vp = vp
    s.value = value

    if rand() < 0.5
      s.owner_type = "Game"
      s.owner_id = 0
    else
      s.owner_type = "Player"
      s.owner_id = rand(6)
    end
  end
end
