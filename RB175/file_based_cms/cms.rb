require 'sinatra'
require 'sinatra/reloader'
require 'erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'



def cred_path 
  start_path = ENV['RACK_ENV'] == 'test' ? "test" : __dir__
  File.join(start_path, 'users.yml')
end

USERS = YAML.load_file(cred_path)


def reload_users
   File.open(cred_path, 'w') do |file|
    YAML.dump(USERS, file)
  end
end

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
  Dir[data_path + '/*'].any? { |filename| File.basename(filename) == name }
end

def load_content(file_path)
  content = File.read(file_path)
  case File.extname(file_path)
  when '.md'
    erb render_markdown(content)
  when '.txt'
    headers['Content-Type'] = 'text/plain'
    content
  else
    send_file file_path
  end
end

def data_path
  path_endpoint = ENV['RACK_ENV'] == 'test' ? 'test/data' : 'data'
  File.expand_path(path_endpoint, __dir__)
end

def create(file_name)
  file_name += '.txt' if File.extname(file_name) == ''
  File.open(File.join(data_path, file_name), 'w')
  session[:message] = "#{file_name} has been created"
end

def authenticated?
  session[:token]
end

def user_exist?(username)
  session[:message] = 'User does not exist' unless USERS.key?(username)
  USERS.key?(username)
end

def password_check(username, password)
  session[:message] = 'The password is incorrect' unless USERS[username] == password
  USERS[username] == password
end

def verify(username, password)
  session[:token] = { username: } if user_exist?(username) && password_check(username, password)
end

def user_signed_in?
  session.key?(:token) && !session[:token].nil?
end

def require_signed_in_user
  unless user_signed_in?
    session[:message] = 'You must be signed in to do that.'
    redirect '/'
  end
end

def admin_only
  unless session[:token] == { username: 'admin' }
    session[:message] = 'The resouce is only accessible by an administrator.'
    redirect '/'
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

get '/users' do
  admin_only
  erb :users
end

post '/users' do
  admin_only
  username = params[:username]
  password = params[:password]
  USERS[username] = BCrypt::Password.create(password)
  reload_users
  redirect '/users'
end

delete '/users/:account' do |account|  
  USERS.delete(account)
  reload_users
  status 204
end

get '/' do
  @files = []
  path = File.join(data_path, '*')
  Dir[path].each do |entry|
    @files << File.basename(entry) if File.file?(entry)
  end
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  require_signed_in_user

  new_file = params[:document_name]
  if exists?(new_file)
    session[:message] = "#{new_file} already exists."
    redirect '/'
  else
    create(new_file)
    redirect '/'
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
    session[:message] = 'Welcome'
    redirect '/'
  else
    redirect '/login'
  end
end

get '/signout' do
  session.delete(:token)
  session[:message] = 'You are logged out.'
  redirect '/login'
end

get '/:filename' do |filename|
  file_path = File.join(data_path, filename)
  find_file(file_path)
  load_content(file_path)
end

post '/:filename/delete' do |filename|
  require_signed_in_user
  File.delete(File.join(data_path, filename))
  session[:message] = "#{filename} has been deleted from the file system."
  redirect '/'
end

get '/:filename/edit' do |filename|
  require_signed_in_user
  file_path = File.join(data_path, filename)
  @filename = filename
  @content = File.read(file_path)
  erb :edit
end

post '/:filename' do |filename|
  require_signed_in_user
  file_path = File.join(data_path, filename)
  updated_content = params[:file_content]
  File.write(file_path, updated_content)
  session[:message] = "#{filename} has been successfully changed."
  redirect '/'
end
