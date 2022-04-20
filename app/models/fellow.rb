class Fellow < ApplicationRecord
  has_many :meetings

  def has_slot_available?(day, period, slot)
    self.meetings.where(day: day, period: period, slot: slot).empty?
  end
end
