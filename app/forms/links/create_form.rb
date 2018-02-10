module Links
  class CreateForm < Reform::Form
    model :link

    property :original_url

    validates :original_url, presence: true
    validates :original_url, url: true
  end
end
