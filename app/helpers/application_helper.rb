module ApplicationHelper
  def artist_name(artist_id)
    client = MoatClient.new
    client.find_artist(artist_id).name
  end

  def flash_class(level)
    bootstrap_alert_class = {
      'success' => 'alert-info',
      'error' => 'alert-danger',
      'notice' => 'alert-success',
      'alert' => 'alert-warning',
      'warn' => 'alert-warning'
    }
    bootstrap_alert_class[level]
  end
end
