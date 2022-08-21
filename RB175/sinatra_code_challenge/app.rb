require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get '/' do
  @files = Dir["public/*"].map do |file| 
    File.basename(file)
  end.sort!
  @files.reverse! if params[:sort] == "desc"
  erb :files
end

# get "/public/:file" do 
#   filename = params["file"]
#   send_file File.join(settings.public_folder, filename)
# end


# require "sinatra"
# require "sinatra/reloader"
# require "tilt/erubis"

# get "/" do
#   @testfile = Dir.glob("public/*")
#   p @testfile
#   @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
#   @files.reverse! if params[:sort] == "desc"
#   erb :files
# end