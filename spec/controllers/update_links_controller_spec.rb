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

  describe 'update links, but it is not last link' do
    let!(:new_link) { create(:new_link) }

    it {
      post :update, params: { id: link.id, link: { short_url: '12345' } }

      expect(response).to be_forbidden
    }
  end

  describe 'update links, but with invalid short_url' do
    it {
      post :update, params: { id: link.id, link: { short_url: '' } }

      expect(response).to be_success

      expect(response.body).to have_css('.error', text: 'can\'t be blank')
    }
  end

  describe 'update links, but with duplicated short_url' do
    let!(:new_link) { create(:new_link) }

    it {
      post :update, params: { id: new_link.id, link: { short_url: link.short_url } }

      expect(response).to be_success

      expect(response.body).to have_css('.error', text: 'has already been taken')
    }
  end


end



