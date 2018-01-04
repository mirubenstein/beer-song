class BeerSong
  def verse(number)
    case number
      when 0
        <<-TEXT
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
        TEXT
      when 1
        <<-TEXT
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
        TEXT
      when 2
        <<-TEXT
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
        TEXT
      else
      <<-TEXT
#{number} bottles of beer on the wall, #{number} bottles of beer.
Take one down and pass it around, #{number - 1} bottles of beer on the wall.
      TEXT
    end
  end

  def verses(verse_start, verse_end)
    verse_start.downto(verse_end).each_with_object([]) do |number, verses|
      verses << verse(number)
    end.join("\n")
  end
end

module BookKeeping
  VERSION = 3
end
