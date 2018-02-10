module Links
  class UpdateForm < Reform::Form
    model :link

    property :short_url
    validates :short_url, presence: true
  end
end
