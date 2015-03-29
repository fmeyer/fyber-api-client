require 'fyber'
require 'fyber/client'
require 'fyber/configuration'
require 'fyber/offers/offer.rb'

describe Fyber do

    context "initialized with missing parameters" do

        it "raises ArgumentError when initialized with no options" do
            expect do
                Fyber::Client::Offer.new
            end.to raise_error(ArgumentError)
        end

        it "raises ArgumentError when a required parameter is missing" do
            params = {:appid => nil}
            expect do
                Fyber::Client::Offer.new(params)
            end.to raise_error(ArgumentError)
        end

        context "configuring using parameters" do
            it "should initialize with class parameters" do
                params = {:appid => 123}
                expect do
                    Fyber::Client::Offer.new(params)
                end.not_to raise_error
            end

            it "should initialize with fyber configure method" do
                Fyber.configure do |config|
                    config.appid = 123
                end

                expect do
                    Fyber::Client::Offer.new
                end.not_to raise_error
            end
        end
    end
end

