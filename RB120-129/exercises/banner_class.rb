class Banner
  def initialize(message, width=message.size)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, *message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :width

  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def message_line
    if message.size > width
      max_each_line(message, width - 6).map do |line|
        "| #{line.center(width)} |"
      end
    else
      ["| #{@message} |"]
    end
  end

  def max_each_line(message, max)
    words = message.split
    final_arr = []
    working_arr = []
    words.each do |word|
      if working_arr.join(" ").size < max
        working_arr << word
      else
        final_arr << working_arr
        working_arr = [word]
      end
    end
    final_arr << working_arr
    p final_arr.map { |arr| arr.join(" ") }
end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
banner = Banner.new('')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
