module Fyber::Client
    class Offer
        def initialize(options={})
            load_options(options) unless options.empty?
            raise ArgumentError, "At least appid must be present" if Fyber.config.nil? or Fyber.config.appid.nil?
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
            end
        end
    end
end

