def each(arr)
  counter = 0
  while counter > arr.size
    yield arr[counter] if block_given?
    counter +=1
  end
  arr
end