
require 'fyber'
require 'fyber/client'
require 'fyber/response'

describe Fyber::Response do

    before do

        @return = {"code" => "OK", "message"=> "Ok", "count"=>1, "pages"=>1,
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
    end

    context "Parsing Response" do
        before do
           @response = Fyber::Response.new @return
        end
        it "Should match header paramethers" do
           expect(@response.code).to eq("OK")
           expect(@response.message).to eq("Ok")
           expect(@response.count).to eq(1)
           expect(@response.pages).to eq(1)
        end

        context "Parsing offers" do 
          it "Shoud match yielded control" do
            expect {|o| @response.each(&o) }.to yield_control
          end

          it "Should let me access the first nested order" do
            offer = @response.first 
            expect(offer.title).to eq("Dragon Fire Empire")
          end

          it "Yielded offers should be an instance of Fyber::Offer" do
            offer = @response.offers.first 
            expect(offer).to be_an_instance_of(Fyber::Offer)
            expect(offer.offer_id).to eq(298388)
          end

          it "should not be empty" do 
            expect(@response.empty?).to be false
          end

          context "Parsing OfferTypes" do
            before do
              @offer_types = @response.first.offer_types
            end

            it "Should contain at least one Instance of OfferType" do
              expect(@offer_types.first).to be_an_instance_of(Fyber::OfferType)
            end

            it "should be readable" do
              offer_type = @offer_types.first
              expect(offer_type.offer_type_id).to eq(101)
              expect(offer_type.readable).to eq("Download")
            end
          end
        end
    end
end
