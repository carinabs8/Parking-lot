class ReportsController < ApplicationController
  before_filter :require_user
  before_filter :get_all
  
  def index
    @report_true      = Report.analitic.status(true)
    @report_false     = Report.analitic.status(false)
 
    hash_report_true  = @report_true.count(:vaga_id, :group => :vaga_id)
    hash_report_false = @report_false.count(:vaga_id, :group => :vaga_id)
    
    @vagas_name_true  = Report.getName(hash_report_true)
    @vagas_name_false = Report.getName(hash_report_false)
    
    hash_report_true.select{|k,v| @qt_true << v}
    hash_report_false.select{|k,v| @qt_false  << v}
    
    @total = @qt_true + @qt_false
    @total = @total.inject{|sum, n| sum+n}
  end
  
  def create_pdf
  end
  private
    def get_all
      @vagas_name_true  = @vagas_name_false = []
      @qt_true          = []
      @qt_false         = []
    end
end
