# Lomadee

API Ruby para acesso aos dados fornecidos pelo Lomadee (Buscapé)

## Instalação

Adicione esta linha em seu arquivo Gemfile:

    gem 'lomadee', github: 'rogeriozambon/lomadee'

E depois execute:

    $ bundle

## Configuração

Para começar a usar esta gem, você deve instanciar um objeto `Lomadee::Base` da seguinte forma:

```ruby
lomadee = Lomadee::Base.new('APP_TOKEN', true)
```

Inicialmente, esta gem permite a busca de preços do Brasil. A seguir, uma tabela com os parâmetros de inicialização.

| Parâmetro | Valor |
|----------------|-----------------------------------------------------------------------------------------------------------------------------|
| app_token | Seu token de acesso à API, gerado pela Lomadee (Buscapé) |
| sandbox | true ou false. O padrão é false |

## Exemplos

Com o objeto instanciado, você pode:

### Buscar todos os produtos de uma categoria

```ruby
lomadee = Lomadee::Base.new('APP_TOKEN', true)

products = lomadee.products(categoryId: 6058).map do |product|
  {
    buscape_id: product['product']['id'],
    name: product['product']['productname'],
    low_price: product['product']['pricemin'],
    high_price: product['product']['pricemax']
  }
end
```

### Buscar todas as ofertas de um produto

```ruby
lomadee = Lomadee::Base.new('APP_TOKEN', true)

offers = lomadee.offers(productId: 601189).map do |offer|
  {
    name: offer['offer']['offername'],
    price: offer['offer']['price']['value']
  }
end
```

Obs: Verifique a interface de dados que está disponível na documentação de integração.

## Contribua

1. Faça um fork ( https://github.com/rogeriozambon/lomadee/fork )
2. Crie sua feature branch (`git checkout -b my-new-feature`)
3. Faça o commit (`git commit -am 'Add some feature'`)
4. Envie sua branch (`git push origin my-new-feature`)
5. Crie um novo pull request
