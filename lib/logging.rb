# Logging to use inside any class or module applications
module Logging
  def logger
    Logging.logger
  end

  def self.logger
    @logger ||= Logger.new("#{Settings.log_directory}/app.log", 'daily')
  end
end
