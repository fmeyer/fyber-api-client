post '/offers' do

    # TODO: remove sample offer to fix htmllayout
	# @offers = [{"title" => "aaa", "payout" => "bbb", "thumbnail" => "ccc"}]
    @offers = []
	erb :offers
end
