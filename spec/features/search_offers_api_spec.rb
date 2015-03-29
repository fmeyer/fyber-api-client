feature 'Retrieve offers As an user I want to retrieve offers providing uid, pub0 and page In order to view offers' do
    background do
        visit '/'
    end

    scenario 'when request offers' do
        click_button 'Get offers'
        expect(page).to have_text('No offers')
  end
end
