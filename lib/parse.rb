# Parse JSON data and returns
module Parse
  def extract(response, keys)
    result = []

    hash_response = JSON.parse(response)
    hash_response['items'].each do |item|
      result << parse_keys(item, keys)
    end
    result
  rescue StandardError => e
    raise "Can not parse response: #{e.message}"
  end

  def parse_keys(item, keys)
    temp = {}
    keys.each do |key|
      temp[key.to_sym] = item[key]
    end
    temp
  end
end
