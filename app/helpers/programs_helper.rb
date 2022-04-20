module ProgramsHelper
  def slot_time_display(slot, period)
    time = if period == "AM"
      Time.parse("9:00") + (20 * slot).minutes
    else
      Time.parse("12:00") + (20 * slot).minutes
    end

    time.strftime("%H:%M")
  end
end
