class StatusControllsController < ApplicationController
  before_filter :require_user
  def index
    @status_vagas = StatusControll.where("time_end is NOT NULL")
  end
end
