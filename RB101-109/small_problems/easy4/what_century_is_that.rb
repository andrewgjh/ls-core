# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# def century(yr)
#   century = yr / 100
#   century += 1 unless yr % 100 == 0
#   century_str = century.to_s
#   case century_str[-1]
#   when "1"
#     if century_str[-2] == "1"
#       "#{century}th"
#     else
#       "#{century}st"
#     end
#   when "2"
#     if century_str[-2] == "1"
#       "#{century}th"
#     else
#       "#{century}nd"
#     end
#   when "3"
#     if century_str[-2] == "1"
#       "#{century}th"
#     else
#       "#{century}rd"
#     end
#   else "#{century}th"
#   end
# end

def century(yr)
  century = yr / 100
  century += 1 unless yr % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  case century % 10
  when 1 then "st"
  when 2 then "nd"
  when 3 then "rd"
  else "th"
  end
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
