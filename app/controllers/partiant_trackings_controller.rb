class PartiantTrackingsController < ApplicationController
  before_action :authenticate_user! # Ensure the user is logged in

  def index
    @partiant_trackings = PartiantTracking.all
  end

  def new
    @partiant_tracking = PartiantTracking.new
  end

  def create
    @partiant_tracking = PartiantTracking.new(partiant_tracking_params)
    @partiant_tracking.department = current_user.department # Assuming current_user has a department association
    @partiant_tracking.request_time = Time.current
    if @partiant_tracking.save
      redirect_to partiant_trackings_path, notice: 'Partiant Tracking was successfully created.'
    else
      render :new
    end
  end

  private

  def partiant_tracking_params
    params.require(:partiant_tracking).permit(:name, :service_type, :room, :partiant_id, :note, :phone, :insurance_company)
  end
end
