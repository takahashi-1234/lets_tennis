class Admin::ReportsController < ApplicationController
  def not_supported_reports
    @reports=Report.where(is_supported:false).page(params[:page])
  end
  def supported_reports
    @reports=Report.where(is_supported:true).page(params[:page])
  end
  def update
    report=Report.find(params[:id])
    if report.is_supported
      report.is_supported=false
    else
      report.is_supported=true
    end
    report.save
    redirect_back(fallback_location:root_path)
  end
end
