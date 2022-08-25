require "sinatra"
require "sinatra/reloader"
require 'erubis'
require 'redcarpet'


def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true)
  markdown.render(text)
end

def file_exist(path)
  unless File.exist?(path)
    session[:message] = "'#{File.basename(path)}' does not exist."
    redirect '/'
  end
end

def load_content(file_path)
  case File.extname(file_path)
  when '.md' then render_markdown(File.read(file_path))
  when ".txt"
    headers["Content-Type"] = "text/plain"
    File.read(file_path)
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
    @files = []
    path = File.join(data_path, "*")
    Dir[path].each do |entry|
    @files << File.basename(entry) if File.file?(entry)
    end
end

get '/' do
  erb :index
end

get '/:filename' do |filename| 
  file_path = File.join(data_path, filename)
  file_exist(file_path)
  load_content(file_path)
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