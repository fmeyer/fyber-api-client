feature 'Retrieve offers As an user I want to retrieve offers providing uid, pub0 and page In order to view offers' do
    before do
        Fyber.configure do |config|
            config.appid = 157
            config.device_id = "2b6f0cc904d137be2e1730235f5664094b83"
            config.ip = "109.235.143.113"
            config.offer_types = 112
            config.api_key = "b07a12df7d52e6c118e5d47d3f9e60135b109a1f"
            config.offers_url = "http://fyber/base_uri"
        end
    end

    scenario 'when request offers' do
        #pending
        #visit '/'
        #click_button 'Get offers'
        #expect(page).to have_text('No offers')
    end
end
