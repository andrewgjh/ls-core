# def xor?(bool_1, bool_2)
#   bool_1 ^ bool_2
# end

# def xor?(bool_1, bool_2)
#   if bool_1 == true && bool_2 == true
#     false
#   elsif bool_1 == true && bool_2 == false
#     true
#   elsif bool_1 == false && bool_2 == true
#     true
#   elsif bool_1 == false && bool_2 == false
#     false
#   end
# end

def xor?(bool_1, bool_2)
  return true if bool_1 && !bool_2
  return true if !bool_1 && bool_2
  false
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
