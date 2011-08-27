class ReportsController < ApplicationController
  before_filter :require_user
  
  def index
    @report = Report.all
  end
end
