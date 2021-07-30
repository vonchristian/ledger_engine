FactoryBot.define do
  factory :entry do
    entry_date { "2021-07-30" }
    entry_time { "2021-07-30 17:59:28" }
    description { "MyString" }
    reference_number { "MyString" }
    institution { nil }
    recording_type { "MyString" }
  end
end
