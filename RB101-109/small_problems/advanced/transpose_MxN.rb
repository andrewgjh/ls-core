def transpose(matrix)
  placeholder = Array.new(matrix[0].size, Array.new(matrix.size, nil))
  placeholder.map.with_index do |row, r_idx|
    row.map.with_index do |_, c_idx| 
      matrix[c_idx][r_idx]
    end
  end
end



p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]