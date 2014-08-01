module ApplicationHelper

  def new_comment(cmt)
    if cmt.new_record?
      cmt
    else
      Comment.new(user_id: "1")
    end
  end

  def good_url(url)
    if url.starts_with?("http://")
      url
    else
      "http://" + url
    end

  end

  def good_looking_time(time)
    if logged_in? && !current_user.time_zone.blank?
      time = time.in_time_zone(current_user.time_zone)
    end

    time.strftime("%m/%d/%Y %l:%M%P %Z")
  end


end
