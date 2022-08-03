# frozen_string_literal: true

def zip(arr1, arr2)
  arr1.map.with_index do |el, idx|
    [el, arr2[idx]]
  end
end

p [1, 2, 3].zip([4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
