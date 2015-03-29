module Fyber

	class << self
		attr_accessor :config
	end


	def self.configure
		self.config ||= Configuration.new
		yield(self.config)
	end
end
