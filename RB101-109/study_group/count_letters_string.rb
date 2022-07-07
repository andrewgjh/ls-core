
=begin
INPUT is a string
OUTPUT is a hash map with the occurences of each letter. key must be in sym

ALGO
initialize hash map and name it letter_occur and set default to 0
turn input string into chars array and iterate through it
turn the char into a sym and increment that key in the hash map by 1

=end



def letter_count(string)
  letter_occur = Hash.new(0)
  string.chars.each do |char|
    letter_occur[char.to_sym] += 1
  end
  letter_occur
end



p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}