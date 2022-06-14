# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.

# def letter_case_count(text)
#   counter_hsh = {lowercase: 0, uppercase:0, neither: 0}
#   text.each_char do |char|
#     if char.ord.between?(97,122)
#       counter_hsh[:lowercase] += 1
#     elsif char.ord.between?(65,90)
#       counter_hsh[:uppercase] += 1
#     else
#       counter_hsh[:neither] +=1
#     end
#   end
#   counter_hsh
# end

def letter_case_count(text)
  counter_hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  text.split("").each_with_object(counter_hsh) do |cur, mem|
    if cur.ord.between?(97, 122)
      mem[:lowercase] += 1
    elsif cur.ord.between?(65, 90)
      mem[:uppercase] += 1
    else
      mem[:neither] += 1
    end
  end
end

def letter_case_count(text)
  lowercase = text.count('a-z')
  uppercase = text.count('A-Z]')
  neither = text.size - lowercase - uppercase
  { lowercase: lowercase, uppercase: uppercase, neither: neither }
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
