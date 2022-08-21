require "sinatra"
require "sinatra/reloader"
require 'tilt/erubis'
require "yaml"

USERS = YAML.load_file('public/users.yaml')
set :port, 9494

before do
  @users = USERS.keys
end

helpers do
  def count_interests
    interest_count = 0
    USERS.each do |_, user|
      interest_count += user[:interests].count if user[:interests]
    end
    interest_count
  end

  def count_users
    USERS.count
  end 
end

get '/user/:username' do |username|
  @username = username.to_sym
  @email = USERS[@username][:email]
  @interests = USERS[@username][:interests].join(", ")

  erb :user
end



get '/' do
 
  erb :main



end

# { 
#   jamy: 
#     { 
#       email: "jamy.rustenburg@gmail.com", 
#       interests: ["woodworking", "cooking", "reading"] 
#     }, 
#   nora: 
#     { 
#       email: "nora.alnes@yahoo.com", 
#       interests: ["cycling", "basketball", "economics"] 
#     }, 
#   hiroko: 
#     { 
#       email: "hiroko.ohara@hotmail.com", 
#       interests: ["politics", "history", "birding"] 
#     } 
#   }
