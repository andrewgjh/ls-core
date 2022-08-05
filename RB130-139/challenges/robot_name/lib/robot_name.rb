class Robot
  @@robot_names = []

  def name
    return @name if @name
    @name = generate while @@robot_names.include?(@name) || @name.nil?
    @@robot_names << @name
    @name
  end

  def reset
    @@robot_names.delete(@name)
    @name = nil
  end

  private

  def generate
    name = ""
    2.times { name << rand(65..90).chr }
    3.times { name << rand(0..9).to_s }
    name
  end
end
