Quando('é enviada uma requisição GET para {string} da API CotadorB2B') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = cotador_b2b_comum.method("get_#{metodo}").call
end
