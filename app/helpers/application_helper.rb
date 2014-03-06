module ApplicationHelper

  def gravatar_for(email, size=50)
    hash = Digest::MD5.hexdigest(email)
    image_tag "http://gravatar.com/avatar/#{hash}?s=#{size}", class: "img-circle"
  end
end
