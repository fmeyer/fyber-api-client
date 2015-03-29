require 'fyber'
require 'fyber/client'
require 'fyber/configuration'

describe Fyber::Client do

    let(:fake_request){
        {:appid=>157,
         :device_id=>"2b6f0cc904d137be2e1730235f5664094b83",
         :ip=>"109.235.143.113",
         :offer_types=>112,
         :api_key=>"b07a12df7d52e6c118e5d47d3f9e60135b109a1f",
         :timestamp=>1427598000, #29032015_000000 GMT-3
         :hashkey=>"02da2e2985a65a461f84ec68f8ccfe5a39a3621e"}}

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
        end
    end

    context "request orders" do
        it "calls hash method" do
            expect(Fyber).to receive(:hashkey).and_return({})
            @fyber.offers(@form_params)
        end
    end
end
