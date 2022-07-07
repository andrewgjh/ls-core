# write a method that finds the longest common prefix string amonst an array of strings

# if ther is no common prefix return an empty string

#INPUT is an array of strings 

#OUTPUT is a string of characters that each element in the input array has as its prefix
=begin
#ALGO 
initialize an empty string variable
iterate through each character in the first word of the array 
use all? method to check that every character at that same index in the array of words is the same. 
  if it is the same add the character into my final return string variable
  if it is not the same character then break out of the iteration
=end

def common_prefix(str_arr)
  final_prefix = ""
  str_arr[0].chars.each_with_index do |char,index|
    if str_arr.all? {|word| word[index] == char}
      final_prefix << char
    else
      break
    end
  end
  final_prefix
end


p common_prefix(['flower','flow', "flight"]) == "fl"
p common_prefix(['dog','racecar', "car"]) == ""
p common_prefix(['interspecies','interstellar', "interstate"]) == "inters"
p common_prefix(['trhone','dungeon']) == ""
p common_prefix(['throne','throne']) == "throne"