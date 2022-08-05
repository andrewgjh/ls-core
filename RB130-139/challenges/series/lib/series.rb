class Series
  def initialize(int_str)
    @int_arr = int_str.chars.map(&:to_i)
  end

  def slices(size)
    raise ArgumentError if size > @int_arr.size
    @int_arr.each_cons(size).to_a
  end
end
