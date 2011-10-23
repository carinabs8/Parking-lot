class StatusControllsController < ApplicationController
  before_filter :require_user
  def index
    @status_vagas = VagaStatu.report
  end
end
