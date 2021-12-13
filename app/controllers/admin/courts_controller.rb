class Admin::CourtsController < ApplicationController
  def edit
    @court=Court.find(params[:id])
    gon.court=@court
  end
  def update
    court=Court.find(params[:id])
    court.update(court_params)
    results=Geocoder.search([court.latitude,court.longitude])
    court.address=results.first.address
    redirect_to admin_root_path
  end
  private
  def court_params
    params.require(:court).permit(:name,:latitude,:longitude,:operation,:court_kind,:price)
  end
end
