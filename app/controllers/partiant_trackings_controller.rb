class PartiantTrackingsController < ApplicationController
  before_action :authenticate_user! # Ensure the user is logged in
  before_action :set_partiant_tracking, only: [:edit, :update]
  load_and_authorize_resource

  def index
    @q = PartiantTracking.ransack(params[:q])
    @partiant_trackings = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def new
    @partiant_tracking = PartiantTracking.new
  end

  def create
    @partiant_tracking = current_user.partiant_trackings.new(partiant_tracking_params)
    @partiant_tracking.department = current_user.department # Assuming current_user has a department association
    @partiant_tracking.request_time = Time.current
    if @partiant_tracking.save
      redirect_to partiant_trackings_path, notice: 'Partiant Tracking was successfully created.'
    else
      render :new
    end
  end

  def edit
    # @partiant_tracking is set by the before_action
  end

  def update
    if @partiant_tracking.update(partiant_tracking_params)
      redirect_to partiant_trackings_path, notice: 'Partiant Tracking was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_partiant_tracking
    @partiant_tracking = PartiantTracking.find(params[:id])
  end

  def partiant_tracking_params
    params.require(:partiant_tracking).permit(:name, :service_type, :room, :partiant_id, :phone, :insurance_company, :note, :send_time, :insurance_confirm_time, :insurance_status, :assignee)
  end
end
