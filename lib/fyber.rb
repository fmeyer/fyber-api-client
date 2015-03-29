require 'digest/sha1'

module Fyber
	class << self
		attr_accessor :config
	end

    #Configure block
	def self.configure
		self.config ||= Configuration.new
		yield(self.config)
	end


    def self.hashkey(params)
        params.delete_if {|k,v| k.to_s == "hashkey"} # Get all parameters and their values exept HK

        #The resulting hashkey is then appended to the request as a separate parameter.
        encoded = as_url_params(ordered_params(params))
        encoded.concat("&").concat(Fyber.config.api_key)

        #Hash the whole resulting string, using SHA1.
        Digest::SHA1.hexdigest(encoded)
    end


    #TODO: move this methods to another class, time is short

    #Order theses pairs alphabetically by parameter name
    def self.ordered_params(params)
        Hash[params.sort_by {|k,v| k.to_s}]
    end

    #Concatenate all pairs using = between key and value and & between the pairs.
    #with the resulting string with & and the API Key handed out to you by Fyber.
    def self.as_url_params(params)
       params.map do |k,v|
           "#{k}=#{v}"
       end.join("&")
    end
end

