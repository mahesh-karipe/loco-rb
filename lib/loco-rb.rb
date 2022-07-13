require "loco-rb/version"
require "loco-rb/configuration"
require "loco-rb/client"

module LocoRb
  class Error < StandardError; end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
