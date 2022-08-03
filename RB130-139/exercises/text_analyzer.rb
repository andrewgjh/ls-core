# class TextAnalyzer
#   def process
#     File.open("./sample_text.txt") do |file|
#       yield(file)
#     end
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process do |file|
#   line_break = file.select do |line|
#     line == "\n"
#   end
#   paragraphs = line_break.size + 1
#   puts "#{paragraphs} paragraphs"
# end
# analyzer.process do |file|
#   lines = file.each_line.count
#   puts "#{lines} lines"
# end
# analyzer.process do |file|
#   word_count = 0
#   file.each_line do |line|
#     word_count += line.split.size
#   end
#   puts "#{word_count} words"
# end

class TextAnalyzer
  def process
    File.open("./sample_text.txt") do |file|
      yield(file.read)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts text.split("\n\n").count }
analyzer.process { |text| puts text.split("\n").count }
analyzer.process { |text| puts text.split(" ").count }
