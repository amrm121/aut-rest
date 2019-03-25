Quando('é enviada uma requisição GET para {string} da API Segurança') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = seguranca_chaves.method("get_#{metodo}").call
end
