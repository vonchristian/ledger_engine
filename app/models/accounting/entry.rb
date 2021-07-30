# frozen_string_literal: true

module Accounting
  class Entry < ApplicationRecord
    enum recording_type: { manual: 'manual', automated: 'automated' }
    belongs_to :institution, polymorphic: true

    validates :entry_date, :entry_time, :reference_number, :description, :recording_type, presence: true
  end
end
