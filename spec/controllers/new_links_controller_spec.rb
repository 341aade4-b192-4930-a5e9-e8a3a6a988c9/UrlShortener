require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  include Capybara::RSpecMatchers
  render_views

  describe 'new links' do
    it {
        get :new
        expect(response).to be_success
    }
  end
end



