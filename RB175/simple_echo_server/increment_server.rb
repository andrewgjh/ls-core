# frozen_string_literal: true

require 'socket'

def parse_request(request_line)
  http_method, full_path, version = request_line.split
  path, params = full_path.split('?')
  params = (params || "").split('&').map { |pair| pair.split('=') }.to_h
  [http_method, path, params]
end

def rand_color
  hue = rand(359)
  saturation = rand(100)
  lightness = rand(100)
  [hue, saturation, lightness]
end

server = TCPServer.new('localhost', 3005)
puts 'Listening on Port 3005'

loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  http_method, path, params = parse_request(request_line)
  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  hue, saturation, lightness = rand_color
  client.puts "<html>"
  client.puts "<body style='background:hsl(#{hue}, #{saturation}%, #{lightness}%);'>"
  client.puts "<pre>"
  client.puts request_line
  client.puts "</pre>"
  hue, saturation, lightness = rand_color
  client.puts "<h1 style='text-align:center;color:hsl(#{hue}, #{saturation}%, #{lightness}%);'>Counter</h1>"

  number = params["number"].to_i
  client.puts "<p>The current number is #{number}.</p>"
  client.puts "<a href='?number=#{number + 1}'>Add One</a>"
  client.puts "<a href='?number=#{number - 1}'>Minus One</a>"
  client.puts "</body>"
  client.puts "</html>"
  client.close
end
