DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
# Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

def normalize(deg)
  while deg < 0
    deg += 360
  end
  while deg > 360
    deg -= 360
  end
  deg
end

def dms(deg)
  deg = normalize(deg)
  degree = deg.truncate
  degree_remainder = (deg - degree)
  minutes = (degree_remainder * MINUTES_PER_DEGREE).truncate
  minutes_remainder = (degree_remainder * MINUTES_PER_DEGREE - minutes).round(2)
  seconds = (minutes_remainder * SECONDS_PER_MINUTE).truncate
  format("%d#{DEGREE}%02d'%02d\"", degree, minutes, seconds)
end

# def dms(degrees_float)
#   degrees_float = normalize(degrees_float)
#   total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end

# puts dms(30) == %(30°00'00")
# puts dms(76.73) == %(76°43'48")
# puts dms(254.6) == %(254°36'00")
# puts dms(93.034773) == %(93°02'05")
# puts dms(0) == %(0°00'00")
# puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(400) == %(40°00'00")
p dms(-40) == %(320°00'00")
p dms(-420) == %(300°00'00")
