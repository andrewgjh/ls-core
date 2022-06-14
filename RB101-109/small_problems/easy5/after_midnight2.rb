MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def extract_time(str)
  hr = str[0, 2].to_i
  minutes = str[3, 4].to_i
  [hr, minutes]
end

# def before_midnight(time_str)
#   hour, minutes = extract_time(time_str)
#   return 0 if hour == 0 && minutes == 0
#   minutes_needed = MINUTES_PER_HOUR - minutes
#   hours_needed = HOURS_PER_DAY - hour - 1
#   hours_needed * MINUTES_PER_HOUR + minutes_needed
# end

# def after_midnight(time_str)
#   hour, minutes = extract_time(time_str)
#   return 0 if hour == 24 && minutes == 0
#   hour * MINUTES_PER_HOUR + minutes
# end

# def after_midnight(time_str)
#   hours, minutes = time_str.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end

# def before_midnight(time_str)
#   delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
#   delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
#   delta_minutes
# end

def after_midnight(time)
  hour, minute = time.split(":").map(&:to_i)
  set_time = Time.new(2022, 1, 1, hour, minute, 0)
  ((Time.new(2022, 1, 1) - set_time).abs / 60 % 1440).to_i
end

def before_midnight(time)
  hour, minute = time.split(":").map(&:to_i)
  set_time = Time.new(2022, 1, 1, hour, minute, 0)
  ((Time.new(2022, 1, 2) - set_time).abs / 60 % 1440).to_i
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p before_midnight('03:34') == 1226
p before_midnight('13:22') == 638
p before_midnight('22:51') == 69
p before_midnight('06:34') == 1046
p before_midnight('15:01') == 539
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
