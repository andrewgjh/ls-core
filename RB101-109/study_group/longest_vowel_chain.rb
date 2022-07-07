# The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou. 

=begin
INPUT is a text string
OUTPUT is a integer representing the longest continious chain of vowels in the given input string

ALGO
intialize longest_vowel_chain  and set to 0 
intialze current_longest and set to 0
split string into chars array and iterate through each character
if character is a vowel then increment current_longest by 1
  if character is not a vowel than set longest_vowel_chain to the value of current_longest and reset current_longest


    return longest_vowel_chain
=end
VOWELS = %w(a e i o u)
def vowel_chain(str)
  longest_vowel_chain = 0
  current_longest = 0
  str.chars.each do |char|
    if VOWELS.include?(char.downcase)
      current_longest += 1
    else
      current_longest = 0
    end
    longest_vowel_chain = current_longest if current_longest > longest_vowel_chain
  end
  longest_vowel_chain
end

p vowel_chain("codewarriors") == 2
p vowel_chain("suoidea") == 3
p vowel_chain("iuuvgheaae") == 4
p vowel_chain("ultrarevolutionariees") == 3
p vowel_chain("strengthlessnesses") == 1
p vowel_chain("cuboideonavicuare") == 2
p vowel_chain("chrononhotonthuooaos") == 5
p vowel_chain("iiihoovaeaaaoougjyaw") == 8