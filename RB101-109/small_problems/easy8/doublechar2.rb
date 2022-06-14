def double_consonants(text)
  characters = text.chars
  con_doubled = characters.map do |char|
    if char =~ /[a-z]/i 
      char =~ /[aeiou]/i ? char : char * 2
    else
      char
    end
  end
  con_doubled.join.strip
end

CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""