# Write a method that will take a short line of text, and print it within a box.

def print_in_box(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

# def print_in_box(text)
#   num_dashes = "-" * text.size
#   num_whitespace = " " * text.size
#   puts "+-#{num_dashes}-+
# | #{num_whitespace} |
# | #{text} |
# | #{num_whitespace} |
# +-#{num_dashes}-+"
# end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
