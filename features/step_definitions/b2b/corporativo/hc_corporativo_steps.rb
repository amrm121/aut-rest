Dado('que tenha um payload padrão do método {string} da API Corporativo') do |string|
  metodo = string.downcase.tr(' ', '_')
  @data = HcLocalidadeFactories.method(metodo).call
end

Quando('é enviada uma requisição GET para {string} da API Corporativo') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = corporativo_localidade.method("get_#{metodo}").call(@data)
end
