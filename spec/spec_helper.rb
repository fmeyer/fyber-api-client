require 'simplecov'
SimpleCov.add_filter '/spec/'
SimpleCov.add_filter '/config/'
SimpleCov.start if ENV["COVERAGE"]

ENV['RACK_ENV'] = 'test'

require File.expand_path(File.dirname(__FILE__) + "/../config/environment.rb")

require 'capybara'
require 'capybara/rspec'
require 'rspec'


Capybara.app = Sinatra::Application



### Fixtures 

@fixture = {"code" => "OK", "message"=> "Ok", "count"=>1, "pages"=>1,
           "information"=>  {"app_name"=>"Demo iframe for publisher - do not touch",
                             "appid"=>157, "virtual_currency"=>"Coins", "country"=>"BR",
                             "language"=>"EN",
                             "support_url"=>"http://api.sponsorpay.com/support?appid=157&feed=on&mobile=on&uid=player"},

           "offers"=> [{"title"=>"Dragon Fire Empire",
                        "offer_id"=>298388,
                        "teaser"=>"Download and REGISTER an account",
                        "required_actions"=>"Download and REGISTER an account",
                        "link"=>"http://api.sponsorpay.com/5d595f381d9c8abcbb0a275de5d61920/52f849c797b3f6e3/mobile/BR/157/offers/298388",
                        "offer_types"=>[{"offer_type_id"=>101, "readable"=>"Download"},
                                        {"offer_type_id"=>106, "readable"=>"Games"},
                                        {"offer_type_id"=>109, "readable"=>"Games"},
                                        {"offer_type_id"=>112, "readable"=>"Free"}],
                        "payout"=>482,
                        "time_to_payout"=>{"amount"=>600, "readable"=>"10 minutes"},
                        "thumbnail"=>{"lowres"=>"http://cdn3.sponsorpay.com/assets/45029/Screen_Shot_2014-07-23_at_4.42.19_PM_square_60.png",
                                      "hires"=>"http://cdn3.sponsorpay.com/assets/45029/Screen_Shot_2014-07-23_at_4.42.19_PM_square_175.png"},
                        "store_id"=>""}]}

@query_feature = {"uid"=>"uid", "pub0"=>"pub0", "page"=>"page",
   :appid=>157,
   :device_id=>"2b6f0cc904d137be2e1730235f5664094b83",
   :ip=>"109.235.143.113",
   :offer_types=>112,
   :api_key=>"b07a12df7d52e6c118e5d47d3f9e60135b109a1f",
   :timestamp=>1427612580,
   :hashkey=>"cbf96d7c5984f599dcf08a844496f903c4618ed3"}

