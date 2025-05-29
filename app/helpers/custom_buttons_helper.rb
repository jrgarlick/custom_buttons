module CustomButtonsHelper
  def encode_url_preserving_path(raw_url)
    return '' if raw_url.blank?

    path, query = raw_url.to_s.split('?', 2)

    if query.present?
      encoded_query = URI.encode_www_form(URI.decode_www_form(query))
      "#{path}?#{encoded_query}"
    else
      path
    end
  end
end