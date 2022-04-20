module ProgramsHelper
  def slot_time_display(slot, period)
    if period == "AM"
      time = Time.parse("9:00") + (20*slot).minutes
    else
      time = Time.parse("12:00") + (20*slot).minutes
    end
  
    time.strftime("%H:%M")
  end
end
