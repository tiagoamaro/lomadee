module Lomadee
  module Request
    class Base
      protected

        def request(url, params)
          JSON.parse(connection.get(url, params.merge(format: :json, page: 1)).body)
        end

        def url_categories
          "/service/findCategoryList/lomadee/#{@token}/BR/"
        end

        def url_products
          "/service/findProductList/lomadee/#{@token}/BR/"
        end

        def url_offers
          "/service/findOfferList/lomadee/#{@token}/BR/"
        end

      private

        def connection
          Faraday.new(url: base_url) do |config|
            config.request :url_encoded
            config.adapter :net_http
          end
        end
    end
  end
end
