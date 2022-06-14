
def center_of(text)
  text_length = text.size
  middle = text_length / 2.0
  if text_length.even?
    middle = middle.ceil(0)
    left = middle - 1
    text[left] + text[middle]
  else
    text[middle.truncate]
  end
end


def center_of(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'