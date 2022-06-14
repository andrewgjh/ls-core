# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.
VOWELS = %w(a e i o u)

def remove_vowels(str_arr)
  str_arr.each do |str|
    str.gsub!(/[aeiou]/i, "")
  end
end

# def remove_vowels(str_arr)
#   str_arr.map do |str|
#     new_str = ""
#     str.each_char do |char|
#       new_str << char unless VOWELS.include?(char.downcase)
#     end
#     new_str
#   end
# end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
