require 'rails_helper'

RSpec.describe GoController, :type => :controller do

  include Capybara::RSpecMatchers
  render_views

  let!(:link) { create(:link) }

  describe 'go links' do
    it {
        get :show, params: {short_url: link.short_url}

        expect(response).to redirect_to(link.original_url)

        expect(link.reload.all_clicks).to eq 3
    }
  end
end



