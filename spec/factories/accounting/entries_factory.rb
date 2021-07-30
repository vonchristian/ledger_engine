FactoryBot.define do
  factory :entry, class: Accounting::Entry do
    entry_date { "2021-07-30" }
    entry_time { "2021-07-30 17:59:28" }
    description { "MyString" }
    reference_number { "MyString" }
    association :institution, factory: :bank
    recording_type { "automated" }

    factory :entry_with_debit_and_credit, class: Accounting::Entry do |entry_cd|
      entry_cd.after(:build) do |t|
        t.credit_amounts << FactoryBot.build(:credit_amount, entry: t)
        t.debit_amounts << FactoryBot.build(:debit_amount, entry: t)
      end
    end
  end
end
