class Meeting < ApplicationRecord
  belongs_to :mentor
  belongs_to :fellow

  def self.by_period(day, period)
    self.where(day: day, period: period)
  end

  def schedule_slot
    (1..8).each do |slot|
      # is fellow available this slot?
      if Meeting.where(fellow: self.fellow, day: self.day, period: self.period, slot: slot).empty?
        # is mentor available this slot?
        if Meeting.where(mentor: self.mentor, day: self.day, period: self.period, slot: slot).empty?
          self.slot = slot
          self.save!
        end
      end
    end
  end
end
