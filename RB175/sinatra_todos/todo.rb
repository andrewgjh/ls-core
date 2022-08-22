require "sinatra"
require "sinatra/reloader"
require 'sinatra/content_for'
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end

helpers do

  def list_include?(name)
    session[:lists].any? { |list| list[:name] == name }
  end

  def error_list_name(list_name)
    if !valid_chars?(list_name)
      "The list name must be between 1 and 100 characters."
    elsif list_include?(list_name)
      "The list name must be unique."
    end
  end

  def valid_chars?(name)
    (1..100).cover? name.strip.size
  end

  def error_item(name) 
    if !(1..200).cover? name.strip.size
      "The list item must be between 1 and 200 characters."
    end
  end

  def find_list(name)
    session[:lists].find {|list| list[:name] == name}
  end

  def all_complete?(list_items)
    list_items.all? {|item| item[:completed] == true}
  end
  
  def has_tasks?(list)
    !list[:todos].empty?
  end

  def mark_all_complete(list)
    list[:todos].each do |task|
      task[:completed] = true
    end
  end
  
  def count_completed(items)
    items.count {|item| item[:completed] == true}
  end

end

get "/" do
  redirect '/lists'
end

# View list of lists
get "/lists" do
  @lists = session[:lists]

  erb :lists, layout: :layout
end

# Render the new list form
get '/lists/new' do
  erb :new_list
end

#Render single to do list
get '/lists/:name' do |name|
  
  if list_include?(name)
    @name = name
    @list = find_list(name)
    p @list
    @list_complete = all_complete?(@list[:todos])
    erb :single_list
  else
    session[:error] = "The list you entered does not exist."
    redirect '/lists'
  end
end

#Render edit name of list form
get '/lists/:name/edit' do |name|
  @name = name
  erb :edit
end

#Validate and change name of a list
post '/lists/:name/edit' do |name|
  list = find_list(name)
  @name = name
  if valid_chars?(params[:new_name])
    list[:name] = params[:new_name]
    session[:success] = "Successfully changed the name of the list to '#{params[:new_name]}'"
    redirect "/lists"
  else
    session[:error] = 'Please enter between 1 to 100 characters to rename list.'
    erb :edit
  end
end

post '/lists/:name/destroy' do |name|
  delete_index = session[:lists].index {|list| list[:name] == name}
  session[:lists].delete_at(delete_index)
  session[:success] = "The #{name} list has been deleted"
  redirect '/lists'
end

post '/lists/:name' do |name|
    if list_include?(name)
      list = session[:lists].find {|list| list[:name] == name}
      if error_item(params[:list_item])
        session[:error] = error_item(params[:list_item])
      else 
        list[:todos] << { list_item: params[:list_item], completed: false }
        session[:success] = "The Todo Item was Added."
      end
       redirect "/lists/#{name}"
    else
      session[:error] = 'This list does not exist. '
      erb :error
    end
end

post '/lists/:name/complete_all' do |name|
  list = find_list(name)
  mark_all_complete(list)
  session[:success] = "#{name} have all been marked completed."
  redirect "/lists/#{name}"
end

post '/lists/:name/todos/:id/destroy' do |name, id|
    id = id.to_i
    list = find_list(name)
    list[:todos].delete_at(id)
    session[:success] = 'The list has been deleted.'
    redirect "/lists/#{name}"
end

post '/lists/:name/todos/:id' do |name, id|
    id = id.to_i
    list = find_list(name)
    is_completed = params[:completed] == "true"
    list[:todos][id][:completed] = is_completed
    session[:success] = 'The todo has been updated.'
    redirect "/lists/#{name}"
end


# Create a new list
post '/lists' do
  list_name = params[:list_name]

  error = error_list_name(list_name)
  if error
    session[:error] = error
    erb :new_list
  else
    session[:lists] << { name: list_name, todos: [] }
    session[:success] = "The list has been created."
    redirect '/lists'
  end
end
