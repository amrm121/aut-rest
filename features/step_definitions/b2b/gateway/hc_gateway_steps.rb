Dado('que tenha um payload padrão do método {string} da API Gateway') do |string|
  metodo = string.downcase.tr(' ', '_')
  @data = HcGatewayMaisPontosFactories.method(metodo).call
end

Quando('é enviada uma requisição GET para {string} da API Gateway') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = gateway_maispontos.method("get_#{metodo}").call(@data)
end
