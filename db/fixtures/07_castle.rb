castles = <<EOD
0 羅馬  西3  法王庁 1,1,1 0
1 天竺  西3  東インド会社  3,3 1
2 唐 西3  万里の長城 6,6,6 2
3 仏蘭西 西3  凱旋門 1,2 3
4 琉球  西2  首里城 2 4
5 薩摩  西2  鹿児島城  6,6 5
6 筑前  西2  福岡城 6,6 5
7 土佐  西2  高知城 5 5
8 出雲  西2  出雲大社  1,1 8
9 淡路  西1  洲本城 4 5
10  備前  西1  岡山城 2 5
11  播磨  西1  姫路城 2,3 5
12  紀伊  西1  和歌山城  3 5
13  河内  西1  石山本願寺 4,4 13
14  摂津  西1  大阪城 4,4 14
15  山城  西1  二条城 1,1 15
16  大和  西1  東大寺 4 16
17  尾張  東1  名古屋城  3,3 17
18  美濃  東1  稲葉山城  5 5
19  三河  東1  岡崎城 2,2 5
20  甲斐  東1  躑躅ヵ崎館 5,5 5
21  駿河  東1  駿府城 3,3 5
22  相模  東1  小田原城  4,5,6 5
23  武蔵  東2  江戸城 2,2 5
24  出羽  東2  米沢城 5 5
25  蝦夷  東2  五稜郭 5,5 25
26  越後  東2  春日山城  6 5
27  桜面戸 東3  金門橋 1 27
28  紐育  東3  萬八端 4,5 28
29  得徹  東3  阿羅喪砦  6 29
30  華府  東3  白色邸 1,2,3 30
31  本能寺 特殊  本能寺 3,4,5 31
EOD

castles.split(/\n/).each do |line|
  id, country, area_name, name, dices, img_id = line.split(/\s+/)
  image = "castle#{img_id}"
  area = Area.find_by(name: area_name)

  Castle.seed do |s|
    s.id = id
    s.order = id
    s.country = country
    s.area_id = area.id
    s.name = name
    s.ability = dices
    s.image = image

    if rand() < 0.5
      s.owner_type = "Game"
      s.owner_id = 1
    else
      s.owner_type = "Player"
      s.owner_id = rand(6)
    end
  end
end

