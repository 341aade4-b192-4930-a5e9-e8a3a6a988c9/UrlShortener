require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  include Capybara::RSpecMatchers
  render_views

  let!(:link) { create(:link) }

  describe 'index links' do
    it {
        get :index
        expect(response).to be_success
    }
  end
end



