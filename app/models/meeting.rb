class Meeting < ApplicationRecord
  belongs_to :mentor
  belongs_to :fellow

  def self.by_period(day, period)
    where(day: day, period: period)
  end

  # this method schedules slots
  def schedule_slot
    (1..8).each do |slot|
      # is fellow available this slot?
      if Meeting.where(fellow: fellow, day: day, period: period, slot: slot).empty? # refactor to fellow.rb
        # is mentor available this slot?
        if Meeting.where(mentor: mentor, day: day, period: period, slot: slot).empty? # refactor to mentor.rb
          self.slot = slot
          save!
        end
      end
    end
  end
end
