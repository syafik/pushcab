class TaxiRequestsController < InheritedResources::Base

  def index
    #@cabs = Cab.near([current_login.latitude, current_login.longitude], 20, :units => :km)
    @cabs = Cab.all
  end

  def new
    request  = current_user.taxi_requests.new(cab_id: params[:cab_id])
    alert_type, msg = request.save  ? [:notice, "Request was sent"]  : [:error, "Failed to send request"]
    flash[alert_type] = msg

    redirect_to taxi_requests_url
  end

  def user_request
    @my_requests = current_user.taxi_requests
  end
end
