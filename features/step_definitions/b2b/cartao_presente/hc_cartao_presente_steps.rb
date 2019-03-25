Dado('que tenha um payload padrão do método {string} da API CartaoPresente') do |string|
  metodo = string.downcase.tr(' ', '_')
  @data = HcAdministracaoFactories.method(metodo).call
end

Quando('é enviada uma requisição GET para {string} da API CartaoPresente') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = cartao_presente_administracao.method("get_#{metodo}").call(@data)
end
