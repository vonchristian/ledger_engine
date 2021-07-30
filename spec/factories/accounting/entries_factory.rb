FactoryBot.define do
  factory :entry, class: Accounting::Entry do
    entry_date { "2021-07-30" }
    entry_time { "2021-07-30 17:59:28" }
    description { "MyString" }
    reference_number { "MyString" }
    association :institution, factory: :bank
    recording_type { "automated" }
  end
end
