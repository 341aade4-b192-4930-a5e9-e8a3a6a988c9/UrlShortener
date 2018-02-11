class GoController < ApplicationController
  def show
    redirect_to ShortUrlNavigator.call(params[:short_url])
  end
end
