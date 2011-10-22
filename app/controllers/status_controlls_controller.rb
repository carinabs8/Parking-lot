class StatusControllsController < ApplicationController
  def index
    @status_vagas = VagaStatu.report
  end
end
