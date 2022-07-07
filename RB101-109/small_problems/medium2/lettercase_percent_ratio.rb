def letter_percentages(str)
  total_char = str.size.to_f
  lowercase = (str.count "a-z")/total_char * 100
  uppercase = (str.count "A-Z")/total_char * 100
  neither = (str.count "^a-zA-Z")/total_char * 100
  {
    lowercase: lowercase.round(1),
    uppercase: uppercase.round(1),
    neither: neither.round(1)
  }
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

p letter_percentages("abcdefGHI")