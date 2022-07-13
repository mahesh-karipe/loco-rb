module LocoRb
  module Resource
    class BaseResource < OpenStruct
      attr_reader :key, :headers
      def initialize(resource, headers, key=nil)
        @key = key
        @headers = headers
        super(resource)
      end
    end
  end
end
