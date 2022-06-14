# Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

# You may not use String#swapcase; write your own version of this method.

# def swapcase(text)
#   swapped = text.dup
#   swapped.each_codepoint.with_index do |code, idx|
#     if code.between?(97,122)
#       swapped[idx] = (code - 32).chr
#     elsif code.between?(65,90)
#       swapped[idx] = (code + 32).chr
#     end
#   end
#   swapped
# end

def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
