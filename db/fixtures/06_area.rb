AREAS = ["西3", "西2", "西1", "東1", "東2", "東3", "特殊"]

AREAS.each_with_index do |name, i|
  Area.seed do |s|
    s.id = i
    s.name = name
  end
end
