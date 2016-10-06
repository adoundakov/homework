module ApplicationHelper
  def auth_token
    first = "<input type=\"hidden\" name=\"authenticity_token\""
    second = " value='#{form_authenticity_token}'"
    (first + second).html_safe
  end
end
