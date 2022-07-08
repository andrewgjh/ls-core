=begin
INPUT is a string 
OUTPUT is an integer that represents the difference between total1 and total2
where total1 is the concatenation of all the characters char code 
and total2 is total1 where all 7s are replaced with 1s

ALGO
split chars into array 
map and call ord on each element and then to back to string and then join 
this is total1
then call gsub on 7 and turn to 1

return total2.int - total1.int

=end


def calc(string)
  total1 = string.chars.map {|char| char.ord.to_s}.join
  total2 = total1.gsub('7', '1')
  total1_sum = total1.chars.map(&:to_i).sum
  total2_sum = total2.chars.map(&:to_i).sum
  total1_sum - total2_sum
end    
    
    
p calc('abcdef') == 6
p calc('ifkhchlhfd') == 6
p calc('aaaaaddddr') == 30
p calc('jfmgklf8hglbe') == 6
p calc('jaam') == 12
p calc('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ') == 96