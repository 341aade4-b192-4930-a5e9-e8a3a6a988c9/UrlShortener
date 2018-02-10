class LinksController < ApplicationController
  expose :links, -> { Link.all }
  expose :link

  def index
  end

  def new
    @form = Links::CreateForm.new(link)
  end

  def create
    @form = Links::CreateForm.new(link)

    if @form.validate(params[:link])
      @form.model.short_url = ShortUrlGenerator.call

      @form.save

      return redirect_to action: :index
    end

    render action: :new
  end

  def edit
    @form = Links::UpdateForm.new(link)
  end

  def update
    @form = Links::UpdateForm.new(link)

    if @form.validate(params[:link])
      @form.save

      return redirect_to action: :index
    end

    render action: :edit
  end

  def go
    #TODO: extract to seporate controller?
    #TODO: can modyfy only last
    redirect_to ShortUrlNavigator.call(params[:short_url])
  end
end
