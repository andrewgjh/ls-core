# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

# questions are there any spaces or other characters or only alphabetical characters
# any capitalize letters?
# if yes do they come before lowercase like ASCII code?
# or are they just considered the same letter

# ALGO
#initialize variable for final return str
# intialize to starting char A

# start a loop that goes through each character and stops when there are no more characters

#   # use comparison operator <==>
#   compared the current char and next char
#   if next char is bigger than or equal 
#     push the current char into the final str 
#     increment the index 
#   if next char is smaller
#     then empty the final str
#     increment the index
# when loop is completed return the final str

def longest(str)
  longest_strs = []
  counter = 0
  final_str = ""
  loop do
    final_str << str[counter] if final_str.empty?
    case str[counter] <=> str[counter + 1]
    when -1
      final_str << str[counter + 1]
    when 0
      final_str << str[counter + 1]
    when 1
      longest_strs << final_str.dup
      final_str = ""
    end
    if counter >= str.length - 2
      longest_strs << final_str
      break
    end
    counter += 1
  end
  longest_strs.max {|a,b| a.size <=> b.size }
end


p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'
