MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

# The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

# You may not use ruby's Date and Time classes.

def time_of_day(int)
  updated_time = Time.new(2022, 6, 10) + int * 60
  updated_time.strftime("%H:%M")
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"

p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

# def time_of_day(int)
#   hr, minutes = int.divmod(MINUTES_PER_HOUR)
#   hr %= HOURS_PER_DAY if hr.abs >= HOURS_PER_DAY
#   hr += HOURS_PER_DAY if hr.negative?
#   format('%02d:%02d', hr, minutes)
# end

# def time_of_day(int)
#   positive_mins = int % MINUTES_PER_DAY
#   hr, minutes = positive_mins.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hr, minutes)
# end

# def normalize_minutes_to_0_through_1439(minutes)
#   while minutes < 0
#     minutes += MINUTES_PER_DAY
#   end

#   minutes % MINUTES_PER_DAY
# end

# def time_of_day(delta_minutes)
#   delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
#   hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
#   format('%02d:%02d', hours, minutes)
# end

# p time_of_day(0) #== "00:00"
# p time_of_day(-3) #== "23:57"
# p time_of_day(-5)
# p time_of_day(35) #== "00:35"
# p time_of_day(-1437) #== "00:03"
# p time_of_day(3000) #== "02:00"
# p time_of_day(800) #== "13:20"
# p time_of_day(-4231) #== "01:29"
