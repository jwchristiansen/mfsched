class Program
  require 'csv'

  def import_csv(file)
    data = File.open(file)
    csv = CSV.parse(data, headers: true)

    csv.each do |row|
      @mentor = Mentor.create(  # insert mentors into db
        name: row['Name'],
        available_day: row['Day'],
        available_period: row['AM/PM']
      )

      (1..10).each do |n| # iterate through up to 10 fellows per mentor
        if row["Company #{n}"] # insert new fellows into db
          @fellow = Fellow.find_or_create_by(name: row["Company #{n}"])

          if @mentor.has_period_scheduled? # insert meetings with mentors (slots unscheduled)
            @meeting = Meeting.create(
              mentor: @mentor,
              fellow: @fellow,
              day: @mentor.available_day,
              period: @mentor.available_period
            )
          end
        end
      end
    end
  end
end
