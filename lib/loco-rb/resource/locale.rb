require 'loco-rb/resource/base_resource'

module LocoRb
  module Resource
    class Locale < LocoRb::Resource::BaseResource
      def initialize(asset, headers, key='locale')
        super(asset, headers, key)
      end
    end
  end
end
