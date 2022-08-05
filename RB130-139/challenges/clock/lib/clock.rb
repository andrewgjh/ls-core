class Clock
  MIN_PER_HOUR = 60
  HOURS_PER_DAY = 24

  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def self.at(hour, min= 0)
    Clock.new(hour, min)
  end

  def to_s
    format("%02d:%02d", hour, min)
  end

  def -(mins)
    self.min -= mins
    adjust
    Clock.new(hour, min)
  end

  def +(mins)
    self.min += mins
    adjust
    Clock.new(hour, min)
  end

  def ==(other)
    hour == other.hour &&
      min == other.min
  end

  protected

  attr_reader :hour, :min

  private

  attr_writer :hour, :min

  def adjust
    adjust_min
    adjust_hr
  end

  def adjust_hr
    if hour.negative?
      until hour.positive?
        self.hour += HOURS_PER_DAY
      end
    elsif hour >= 24
      until hour <= 23
        self.hour -= HOURS_PER_DAY
      end
    end
  end

  def adjust_min
    if min.negative?
      until min.positive?
        self.min += MIN_PER_HOUR
        self.hour -= 1
      end
    elsif min > 60
      until min <= 59
        self.min -= MIN_PER_HOUR
        self.hour += 1
      end
    end
  end
end

# class Clock
#   SECONDS_PER_MIN = 60
#   attr_reader :clock
#   def initialize(hour, min)
#     @clock = Time.local(2022, 8, 3, hour, min)
#   end

#   def self.at(hour, min= 0)
#     @@time = Clock.new(hour, min)
#   end

#   def to_s
#     @clock.strftime("%H:%M")
#   end

#   def -(mins)
#     @clock -= mins * SECONDS_PER_MIN
#     Clock.new(@clock.hour, @clock.min)
#   end

#   def +(mins)
#     @clock += mins * SECONDS_PER_MIN
#     Clock.new(@clock.hour, @clock.min)
#   end
#   def ==(other)
#     @clock.hour == other.clock.hour &&
#     @clock.min == other.clock.min
#   end

# end

# class Clock
#   attr_reader :hour, :minute

#   ONE_DAY = 24 * 60

#   def initialize(hour, minute)
#     @hour = hour
#     @minute = minute
#   end

#   def self.at(hour, minute=0)
#     new(hour, minute)
#   end

#   def +(add_minutes)
#     minutes_since_midnight = compute_minutes_since_midnight + add_minutes
#     while minutes_since_midnight >= ONE_DAY
#       minutes_since_midnight -= ONE_DAY
#     end

#     compute_time_from(minutes_since_midnight)
#   end

#   def -(sub_minutes)
#     minutes_since_midnight = compute_minutes_since_midnight - sub_minutes
#     while minutes_since_midnight < 0
#       minutes_since_midnight += ONE_DAY
#     end

#     compute_time_from(minutes_since_midnight)
#   end

#   def ==(other_time)
#     hour == other_time.hour && minute == other_time.minute
#   end

#   def to_s
#     format('%02d:%02d', hour, minute);
#   end

#   private

#   def compute_minutes_since_midnight
#     total_minutes = 60 * hour + minute
#     total_minutes % ONE_DAY
#   end

#   def compute_time_from(minutes_since_midnight)
#     hours, minutes = minutes_since_midnight.divmod(60)
#     hours %= 24
#     self.class.new(hours, minutes)
#   end
# end
