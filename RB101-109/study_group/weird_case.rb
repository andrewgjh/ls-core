# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

=begin
  INPUT is a string
  OUTPUT is a string where every 3rd word has every second letter upcased

  ALGO
  split words into array
  initial index_modifier of starting word to manipulate and set to 2
  iterate through array of words using map with index
  when idx == index_modifier
   add 3 to index_modifier
   use chars method to split word into array
   call map with index
    check when index is odd then upcase the letter
    else return element unchanged
  else return word unchanged

  take the array returned by map and join with " "
=end

def to_weird_case(text)
  index_to_modify = 2
  modified = text.split.map.with_index do |word, idx|
    if index_to_modify == idx
      upcased = word.chars.map.with_index do |char, index|
        weird_char = if index.odd?
                       char.upcase
                     else
                       char
                     end
      end
      index_to_modify += 3
      upcased.join
    else
      word
    end
  end
  modified.join(" ")
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted'
) ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious'
) ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".
