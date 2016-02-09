module Lomadee
  module Request
    class Sandbox < Base
      def initialize(token)
        @token = token
      end

      def categories(params)
        request(url_categories, params)
      end

      def products(params)
        request(url_products, params)
      end

      def offers(params)
        request(url_offers, params)
      end

      protected

        def base_url
          'http://sandbox.buscape.com.br'
        end
    end
  end
end
