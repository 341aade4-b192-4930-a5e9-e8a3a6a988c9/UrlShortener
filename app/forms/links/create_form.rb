module Links
  class CreateForm < Reform::Form
    model :link

    property :original_url
    validates :original_url, presence: true
  end
end
