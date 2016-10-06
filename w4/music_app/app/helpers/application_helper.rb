module ApplicationHelper
  include ERB::Util

  def auth_token
    "<input type='hidden' name='authenticity_token' value='#{form_authenticity_token}'>".html_safe
  end


  def ugly_lyrics(lyrics)
    html = ""
    return html.html_safe unless lyrics
    lines = lyrics.split("\n")
    lines.each do |line|
      html << "&#9835; #{h(line)} <br>"
    end
    html.html_safe
  end
end
