class TaxiRequestsController < InheritedResources::Base

  def index
    @cabs = Cab.order("username ASC")
  end

  def new
    p ' == ' *55
    p params
    request  = current_user.taxi_requests.new(cab_id: params[:cab_id])
    alert_type, msg = request.save  ? [:notice, "Request was sent"]  : [:error, "Failed to send request"]
    flash[alert_type] = msg

    redirect_to taxi_requests_url
  end

  def user_request
    @my_requests = current_user.taxi_requests
  end
end
