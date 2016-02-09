require "faraday"
require "json"
require "lomadee/request/base"
require "lomadee/request/sandbox"
require "lomadee/request/production"

module Lomadee
  class Base
    def initialize(token, sandbox = false)
      @token = token
      @sandbox = sandbox
    end

    def categories(params)
      raise ArgumentError unless params.key?(:categoryId)

      request.categories(params).fetch('category')
    end

    def products(params)
      raise ArgumentError unless params.key?(:categoryId)

      request.products(params).fetch('product')
    end

    def offers(params)
      raise ArgumentError unless params.key?(:productId)

      request.offers(params)
    end

    private

      def request
        if @sandbox
          Request::Sandbox.new(@token)
        else
          Request::Production.new(@token)
        end
      end
  end
end
