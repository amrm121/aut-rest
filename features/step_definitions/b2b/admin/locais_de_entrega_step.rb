#encoding: utf-8
Dado("que eu tenha um payload padrão para requisição") do
  @data = EntregaFactories.local_retirada
end

Dado("que eu tenha um payload padrão com dados de sku incorreto") do
  @data = EntregaFactories.sku_incorreto
end

Dado("que eu tenha um payload padrão com dados de CEP incorreto") do
  @data = EntregaFactories.cep_incorreto
end

Dado("que eu tenha um payload padrão com dados de campanha sem retira rápido") do
  @data = EntregaFactories.campanha_sem_retira
end

Dado("que eu tenha um payload padrão com dados de SKU sem retira rápido") do
  @data = EntregaFactories.sku_sem_retira
end

Quando("é enviada uma requisição para locais de entrega") do
  @response_body = entrega.get_locais_entrega(@data)
end

Então("devo ver uma lista informando os dez locais de entrega mais próximos") do
  expect(@response_body.parsed_response['LocaisRetirada'].empty?).to be false
  expect((@response_body.parsed_response['LocaisRetirada'].count) == 10)
  expect(@response_body.parsed_response['Valido']).to be true
  expect(@response_body.parsed_response['Mensagens'].empty?).to be true
  expect(@response_body.parsed_response['Protocolo'].empty?).to be false
  expect((@response_body.parsed_response['LocaisRetirada'].first['DistanciaCEP'].to_s).empty?).to be false
end

Então("devo ver informação sobre SKU inexistente") do
  expect(@response_body.parsed_response['LocaisRetirada'].empty?).to be true
  expect(@response_body.parsed_response['Valido']).to be false
  expect(@response_body.parsed_response['Mensagens'].empty?).to be false
  expect(@response_body.parsed_response['Mensagens'].first['Codigo']).to eql 'SKUNulo'
  expect(@response_body.parsed_response['Mensagens'].first['Conteudo']).to eql 'Sku não existe.'
  expect(@response_body.parsed_response['Protocolo'].empty?).to be false
end

Então("devo ver informação sobre CEP inválido") do
  expect(@response_body.parsed_response['LocaisRetirada']).to be_kind_of(NilClass)
  expect(@response_body.parsed_response['Valido']).to be false
  expect(@response_body.parsed_response['Mensagens'].empty?).to be false
  expect(@response_body.parsed_response['Mensagens'].first['Codigo']).to eql ''
  expect(@response_body.parsed_response['Mensagens'].first['Conteudo']).to eql 'O CEP informado é inválido'
  expect(@response_body.parsed_response['Protocolo'].empty?).to be false
end

Então("devo ver informação sobre campanha sem retira rápido") do
  expect(@response_body.parsed_response['Valido']).to be false
  expect(@response_body.parsed_response['Mensagens'].empty?).to be false
  expect(@response_body.parsed_response['Mensagens'].first['Codigo']).to eql 'CampanhaNaoPossuiRetira'
  expect(@response_body.parsed_response['Mensagens'].first['Conteudo']).to eql 'Campanha não possui a opção de retirada.'
  expect(@response_body.parsed_response['Protocolo'].empty?).to be false
end

Então("devo ver informação sobre SKU sem retira rápido") do
  expect(@response_body.parsed_response['Valido']).to be false
  expect(@response_body.parsed_response['Mensagens'].empty?).to be false
  expect(@response_body.parsed_response['Mensagens'].first['Codigo']).to eql 'SemLojasParaRetirada'
  expect(@response_body.parsed_response['Mensagens'].first['Conteudo']).to eql 'Desculpe! Não encontramos nenhum Ponto de Retirada próximo ao local informado.'
  expect(@response_body.parsed_response['Protocolo'].empty?).to be false
end

E("o código de resposta deve ser {int} no serviço") do |status_code|
  expect(@response_body.code).to eq status_code
end



