
# class Diamond
#   def self.make_diamond(end_letter)
#     spacing = end_letter.ord - "A".ord + 1
#     center = 1
#     top = ("A"...end_letter).map do |letter|
#       spacing -= 1
#       case letter
#       when "A"
#         "#{" "* spacing}#{letter}#{" "* spacing}\n"
#       when "B"
#          "#{" "* spacing}#{letter}#{" "* center}#{letter}#{" "* spacing}\n"
#       else
#         center += 2
#         "#{" "* spacing}#{letter}#{" "* center}#{letter}#{" "* spacing}\n"
#       end
#     end
#     center += 2 unless end_letter == "B"
#     middle = ["#{end_letter}#{" "* center}#{end_letter}\n"]
#     middle = ["A\n"] if end_letter == "A"
#     bottom = top.reverse
#     diamond =  top + middle + bottom
#     diamond.join
#   end
# end

class Diamond
  def self.make_diamond(letter)
    range = ('A'..letter).to_a + ('A'...letter).to_a.reverse
    diamond_width = max_width(letter)

    range.each_with_object([]) do |let, arr|
      arr << make_row(let).center(diamond_width)
    end.join("\n") + "\n"
  end

  class << self
    private

    def make_row(letter)
      return "A" if letter == 'A'
      return "B B" if letter == 'B'

      letter + determine_spaces(letter) + letter
    end

    def determine_spaces(letter)
      all_letters = ['B']
      spaces = 1

      until all_letters.include?(letter)
        current_letter = all_letters.last
        all_letters << current_letter.next
        spaces += 2
      end

      ' ' * spaces
    end

    def max_width(letter)
      return 1 if letter == 'A'

      determine_spaces(letter).count(' ') + 2
    end
  end
end