Dado('que tenha um payload padrão do método {string} da API Loja') do |string|
  metodo = string.downcase.tr(' ', '_')
  @data = HcComprasFactories.method(metodo).call
end

Quando('é enviada uma requisição POST para {string} da API Loja') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = loja_compras.method("post_#{metodo}").call(@data)
end
