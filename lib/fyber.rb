module Fyber

	class << self
		attr_accessor :config
	end


	def self.configure
		self.config ||= Configuration.new
		yield(self.config)			
	end

	module ClassMethods
		
	end
	
	module InstanceMethods
		
	end

	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
	end
end
