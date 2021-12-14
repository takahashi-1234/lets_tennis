class Public::ReportsController < ApplicationController
  before_action:authenticate_customer!

  def create
    court=Court.find(params[:court_id])
    report=current_customer.reports.new(report_params)
    report.court_id=court.id
    report.save
    redirect_back(fallback_location:root_path)
  end
  
  private
  def report_params
    params.require(:report).permit(:report_content,:report_detail)
  end
end
