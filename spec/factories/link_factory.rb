FactoryGirl.define do
  factory :link, class: Link do
    original_url "https://google.com/"
    short_url "c6KyUo"
    all_clicks 2
    created_at { Time.parse('2018-02-10 22:59:28 UTC') }
  end

  factory :new_link, class: Link do
    original_url "https://google.com/"
    short_url "c6Kyyo"
    all_clicks 2
    created_at { Time.parse('2018-02-10 22:59:58 UTC') }
  end

end