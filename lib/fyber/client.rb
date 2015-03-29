module Fyber::Client
	module ClassMethods
		
	end
	
	module InstanceMethods
		
	end
	
	def self.included(receiver)
		receiver.extend         ClassMethods
		receiver.send :include, InstanceMethods
		receiver.send :include, HTTParty
	end
end