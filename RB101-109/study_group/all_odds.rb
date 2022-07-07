=begin
INPUT IS A string of integers
OUTPUT is a integer representing all the different integers that can be created that are odd numbers

ALGO

initialize a variable odd_nums and set to 0 

string size times loop through the character integers
inner looper starting from outer loop index up to size of the string 
slice the string from the outer loop index to inner loop index, to it into an integer and check if it is odd
if odd increment odd_nums by 1 


  return odd_nums
=end


def all_odds(string_int)
  odd_nums = 0 
  string_int.size.times do |start|
    start.upto(string_int.size - 1) do |ending|
      odd_nums +=1 if (string_int[start..ending]).to_i.odd?
    end
  end
  odd_nums
end

p all_odds("1341") == 7
p all_odds("1357") == 10
p all_odds("13471") == 12
p all_odds("134721") == 13
p all_odds("1347231") == 20
p all_odds("13472315") == 28