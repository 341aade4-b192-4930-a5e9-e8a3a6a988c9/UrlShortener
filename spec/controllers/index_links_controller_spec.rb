require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  include Capybara::RSpecMatchers
  render_views

  let!(:link) { create(:link) }

  describe 'index links' do
    it {
        get :index
        expect(response).to be_success

        expect(response.body).to have_css('.spec_original_url', text: 'https://google.com/')
        expect(response.body).to have_css('.spec_created_at', text: '2018-02-10 22:59:28 UTC')
        expect(response.body).to have_link(href: edit_link_path(link))
        expect(response.body).to have_css('.spec_all_clicks', text: '2')
    }
  end
end



