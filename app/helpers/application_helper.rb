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
    time.strftime("%m/%d/%Y %l:%M%P %Z")
  end


end
