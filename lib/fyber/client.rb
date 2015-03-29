require 'httparty'

module Fyber
    class Client
        include HTTParty
        headers 'Accept-encoding' => 'gzip'

        def initialize(options={})
            load_options(options) unless options.empty?

            Fyber::Client.base_uri(Fyber.config.offers_url)

            raise ArgumentError, "At least appid must be present" if Fyber.config.nil? or Fyber.config.appid.nil?
        end


        def offers
            params = {}
            params.merge(Fyber.hashkey(params))
            self.class.get("/offers.json", query: params )
        end


        private
        def load_options(options)
            Fyber.configure do |config|
                config.appid = options[:appid]
                config.format = options[:format]
                config.device_id = options[:device_id]
                config.ip = options[:ip]
                config.offer_types = options[:offer_types]
                config.api_key = options[:api_key]

                config.offers_url = options[:offers_url]
            end
        end
    end
end

