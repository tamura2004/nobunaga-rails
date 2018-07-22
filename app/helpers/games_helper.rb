module GamesHelper
  COLOR_CSS = {
    "blue" => "primary",
    "red" => "danger",
    "green" => "success",
    "yellow" => "warning",
    "black" => "dark",
    "white" => "light"
  }

  COLOR_KANJI = {
    "blue" => "青",
    "red" => "赤",
    "green" => "緑",
    "yellow" => "黄",
    "black" => "黒",
    "white" => "白"
  }

  def color(str)
    COLOR_CSS[str]
  end

  def color_kanji(str)
    COLOR_KANJI[str]
  end

end
