module Links
  class UpdateForm < Reform::Form
    include Reform::Form::ActiveRecord
    model :link

    property :short_url

    validates :short_url, presence: true
    validates_uniqueness_of :short_url
  end
end
