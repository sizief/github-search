# Connect to any resourc on the Internet and returns the result
module Access
  require 'rest-client'

  def get_response(url)
    logger.info "getting data for #{url}"
    response = RestClient.get url
    response.body
  rescue StandardError => e
    raise "Can not open the #{url}: #{e.message}"
  end
end
