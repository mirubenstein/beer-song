class BeerSong

  def verse(number)
    verse_map[number]
  end

  def verse_map
    @verse_map ||= begin
      Hash.new do |hash, key|
        hash[key] = <<-TEXT
#{key} bottles of beer on the wall, #{key} bottles of beer.
Take one down and pass it around, #{key - 1} bottles of beer on the wall.
        TEXT
      end.tap do |obj|
        obj.merge!(
          {
            0 =>
              <<-TEXT,
No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
            TEXT
            1 =>
              <<-TEXT,
1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.
            TEXT
            2 =>
              <<-TEXT,
2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.
            TEXT
          }
        )
      end
    end
  end

  def verses(verse_start, verse_end)
    verse_start.downto(verse_end).each_with_object([]) do |number, verses|
      verses << verse_map[number]
    end.join("\n")
  end
end


module BookKeeping
  VERSION = 3
end
