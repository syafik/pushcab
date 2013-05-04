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
end
