require "sinatra"
require "sinatra/reloader" if development?
require 'sinatra/content_for'
require "tilt/erubis"
require 'uuid'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

before do
  session[:lists] ||= []
end

helpers do

  def h(text)
    Rack::Utils.escape_html(text)
  end

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
    list = session[:lists].find {|list| list[:name] == name}
    return list if list
    session[:error] = "The #{name} list you entered does not exist."
    redirect '/lists'
  end

  def all_complete?(list_items)
    list_items.all? {|item| item[:completed] == true} && list_items.size > 0
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

  def css_classes(list)
    "complete" if all_complete?(list[:todos])
  end

  def todo_sort(todos, &block)
    completed = {}
    incomplete = {}

    todos.each do |element|
      if element[:completed]
        completed[element] = element[:id]
      else
        incomplete[element] = element[:id]
      end
    end
    incomplete.each(&block)
    completed.each(&block)
  end

end


get "/" do
  redirect '/lists'
end

# View list of lists
get "/lists" do
  @lists = session[:lists]
  @lists = @lists.sort_by {|list| all_complete?(list[:todos]) ? 1 : 0}

  erb :lists, layout: :layout
end

# Render the new list form
get '/lists/new' do
  erb :new_list
end

#Render single to do list
get '/lists/:name' do |name|
    @name = name
    @list = find_list(name)
    erb :single_list
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

#Delete a list
post '/lists/:name/destroy' do |name|
  delete_index = session[:lists].index {|list| list[:name] == name}
  session[:lists].delete_at(delete_index)

  if env['HTTP_X_REQUESTED_WITH'] == "XMLHttpRequest"
    '/lists'
  else
    session[:success] = "The #{name} list has been deleted"
    redirect '/lists'
  end

end

#Add new todo item
post '/lists/:name' do |name|
  list = find_list(name)
  if error_item(params[:list_item])
    session[:error] = error_item(params[:list_item])
  else 
    id = UUID.new.generate
    list[:todos] << { id: id, list_item: params[:list_item], completed: false }
    session[:success] = "The Todo Item was Added."
  end
    redirect "/lists/#{name}"
end

#Mark all todos in list as complete
post '/lists/:name/complete_all' do |name|
  list = find_list(name)
  mark_all_complete(list)
  session[:success] = "#{name} have all been marked completed."
  redirect "/lists/#{name}"
end

#Delete a todo item from a list
post '/lists/:name/todos/:id/destroy' do |name, id|
    list = find_list(name)
    list[:todos].delete_if{|todo| todo[:id] == id}
    if env['HTTP_X_REQUESTED_WITH'] == "XMLHttpRequest"
      status 204
    else
      session[:success] = 'The list has been deleted.'
      redirect "/lists/#{name}" 
    end
end

#Toggle todo item as completed or incomplete 
post '/lists/:name/todos/:id' do |name, id|
    list = find_list(name)
    is_completed = params[:completed] == "true"
    todo = list[:todos].find {|todo| todo[:id] == id}
    todo[:completed] = is_completed
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


