# frozen_string_literal: true

module Institutions
  class Bank < ApplicationRecord
    validates :bank_name, presence: true, uniqueness: true
  end
end
