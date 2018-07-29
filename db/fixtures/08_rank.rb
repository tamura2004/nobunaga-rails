ranks = <<EOD
0 欧州探題  ２
1 関白太政大臣  3
2 第六天魔王 4
3 征夷大将軍 3
4 関東管領  2
5 北米奉行  2
6 源氏の長者 3
EOD

ranks.split(/\n/).each do |line|
  id, name, vp = line.split(/\s+/)
  Rank.seed do |s|
    s.id = id
    s.name = name
    s.vp = vp
  end
end

