require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  include Capybara::RSpecMatchers
  render_views

  let!(:link) { create(:link) }

  describe 'edit link' do
    it {
        get :edit, params: { id: link.id }
        expect(response).to be_success
    }
  end

  describe 'edit link, but not last' do
    let!(:new_link) { create(:new_link) }

    it {
      get :edit, params: { id: link.id }
      expect(response).to be_forbidden
    }
  end

end



