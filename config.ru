# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || '1ee391a8e0305103fdabfe8679a47e3096b9458ead72068135c1b6a5faaf9209'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

run Sinatra::Application
