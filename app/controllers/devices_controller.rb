class DevicesController < ApplicationController
  before_action :restrict_acces_to_app, except: [:track]
  before_action :user_signed_in?, except: [:track]
  before_action :set_device, except: [:index, :create]

  # GET /devices
  # GET /devices.json
  def index
    @devices = current_user.devices
  end

  # GET /devices/1
  # GET /devices/1.json
  def show
  end

  # POST /devices
  # POST /devices.json
  def create
    @device = Device.new(device_params)

    respond_to do |format|
      if @device.save
        format.json { render :show, status: :created, location: @device }
      else
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /devices/1
  # PATCH/PUT /devices/1.json
  def update
    respond_to do |format|
      if @device.update(device_params)
        format.json { render :show, status: :ok, location: @device }
      else
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def lock
    respond_to do |format|
      if @device.start_tracking
        format.json { render json: {message: "The Device has been locked"},status: :ok }
      else
        format.json { render json: {message: "The Device has already been locked"},status: :ok }
      end
    end
  end

  def unlock
    respond_to do |format|
      if @device.stop_tracking
        format.json { render json: {message: "The Device has been unlocked"},status: :ok }
      else
        format.json { render json: {message: "The Device has already been unlocked"},status: :ok }
      end
    end
  end

  def tracking_route
    @tracking_route = @device.last_tracking_route || {}
    respond_to  do |format|
      format.json { render json: @tracking_route.to_json, status: :ok }
    end
  end

  def track
    if params[:To] == ENV["TWILIO_PHONE_NUMBER"]
      @device = Device.where(phone_number: params[:From]).first
      if @device.is_locked?
        @device.track_position(params[:Body])
      end
      @unauthorized = false
    else
      @unauthorized = true
      render json: {message: "Request not authenticated"}, :status=>403
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_device
      @device = Device.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def device_params
      params[:device]
    end
end