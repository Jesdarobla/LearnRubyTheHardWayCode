require 'sinatra'
require 'fileutils'
require './lib/gothonweb/map.rb'


set :port, 8080
set :static, true
set :public_folder, "./static" #by default, public folder is public/ and Sinatra gets views from there.
set :views, "views" #As shown in public_folder, you can write it "./folder" or "folder"
enable :sessions # Used to activate sessions(persistent data for each user)
set :session_secret, 'BADSECRET'


#set a value in the session for later
#session[:room] = "central_corridor"

#get the room in another handler with
#current_room = session[:room]


# Testing authentication from Rack

=begin
use Rack::Auth::Basic, "Authorization Required" do |user, pass|
  # We need to make a check of user and pass, a simple one below.
  access_permitted = false
  if user == "admin" and pass == "admin"
    access_permitted = true
  end
  access_permitted #Need to learn more of this
end
=end



#Below we write code responsible for handling requests

get '/' do # this is the root route, basically things like www.google.es/
    session[:room] = 'START'
    redirect to('/game')
end

get '/game' do
  #session = params[:session]
  room = Map::load_room(session)
  #puts "Here's room in app.rb: ", room
  if room
    erb :show_room, :locals => {:room => room}
  else
    erb :you_died
  end
end

post '/game' do
  room = Map::load_room(session)
  action = params[:action]

  if room
    next_room = room.go(action) || room.go("*")

    if next_room
      Map::save_room(session, next_room)
    end

  redirect to ('/game')
  else
    erb :you_died
  end

end










get '/hello/' do
    erb :OLD_hello_form
end

post '/hello/' do


=begin
    Buckle up because I had to find out how this worked.
    In a nutshell, if you have a hash inside a hash, you can access the keys on the hash inside the hash.
    params is a hash, and :file is a key for something, that something is another hash.
    if you want to access a key inside the :file hash, for example, :filename (which is found in the :file hash)
    you need to call it like you would a normal hash,
    and you can do that as shown below with @filename

    As another example, if you did something like x = {"mozzarella" => "cheese"} and then
    you did something like y = { "hash" => x}, if you wanted to access x to get the key "mozzarella"
    you would call it like this: y["hash"]["mozzarella"]

=end

=begin
    @filename = params[:file][:filename] #contains the filename, such as "test.txt"
    file = params[:file][:tempfile] #contains the tempfile value of the :file hash

    filetext = File.read(file) # so we can pass it to the the erb and show it along the greeting.

    # If you want to write it to our directory /public
    #File.open("./public/#{@filename}", 'wb') do |f|
    #f.write(file.read)
=end
    greeting = params[:greeting] || "Hi there"
    name = params[:name] || "Nobody"

    erb :OLD_index, :locals => {'greeting' => greeting, 'name' => name}
    #erb :index, :locals => {'greeting' => greeting, 'name' => name, 'filetext' => filetext}

=begin # code below was used to understand how params[:file][:whatever] works.
    x = "Here's what params[:file] looks like: #{params[:file]}"
    y= "Here's what params[:file][:filename] looks like: #{params[:file][:filename]}"
    z= "Here's what params[:file][:tempfile] looks like: #{params[:file][:tempfile]}"
    return "x and Y: #{x} -------------- #{y}--------------#{z}"
=end
end

=begin
get '/hello/' do
    greeting = params[:greeting] || "Hi There" #Either use the value in params hash using the :greeting key, or use "Hi there"
     #erb is a function call here
    erb :index, :locals => {'greeting' => greeting}
    #For Sinatra, in previous line, we are calling erb method with index as first parameter and locals as second parameter.
    #A list of available options for 2nd parameter found in documentation.
end


#I'm creating a get request below that asks for a webpage called ayo.erb.
#Remember to create the webpage first or you'll get an error.
get '/ayo' do
    erb :ayo
end


get '/test1' do # Inspect HTTP request headers

  puts 'Request headers:'
  puts request.env.class
  'User agent: ' + request.env['HTTP_USER_AGENT']

end


# Routing with variables:

get '/test2/:x' do
  # :x is required for matching
  # Try /test2/testing
  # Will not match /test2 because no trailing slash provided
  # Will not match /test2/ because :x param is missing
  "x is #{params['x']}" #if you write /test2/testing, page will display "x is testing"
end


# REG EX is allowed
get '/test2.1/:y?' do |y|
  # :y is optional with the ?
  # Try /test2.1/testing
  # Will not match /y because trailing slash is required
  # Will match /y/ since :y is optional
  "y is #{y}"
end


#params is an object that hold variables passed to the server.
#In my tests, I've unsucessfully(for now) set any value to the params object from this get request.
#However, if I write any variable in the get request, like :id or :test or :x
# it will assign to the params object whatever value I introduce from my browser
#For example, if I write a get request that goes '/test3/:monster' and then from my
# browser I were to write something like '/test3/ugabuga', Sinatra will set a variable called
# ':monster' in the params object with the 'ugabuga' value. A test below.
get '/test3/:monster' do

  return params[:monster], " oh no, a monster."

end

get '/test4/' do
  content = File.read('Notes')
  return content
end

get '/test5/' do
  #We pass to the template ayo the local variable :saludo containing "Howdy"
  # :locals is used to pass local variables. Instance variables may also be used.
  erb :ayo, :locals => {:saludo => "Howdy"}
end





#Below tests for user sessions.


get '/set' do
  session[:mydata] = "My data123"
  'Complete'
end

get '/get' do
  "Data: #{session[:mydata]}"
end


#How to redirect

get '/goaway' do
  redirect '/' #Will redirect us to root
end



#We can return a lot of things from the Routing requests, as shown below.
#A list of what can be returned may be found in the documentation of Sinatra.
class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get('/stream') { Stream.new }
=end
