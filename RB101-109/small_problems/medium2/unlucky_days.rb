
# def friday_13th(yr)
#   unlucky_num = 0
#   (1..12).each do |month|
#     if Time.new(yr, month, 13).friday?
#       unlucky_num += 1
#     end
#   end
#   unlucky_num
# end


# p friday_13th(2015) == 3
# p friday_13th(1986) == 1
# p friday_13th(2019) == 2




require 'date'

# def friday_13th(year)
#   unlucky_count = 0
#   thirteenth = Date.civil(year, 1, 13)
#   12.times do
#     unlucky_count += 1 if thirteenth.friday?
#     thirteenth = thirteenth.next_month
#   end
#   unlucky_count
# end

def months_with_five_fridays(yr)
  total_fridays = Hash.new(0)
  start_year = Date.new(yr, 1, 1)
  days_away_to_friday = if start_year.cwday <= 5
                          5 - (start_year.cwday)
                        elsif start_year.cwday == 6
                          6
                        else
                          5
                        end
  
  the_fridays = start_year + days_away_to_friday

  while the_fridays.year == yr
    month = the_fridays.month
    total_fridays[month] += 1
    the_fridays += 7
  end
  total_fridays.select {|_month, fridays| fridays >= 5}.keys
end

p months_with_five_fridays(2017)
