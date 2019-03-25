# encoding: utf-8
Dado('que faço uma requisição GET para o serviço Recomendacao') do
  @response_body_recomendacao = recomendacao.get_recomendacoes RequestRecommender.request_valid_sku_recommender
end

Então('o código de resposta deve ser {int} para o serviço Recomendacao') do |status_code|
  expect(@response_body_recomendacao.code).to eq status_code
end

Então('lista de recomendações deverá ser apresentada pelo serviço Recomendação') do
  puts "Sku disponibilizada: #{RequestRecommender.request_valid_sku_recommender}"
  expect(@response_body_recomendacao.parsed_response).to be_a_kind_of Array
  @response_body_recomendacao.parsed_response.each do |sku|
    expect(sku).not_to be_nil
    expect(sku).to be_a_kind_of Integer
  end
  puts "Skus recomendadas: #{@response_body_recomendacao}"
end
