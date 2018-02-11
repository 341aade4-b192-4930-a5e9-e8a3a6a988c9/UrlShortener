module Links
  class UpdatePolicy
    def self.call(link)
      Link.order(created_at: :asc).last == link
    end
  end
end