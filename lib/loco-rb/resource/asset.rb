require 'loco-rb/resource/base_resource'

module LocoRb
  module Resource
    class Asset < LocoRb::Resource::BaseResource
      def initialize(asset, headers, key='asset')
        super(asset, headers, key)
      end
    end
  end
end
