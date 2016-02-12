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

    def products(params)
      raise ArgumentError unless params.key?(:categoryId)

      search(:products, params, 'product')
    end

    def offers(params)
      raise ArgumentError unless params.key?(:productId)

      search(:offers, params, 'offer')
    end

    private

      def search(method, params, index, data = [], page = 1, pages = 1)
        if page <= pages
          response = request.send(method, params.merge(page: page)).first
          data << response.fetch(index)

          search(method, params, index, data, page + 1, response['totalpages'])
        end

        data.flatten
      end

      def request
        if @sandbox
          Request::Sandbox.new(@token)
        else
          Request::Production.new(@token)
        end
      end
  end
end
