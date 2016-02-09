require "spec_helper"

describe 'Lomadee' do
  subject { Lomadee::Base }

  context 'sandbox environment' do
    let(:url) { 'http://sandbox.buscape.com.br/service' }

    describe '.categories' do
      let(:response) do
        subject
          .new('app-token', true)
          .categories({ categoryId: 1 })
      end

      before do
        FakeWeb.register_uri :any,
          "#{url}/findCategoryList/lomadee/app-token/BR/?categoryId=1&format=json&page=1",
          body: load_fixture('categories/6058')
      end

      it { expect(response['id']).to eq(6058) }
      it { expect(response['name']).to eq('Console de Videogame') }
    end

    describe '.products' do
      let(:response) do
        subject
          .new('app-token', true)
          .products({ categoryId: 1 })
          .first['product']
      end

      before do
        FakeWeb.register_uri :any,
          "#{url}/findProductList/lomadee/app-token/BR/?categoryId=1&format=json&page=1",
          body: load_fixture('products/6058')
      end

      it { expect(response['productshortname']).to eq('Sony Playstation 4') }
      it { expect(response['pricemax']).to eq('3794.71') }
      it { expect(response['pricemin']).to eq('1989.90') }
    end

    describe '.offers' do
      let(:response) do
        subject
          .new('app-token', true)
          .offers({ productId: 1 })
          .first['offer']
      end

      before do
        FakeWeb.register_uri :any,
          "#{url}/findOfferList/lomadee/app-token/BR/?productId=1&format=json&page=1",
          body: load_fixture('offers/601189')
      end

      it { expect(response['offername']).to include('Console Xbox One 500GB') }
      it { expect(response['productid']).to eq(601189) }
      it { expect(response['price']['value']).to eq('1899.00') }
      it { expect(response['categoryid']).to eq(6058) }
    end
  end

  context 'production environment' do
    let(:url) { 'http://bws.buscape.com.br/service' }

    describe '.categories' do
      let(:response) do
        subject
          .new('app-token')
          .categories({ categoryId: 1 })
      end

      before do
        FakeWeb.register_uri :any,
          "#{url}/findCategoryList/lomadee/app-token/BR/?categoryId=1&format=json&page=1",
          body: load_fixture('categories/6058')
      end

      it { expect(response['id']).to eq(6058) }
      it { expect(response['name']).to eq('Console de Videogame') }
    end

    describe '.products' do
      let(:response) do
        subject
          .new('app-token')
          .products({ categoryId: 1 })
          .first['product']
      end

      before do
        FakeWeb.register_uri :any,
          "#{url}/findProductList/lomadee/app-token/BR/?categoryId=1&format=json&page=1",
          body: load_fixture('products/6058')
      end

      it { expect(response['productshortname']).to eq('Sony Playstation 4') }
      it { expect(response['pricemax']).to eq('3794.71') }
      it { expect(response['pricemin']).to eq('1989.90') }
    end

    describe '.offers' do
      let(:response) do
        subject
          .new('app-token')
          .offers({ productId: 1 })
          .first['offer']
      end

      before do
        FakeWeb.register_uri :any,
          "#{url}/findOfferList/lomadee/app-token/BR/?productId=1&format=json&page=1",
          body: load_fixture('offers/601189')
      end

      it { expect(response['offername']).to include('Console Xbox One 500GB') }
      it { expect(response['productid']).to eq(601189) }
      it { expect(response['price']['value']).to eq('1899.00') }
      it { expect(response['categoryid']).to eq(6058) }
    end
  end
end
