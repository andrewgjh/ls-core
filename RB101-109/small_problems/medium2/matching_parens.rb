# def balanced?(text)
#   characters = text.chars
#   stack = []
#   characters.each do |char|
#     case char
#     when "("
#       stack.push char
#     when ")"
#       if stack.include?("(")
#         stack.pop
#       else
#         stack.push char
#       end
#     end
#   end
#   stack.empty?
# end
PARENS = {
  "(" => ")",
  "{" => "}",
  "<" => ">",
  "[" => "]"
}

def balanced_parens?(text)
  characters = text.chars
  stack = []
  characters.each do |char|
    if PARENS.has_key?(char)
      stack.push(PARENS[char])
    elsif PARENS.has_value?(char)
      return false unless stack.pop == char
    end
  end
  stack.empty?
end


# def balanced?(text)
#   characters = text.chars
#   stack = []
#   characters.each do |char|
#     case char
#     when "("
#       stack.push ")"
#     when ")"
#       return false unless stack.pop == char
#     end
#   end
#   stack.empty?
# end


# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false


# p balanced_parens?('What (is) this?') == true
# p balanced_parens?('What is) this?') == false
# p balanced_parens?('What (is this?') == false
# p balanced_parens?('((What) (is this))?') == true
# p balanced_parens?('((What)) (is this))?') == false
# p balanced_parens?('Hey!') == true
# p balanced_parens?(')Hey!(') == false
# p balanced_parens?('What ((is))) up(') == false
p balanced_parens?("[]{}()") == true
p balanced_parens?('L<e(t{[s] play pin}g po)n>g') == true