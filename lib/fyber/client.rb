require 'httparty'

module Fyber
    class Client
        include HTTParty
        headers 'Accept-encoding' => 'gzip'

        def initialize(options={})
            load_options(options) unless options.empty?

            Fyber::Client.base_uri(Fyber.config.offers_url)
            @default_params = load_default_params

            raise ArgumentError, "At least appid must be present" if Fyber.config.nil? or Fyber.config.appid.nil?
        end


        def request_offers(request_params)
            request_params.merge!(@default_params)
            request_params.merge!({:hashkey => Fyber.hashkey(request_params)})
            
            response = self.class.get("/offers.json", query: request_params)
            check_fyber_response_integrity(response)

            Fyber::Response.new(response)
        end


        private

        def check_fyber_response_integrity(response)
            resp_signature = response.headers['x-sponsorpay-response-signature']
            self_signature = Digest::SHA1.hexdigest(response.body + Fyber.config.api_key)
            if resp_signature != self_signature
                raise Fyber::ResponseError, 'Response signature header didn\'t match'
            end
        end

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

        def load_default_params
            {
                appid: Fyber.config.appid,
                device_id: Fyber.config.device_id,
                ip: Fyber.config.ip,
                offer_types: Fyber.config.offer_types,
                api_key: Fyber.config.api_key,
                timestamp: Time.now.to_i,
            }
        end
    end
end

