require 'rails_helper'

RSpec.describe LinksController, :type => :controller do

  include Capybara::RSpecMatchers
  render_views

  describe 'create links' do
    it {
        post :create, params: { link: { original_url: 'http://google.com/' } }

        link = Link.last

        expect(link.original_url).to eq 'http://google.com/'
        expect(link.short_url).not_to be_nil
        expect(link.all_clicks).to eq 0

        expect(response).to redirect_to(links_path)
    }
  end

  describe 'create links with blank url' do
    it {
      post :create, params: { link: { original_url: '' } }

      expect(response).to be_success

      expect(response.body).to have_css('.error', text: 'can\'t be blank')
    }
  end

  describe 'create links with incorrect url' do
    it {
      post :create, params: { link: { original_url: 'incorrect' } }

      expect(response).to be_success

      expect(response.body).to have_css('.error', text: 'is not a valid URL')
    }
  end
end



