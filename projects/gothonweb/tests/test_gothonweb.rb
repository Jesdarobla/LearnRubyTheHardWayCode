require "./bin/app.rb"
require "test/unit"
require "rack/test"
require "./lib/gothonweb/map.rb"


class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods


  def app
    Sinatra::Application
  end

  def test_game
    session = {}
    Map::save_room(session, Map::START)
    #puts "Here's session[:room]", session[:room]
    room = Map::load_room(session)
    #puts "Here's room" , room.name
    #I don't know how to test this without modifying app.rb, so I'm going to have
    # to modify app.rb to be able to test stuff here.
    get '/game', "session" => session # this adds to the params[:session]
    assert last_response.ok?
    puts last_response.body
  end
=begin
  def test_hello_form
    get '/hello/'
    assert last_response.ok?
    assert last_response.body.include?('A Greeting')
  end

  def test_hello_form_post
    post '/hello/', params={:name => 'Frank', :greeting => "Hi"}
    assert last_response.ok?
    assert last_response.body.include?("I just wanted to say")

  end
=end
end
