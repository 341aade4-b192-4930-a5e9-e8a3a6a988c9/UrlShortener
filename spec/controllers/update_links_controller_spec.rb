require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  include Capybara::RSpecMatchers
  render_views

  let!(:link) { create(:link) }

  describe 'update links' do
    it {
        post :update, params: { id: link.id, link: { short_url: '12345' } }

        link.reload

        expect(link.original_url).to eq 'https://google.com/'
        expect(link.short_url).to eq '12345'
        expect(link.all_clicks).to eq 2

        expect(response).to redirect_to(links_path)
    }
  end
end



