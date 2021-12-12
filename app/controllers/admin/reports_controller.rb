class Admin::ReportsController < ApplicationController
  def index
    @reports=Report.all
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
