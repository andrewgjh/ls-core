
# def block_word?(word)
#   block_hsh = {
#   "B" => "O",
#   "X" => "K",   
#   "D" => "Q",   
#   "C" => "P",
#   "N" => "A",
#   "G" => "T",   
#   "R" => "E",
#   "F" => "S",  
#   "J" => "W",
#   "H" => "U",
#   "V" => "I",
#   "L" => "Y",
#   "Z" => "M"
# }
#   word.chars.all? do |char|
#     before_delete = block_hsh.clone
#     after_delete = block_hsh.delete_if do |k,v| 
#       capital_char = char.upcase
#       k == capital_char || v == capital_char
#     end
#     before_delete != after_delete
#   end
# end

p "STRING".count("ST")

# 

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end

def block_word?(string)
  up_string = string.upcase
  BLOCKS.all? { |block| up_string.count(block) <= 1 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true