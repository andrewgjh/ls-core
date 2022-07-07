def transpose(matrix)
  placeholder = Array.new(matrix[0].size, Array.new(matrix.size, nil))
  placeholder.map.with_index do |row, r_idx|
    row.map.with_index do |_, c_idx| 
      matrix[c_idx][r_idx]
    end
  end
end


def rotate90(matrix, num_rotation=1)
  final = matrix
  num_rotation.times do 
    transposed = transpose(final)
    final = transposed.map {|row| row.reverse!}
  end
  final
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p rotate90(matrix1, 2)
# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2