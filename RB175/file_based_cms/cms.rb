require "sinatra"
require "sinatra/reloader"
require 'erubis'
require 'redcarpet'


USERS = { "admin"=>"topsecretpassword"}

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
  markdown.render(text)
end

def find_file(path)
  unless File.exist?(path)
    session[:message] = "'#{File.basename(path)}' does not exist."
    redirect '/'
  end
end

def exists?(name)
  Dir[data_path+"/*"].any? {|filename| File.basename(filename) == name}
end

def load_content(file_path)
  content = File.read(file_path)
  case File.extname(file_path)
  when '.md'
    erb render_markdown(content)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  else 
    send_file file_path
  end
end

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path("../test/data", __FILE__)
  else
    File.expand_path("../data", __FILE__)
  end
end

def create(file_name)
  file_name += '.txt' if File.extname(file_name) == ""
  File.open(File.join(data_path, file_name), 'w')
  session[:message] = "#{file_name} has been created"
end

def authenticated?
  session[:token]
end

def user_exist?(username)
  session[:message] = "User does not exist" unless USERS.key?(username)
  USERS.key?(username)
end

def password_check(username, password)
  session[:message] = "The password is incorrect" unless USERS[username] == password
  USERS[username] == password
end

def verify(username, password)
  if user_exist?(username) && password_check(username, password)
    session[:token] = {username: username}
  end
end


configure do
  enable :sessions
  set :session_secret, 'secret_key'
  
end

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end

  def hattr(text)
    Rack::Utils.escape_path(text)
  end
end

before do
  unless request.path == "/login"
    redirect "/login", 303 unless authenticated?
  else
    redirect '/' if authenticated?
  end
end


get '/' do
    @files = []
    path = File.join(data_path, "*")
    Dir[path].each do |entry|
      @files << File.basename(entry) if File.file?(entry)
    end
  erb :index
end


get '/new' do
  erb :new
end

post '/new' do

  new_file = params[:document_name]
  unless exists?(new_file)
    create(new_file)
    redirect '/'
  else
    session[:message] = "#{new_file} already exists."
    erb :index
  end
  
end

get '/login' do
  erb :login
end

post '/login' do
  username = params[:username]
  password = params[:password]
  verify username, password
  if authenticated?
    redirect "/"
  else
    redirect "/login"
  end
end

get '/signout' do
  session[:token] = nil
  session[:message] = "You are logged out."
  redirect '/login'
end



get '/:filename' do |filename| 
  file_path = File.join(data_path, filename)
  find_file(file_path)
  load_content(file_path)
end

post "/:filename/delete" do |filename|
  File.delete(File.join(data_path, filename))
  session[:message] = "#{filename} has been deleted from the file system."
  redirect '/'
end

get '/:filename/edit' do |filename|
  file_path = File.join(data_path, filename)
  @filename = filename
  @content = File.read(file_path)
  erb :edit
end

post '/:filename' do |filename|
  file_path = File.join(data_path, filename)
  updated_content = params[:file_content]
  File.write(file_path, updated_content)
  session[:message] = "#{filename} has been successfully changed."
  redirect "/"
end


