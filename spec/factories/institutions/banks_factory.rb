FactoryBot.define do
  factory :bank, class: Institutions::Bank do
    bank_name { "Bank #{SecureRandom.hex}" }
  end
end
