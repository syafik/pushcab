class TaxiRequestsController < InheritedResources::Base

  def index
    #@cabs = Cab.not_requested_by_user(current_login).order_by_username
    @cabs = Cab.order_by_username
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
    @my_requests = current_cab ? current_login.taxi_requests.pending : current_login.taxi_requests
  end

  def response_request
    msg case params[:response]
      when 'approved'
        TaxiRequest.update_all({status: "step1"}, {id: params[:taxi_request_id]})
        "Confirmation was sent"
      when 'declined'
        TaxiRequest.delete(params[:taxi_request_id])
        "Request was declined"
    end

    redirect_to my_requests_url, notice: msg
  end
end
