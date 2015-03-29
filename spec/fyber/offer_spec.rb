require 'fyber'
require 'fyber/client'
require 'fyber/configuration'
require 'timecop'

describe Fyber::Client do

    @hash_key = "f2c6f820f51b3a6ae3c06f03df40d8e4b3927c3e"

    before(:each) do
      Timecop.freeze(Time.local(2015, 03, 29, 3, 3, 0))
    end

    after(:each) do
      Timecop.return
    end

    before do
        Fyber.configure do |config|
            config.appid = 157
            config.device_id = "2b6f0cc904d137be2e1730235f5664094b83"
            config.ip = "109.235.143.113"
            config.offer_types = 112
            config.api_key = "b07a12df7d52e6c118e5d47d3f9e60135b109a1f"
            config.offers_url = "http://fyber/base_uri"
        end

        @form_params = {:uid => "player", :pub0 => "campaign2", :page => 1}

        @fyber = Fyber::Client.new

    end

    context "request signing" do
        it "hashkey " do
            expect(Fyber.hashkey(@form_params)).to eq("f2c6f820f51b3a6ae3c06f03df40d8e4b3927c3e")
        end
    end

    context "request orders" do

        before do
            @query = {:uid=>"player", :pub0=>"campaign2",
                      :page=>1, :appid=>157,
                      :device_id=>"2b6f0cc904d137be2e1730235f5664094b83",
                      :ip=>"109.235.143.113",
                      :offer_types=>112,
                      :api_key=>"b07a12df7d52e6c118e5d47d3f9e60135b109a1f",
                      :timestamp=> 1427612580,
                      :hashkey=>"870f9d794807fa17b19d401935365a85d7822e3a"}

            @fixture = {"code" => "OK", "message"=> "Ok", "count"=>1, "pages"=>1,
                        "information"=>  {"app_name"=>"Demo iframe for publisher - do not touch",
                                     "appid"=>157, "virtual_currency"=>"Coins", "country"=>"BR",
                                     "language"=>"EN",
                                     "support_url"=>"http://api.sponsorpay.com/support?appid=157&feed=on&mobile=on&uid=player"}}
        end

        it "calls hash method" do
            expect(Fyber::Client).to receive(:get).with('/offers.json', :query => @query ).and_return(@fixture)

            @fyber.request_offers(@form_params)
        end
    end
end
