#encoding: utf-8
Dado('que eu tenha informado o cep e sku desejado') do |table|
  table.hashes.each do |row|
    @data = RequestOutrasLojasRetira.list_shops_mass(row[:cep], row[:sku])
  end
end

Quando ('é enviada uma requisição GET para o serviço AsyncOutrasLojasRetira') do
  @response_body = lojas_retira.get_outras_lojas_retira(@data)
end

Entao ('o código de resposta deve ser {int} para o serviço AsyncOutrasLojasRetira') do |status_code|
  expect(@response_body.code).to eq status_code
end

Então ('as {int} primeiras lojas retornadas devem ser do tipo retira') do |number_shops|
  expect(RetiraCommons.check_sequence_withdraw_point(number_shops, 'retira', @response_body)).to eql(true)
end

Então('é retornada uma mensagem solicitando para informar um cep válido') do
  expect(@response_body['Mensagem']).to eql 'Informe um Cep válido.'
end

Então('é retornada uma mensagem informando que não foi encontrado nenhum ponto de retirada') do
  expect(@response_body['Mensagem']).to eql 'Desculpe! Não encontramos nenhum Ponto de Retirada próximo ao CEP informado.'
end

Então('é retornado ponto de retirada do tipo {string}') do |form_withdraw|
  is_withdraw_type = RetiraCommons.check_contains_withdraw_point(form_withdraw, @response_body)
  expect(is_withdraw_type).to be_truthy, "Não foi encontrado nenhum ponto de retirada do tipo: #{form_withdraw}"
end

Então('não é retornado nenhum ponto de retirada do tipo {string}') do |form_withdraw|
  is_withdraw_type = RetiraCommons.check_contains_withdraw_point(form_withdraw, @response_body)
  expect(is_withdraw_type).to be_falsey, "Ponto de retirada encontrado: #{form_withdraw}"
end
