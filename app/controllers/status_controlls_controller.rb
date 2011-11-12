class StatusControllsController < ApplicationController
  before_filter :require_user
  def index
    @status_vagas = StatusControll.closed.recent
  end
end
