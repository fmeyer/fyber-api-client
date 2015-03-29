require 'spec_helper'

describe 'the index page with api form' do
  it 'can view the index page', :js => true do
    visit '/'

    page.should have_content('Fyber API Client')

  end
end