FactoryGirl.define do
  factory :link, class: Link do
    original_url "https://google.com/"
    short_url "c6KyUo"
    all_clicks 2

    # created_at { build(:time) }
  end
end