def uppercase?(text)
  char_array = text.chars
  !char_array.any? {|char| char =~/[a-z]/}
end

def uppercase?(string)
  string == string.upcase
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true