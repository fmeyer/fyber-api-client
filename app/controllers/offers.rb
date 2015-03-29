def load_fyber_api
	@fyber_api ||= Fyber::Client.new
end

post '/offers' do
	load_fyber_api
	@fyber_response = @fyber_api.request_offers(params[:offers])
	
	erb :offers
end
