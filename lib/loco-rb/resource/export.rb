require 'loco-rb/resource/base_resource'

module LocoRb
  module Resource
    class Export < LocoRb::Resource::BaseResource
      def initialize(asset, headers, key='export')
        super(asset, headers, key)
      end
    end
  end
end
