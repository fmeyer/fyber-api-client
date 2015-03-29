require 'fyber'
require 'fyber/client'
require 'fyber/configuration'

describe Fyber do

    context "initialized with missing parameters" do

        it "raises ArgumentError when initialized with no options" do
            expect do
                Fyber::Client.new
            end.to raise_error(ArgumentError)
        end

        it "raises ArgumentError when a required parameter is missing" do
            params = {:appid => nil}
            expect do
                Fyber::Client.new(params)
            end.to raise_error(ArgumentError)
        end

    end

    context "initialized with correct parameters" do
        it "expect no error when initializing with params" do
            params = {:appid => 123}
            expect do
                Fyber::Client.new(params)
            end.not_to raise_error
        end

        context "with fyber configure" do

            before do
                Fyber.configure do |config|
                    config.appid = 123
                    config.offers_url = "http://fyber/base_uri"
                end
            end

            it "expect no errors when initialized with Fyber.configure block" do
                expect do
                    Fyber::Client.new
                end.not_to raise_error
            end

            it "should configure Client base_uri with offers_url" do
                Fyber::Client.new
                expect(Fyber::Client.base_uri).to eq('http://fyber/base_uri')
            end
        end
    end


    context "request orders" do
        before do
            Fyber.configure do |config|
                config.appid = 123
                config.offers_url = "http://fyber/base_uri"
            end
            @fyber = Fyber::Client.new
        end

        it "calls hash method" do
            expect(Fyber).to receive(:hashkey).and_return({})
            @fyber.offers()
        end
    end
end

