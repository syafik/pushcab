module ApplicationHelper
  def status(resource)
    resource.status
  end

  def format_date(time)
    time ? time.strftime("%d/%b/%Y") : "UNKNOWN"
  end

  def taxi_status(resource)
    requests = TaxiRequest.where(user_id: current_login, cab_id: resource.id, status: "pending")
    if requests.blank?
      resource.status.eql?("available") ? "success" : "error"
    else
      "error"
    end

  end

  def current_login
    if user_signed_in? || cab_signed_in?
      user = current_user ?  current_user : current_cab
    end
  end
end
