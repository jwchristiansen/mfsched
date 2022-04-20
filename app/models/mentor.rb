class Mentor < ApplicationRecord
  has_many :meetings

  def has_period_scheduled?
    self.available_day != "Undefined " && self.available_period != "Undefined "
  end

  def self.by_period(day, period)
    Meeting.by_period(day, period).uniq(&:mentor_id)
  end

  def has_slot_available?(day, period, slot)
    self.meetings.where(day: day, period: period, slot: slot).empty?
  end

  def self.with_scheduled_period
    self.where.not(day: "Undefined ", period: "Undefined ").all
  end
end
