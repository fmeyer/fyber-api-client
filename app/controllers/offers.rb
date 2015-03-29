post '/offers' do
	params["offers"]
	@offers = []
	erb :offers
end