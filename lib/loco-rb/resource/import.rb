require 'loco-rb/resource/base_resource'

module LocoRb
  module Resource
    class Import < LocoRb::Resource::BaseResource
      def initialize(asset, headers, key='import')
        super(asset, headers, key)
      end
    end
  end
end
