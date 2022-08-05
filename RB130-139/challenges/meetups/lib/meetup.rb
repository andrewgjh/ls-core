require 'date'

class Meetup
  attr_reader :short_list

  def initialize(year, month)
    @month = month
    @month_year = Date.civil(year, month)
    @short_list = []
  end

  def day(weekday, schedule)
    while @month_year.mon == @month
      func = "#{weekday.downcase}?".to_sym
      @short_list << @month_year if @month_year.send(func)
      @month_year += 1
    end
    find(schedule)
  end

  private

  def find(sched)
    case sched.downcase
    when "first" then @short_list[0]
    when "second" then @short_list[1]
    when "third" then @short_list[2]
    when "fourth" then @short_list[3]
    when "fifth" then @short_list[4]
    when "last" then @short_list[-1]
    when "teenth"
      @short_list.find do |date|
        (13..19).member?(date.mday)
      end
    end
  end
end

# class Meetup
#   attr_reader :short_list
#   def initialize(year, month)
#     @month = month
#     @month_year = Date.civil(year, month)
#     @short_list = []
#   end

#   def day(weekday, schedule)
#     while @month_year.mon == @month
#       func = weekday.downcase + "?"
#       @short_list << @month_year.clone  if @month_year.send(func.to_sym)
#       @month_year = @month_year.next
#     end
#     find(schedule)
#   end

#   private

#   def find(sched)
#     case sched.downcase
#     when "first" then @short_list[0]
#     when "second" then @short_list[1]
#     when "third" then @short_list[2]
#     when "fourth" then @short_list[3]
#     when "fifth" then @short_list[4]
#     when "last" then @short_list[-1]
#     when "teenth"
#       @short_list.find do |date|
#         (13..19).member?(date.mday)
#       end
#     end
#   end

# end
