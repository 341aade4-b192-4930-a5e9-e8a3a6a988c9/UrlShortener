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
    unless Links::UpdatePolicy.call(link)
      return render plain: "Sorry, you can't edit this link."
    end

    @form = Links::UpdateForm.new(link)
  end

  def update
    unless Links::UpdatePolicy.call(link)
      return render plain: "Sorry, you can't update this link."
    end

    @form = Links::UpdateForm.new(link)

    if @form.validate(params[:link])
      @form.save

      return redirect_to action: :index
    end

    render action: :edit
  end
end
