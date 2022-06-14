def print_line(text)
  num_whitespace = " " * (80 - text.size)
  puts "| #{text}#{num_whitespace}|"
end

def bannerize(text_arr)
  puts "+---------------------------------------------------------------------------------+"
  text_arr.each do |text|
    print_line(text)
  end
  puts "+---------------------------------------------------------------------------------+"
end

def print_in_box_long(text)
  all_words = text.split
  under_80 = 0
  line = ""
  line_array = []
  all_words.each do |word|
    under_80 += word.size + 1
    if under_80 > 80
      line_array << line
      line = ""
      under_80 = word.size + 1
    end
    line += "#{word} "
  end
  bannerize(line_array)
end

print_in_box_long('A week ago a friend invited a couple of other couples over for dinner. Eventually, the food (but not the wine) was cleared off the table for what turned out to be some fierce Scrabbling. Heeding the strategy of going for the shorter, more valuable word over the longer cheaper word, our final play was “Bon,” which–as luck would have it!–happens to be a Japanese Buddhist festival, and not, as I had originally asserted while laying the tiles on the board, one half of a chocolate-covered cherry treat. Anyway, the strategy worked. My team only lost by 53 points instead of 58')

# +--------------------------------------------------------------------------------+
# |  |
# |  |
# |  |
# +--+
