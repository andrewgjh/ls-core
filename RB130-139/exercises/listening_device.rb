class Device
  def initialize
    @recordings = []
  end

  def play
    puts @recordings
  end

  def listen
    record(yield) if block_given?
  end

  def record(recording)
    @recordings << recording
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
