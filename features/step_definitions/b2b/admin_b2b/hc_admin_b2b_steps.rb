Dado('que tenha um payload padrão do método {string} da API AdminB2B') do |string|
  metodo = string.downcase.tr(' ', '_')
  @data = HcLojaPersonalizada.method(metodo).call
end

Quando('é enviada uma requisição POST para {string} da API AdminB2B') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = admin_loja_personalizada.method("post_#{metodo}").call(@data)
end
