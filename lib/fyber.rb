module Fyber
	class << self
		attr_accessor :config
	end

    def self.hashkey(params)
        {:fake => "hash"}
    end

	def self.configure
		self.config ||= Configuration.new
		yield(self.config)
	end
end
