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
end
