# implicit block

def do_times(num)
  counter = 0
  while counter < num
    yield counter if block_given?
    counter += 1
  end
  num
end


# explicit block
def times(num, &block)
  counter = 0
  while counter < num
    block.call(num)
    num += 1
  end
end
