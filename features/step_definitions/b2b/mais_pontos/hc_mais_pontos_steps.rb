Dado('que tenha um payload padrão do método {string} da API MaisPontos') do |string|
  metodo = string.downcase.tr(' ', '_')
  @data = HcConfiguracaoFactories.method(metodo).call
end

Quando('é enviada uma requisição GET para {string} da API MaisPontos') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = mais_pontos_configuracao.method("get_#{metodo}").call(@data)
end
