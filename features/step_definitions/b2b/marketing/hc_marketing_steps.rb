Quando('é enviada uma requisição GET para {string} da API Marketing') do |string|
  metodo = string.downcase.tr(' ', '_')
  @response_body = parceiros_b2b_estrategia_venda.method("get_#{metodo}").call
end

Então('o serviço retorna uma resposta válida com status code {int}') do |status_code|
  expect(@response_body.code).to eql status_code
  expect(@response_body['Valido'] || @response_body['IsValid']).to be true
end

Então('o serviço retorna uma resposta sem erros com status code {int}') do |status_code|
  expect(@response_body.code).to eql status_code
  key = 'Erro'
  results = find_in_json(@response_body.body, [key])
  results[key].each { |k| expect(k).to be false }
end
