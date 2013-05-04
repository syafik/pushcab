module ApplicationHelper
  def status(resource)
    resource.status
  end

  def format_date(time)
    time ? time.strftime("%d/%b/%Y") : "UNKNOWN"
  end

  def taxi_status(resource)
    resource.status.eql?("available") ? "success" : "error"
  end

  def current_login
    if user_signed_in? || cab_signed_in?
      user = current_user ?  current_user : current_cab
    end
  end
end
