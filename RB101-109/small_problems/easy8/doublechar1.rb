def repeater(text)
  characters = text.chars
  characters.zip(characters).flatten.join.strip
end

# def repeater(text)
#   characters = text.chars
#   double = characters.map do |char|
#     char * 2
#   end
#   double.join.strip
# end

def repeater(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''