def transpose(matrix)
  matrix.map.with_index do |row, r_idx|
    row.map.with_index do |col, c_idx|
      matrix[c_idx][r_idx]
    end
  end
end


def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end


def transpose!(matrix)
  column_start = 0
  matrix.each_with_index do |row, row_idx|
    (column_start...row.size).each do |column_idx|
      matrix[row_idx][column_idx], matrix[column_idx][row_idx] = 
      matrix[column_idx][row_idx],matrix[row_idx][column_idx] 
    end
    column_start += 1
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

# new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
