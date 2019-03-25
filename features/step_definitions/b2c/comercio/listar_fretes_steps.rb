# encoding: utf-8
Dado ("que tenha informado um sku e endereço loja física do tipo {string}") do |ponto_retirada|
  case ponto_retirada.downcase
  when 'retira'
    @request_listar_fretes = RequestListarFretes.listar_frete_retira
  when 'lockers'
    @request_listar_fretes = RequestListarFretes.listar_frete_lockers
  when 'correios'
    @request_listar_fretes = RequestListarFretes.listar_frete_correios
  else
    raise "O ponto de reitrada informado está inválido: #{ponto_retirada}"
  end
end

Dado("que tenha informado um lojista {string}, sku {string} e endereço loja física  {string}") do |lojista, sku, endereco|
  @request_listar_fretes = RequestListarFretes.listar_fretes(lojista, sku, endereco)

end

Dado("que eu tenha informado o lojista, sku e endereço loja fisica dos dois produtos") do |table|
  @request_listar_fretes = RequestListarFretes.listar_fretes_multiplas_lojas(table)
end

Quando ("é enviada uma requisição do tipo post para o serviço Listar Frete") do
  @response_body_listar_frete = listar_fretes.post_listar_fretes @request_listar_fretes
end

Entao ("o código de resposta deve ser {int} para o serviço Listar Frete") do |status_code|
  expect(@response_body_listar_frete.code).to eq status_code
end

Entao ("o campo IdTipoPontoRetirada deve apresentar o valor {int}") do |id_ponto_retirada|
  expect(@response_body_listar_frete.parsed_response["Fretes"]).to be_truthy, "Não foi listado nenhum Frete"
  expect(@response_body_listar_frete.parsed_response["Fretes"].first["IdTipoPontoRetirada"]).to eql id_ponto_retirada
end

Entao("o campo Fretes deve apresentar o valor {string}") do |fretes|
  expect(@response_body_listar_frete["Fretes"]).to eql nil
end
