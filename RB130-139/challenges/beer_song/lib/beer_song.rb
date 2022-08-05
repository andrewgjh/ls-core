class BeerSong
  def self.verse(beer)
    bottle_first, bottle_second = bottle_string(beer)
    tense = beer - 1 == 0 ? "it" : "one"
    first_sentence = "#{any?(beer).capitalize} #{bottle_first} of beer on the wall, #{any?(beer)} #{bottle_first} of beer.\n"
    second_sentence = "Take #{tense} down and pass it around, #{any?(beer - 1)} #{bottle_second} of beer on the wall.\n"
    second_sentence = "Go to the store and buy some more, 99 bottles of beer on the wall.\n" if beer == 0
    first_sentence + second_sentence
  end

  def self.verses(start, ending)
    (start.downto(ending)).map do |bottle|
      verse(bottle)
    end.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  def self.any?(beer)
    beer <= 0 ? "no more" : beer.to_s
  end

  def self.bottle_string(int)
    case int
    when 2 then ["bottles", "bottle"]
    when 1 then ["bottle", "bottles"]
    else ["bottles", "bottles"]
    end
  end
end

p BeerSong.verses(99, 98)
