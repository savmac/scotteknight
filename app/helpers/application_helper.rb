module ApplicationHelper

  def gravatar_for(email, size=50)
    hash = Digest::MD5.hexdigest(email)
    image_tag "http://gravatar.com/avatar/#{hash}?s=#{size}", class: "img-circle"
  end

  def markdown_filter(text)
      Kramdown::Document.new(text, coderay_tab_width: "1").to_html.html_safe
  end
end
