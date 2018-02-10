class LinksController < ApplicationController
  expose :links, -> { Link.all }

  def index
  end
end
