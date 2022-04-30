class ProgramsController < ApplicationController
  before_action :days_and_periods, only: [:index, :create]
  require "csv"

  def index
    @meetings = Meeting.all
  end

  def create
    # import csv data
    @program = Program.new
    @program.import_csv(params[:csv])

    # schedule meetings
    @meetings = Meeting.all
    @meetings.each do |meeting|
      meeting.schedule_slot
    end

    # send meetings json to make.com webhook
    HTTParty.post(
      "https://hook.us1.make.com/vjv7qvrd69pgzgy1gidsw4vksehc5kkj",
      body: {
        public_key: ENV["PUBLIC_API_KEY"],
        meetings: meetings_json_array(@meetings)
      }.to_json,
      headers: {"Content-Type": "application/json"}
    )

    redirect_to root_path
  end

  def destroy
    Meeting.destroy_all
    Fellow.destroy_all
    Mentor.destroy_all
    redirect_to root_path
  end

  private

  def days_and_periods
    @days = %w[Monday Tuesday Wednesday Thursday Friday]
    @periods = %w[AM PM]
  end

  # create, populate, and return an array of meetings
  # to include in json payloads for simple no-code api integrations
  def meetings_json_array(meetings)
    @meetings_json = []
    meetings.each do |meeting|
      @meetings_json << {
        mentor_name: meeting.mentor.name,
        fellow_name: meeting.fellow.name,
        day: meeting.day,
        period: meeting.period,
        slot: meeting.slot
      }
    end
    @meetings_json
  end
end
