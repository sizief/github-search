# Main class of this project. Use it to initiate search on github.
class Search
  require_relative 'access'
  require_relative 'parse'
  require_relative 'logging'
  include Access
  include Parse
  include Logging

  GITHUB_URL = 'https://api.github.com/search/repositories?q='.freeze

  def initialize(query)
    @query = query
  end

  def run
    return {} if @query.nil? || @query.empty?
    return failure_message(Settings.messages.parameter_error) unless permitted? @query

    response = get_response GITHUB_URL + @query
    success_message(extract(response, Settings.response_keys))
  rescue StandardError => e
    logger.fatal e.message + e.backtrace[0..5].join("\n")
    failure_message(Settings.messages.error)
  end

  private

  def permitted?(query)
    query.match(/[a-zA-Z0-9]/)
  end

  def failure_message(message)
    create_message(false, message)
  end

  def success_message(message)
    create_message(true, message)
  end

  def create_message(success, message)
    { success: success, body: message, query: @query }
  end
end
