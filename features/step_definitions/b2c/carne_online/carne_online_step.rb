Quando('faço uma requisição GET para o serviço ObterTokenCarneOnline') do
  @response_body = consultar_cliente.get_obter_token_carne_online
  expect(@response_body.parsed_response['Erro']).to eq false
  $cpf_cliente = @response_body.parsed_response['Cpf']
  $id_cliente = @response_body.parsed_response['IdCliente']
  @@authticket = @response_body.parsed_response['Token']
  $usuario_guid = @response_body.parsed_response['UsuarioGUID']
end

E("serviço carne online deve responder o status {int}") do |status_code|
  expect(@response_body.code).to eq status_code
end

Quando("faço uma requisição POST para o serviço Elegibilidade") do
  @contrato_json = CarneOnlineFactories.contrato_elegibilidade
  @response_body = carne_online.consultar_elegibilidade(@contrato_json)
  expect(@response_body.parsed_response['valido']).to eq true
  @id_cliente_legado = @response_body.parsed_response['codigoCliente']
end

E("valido que o usuario esta elegivel ao carne digital") do
  expect(@response_body.parsed_response['clienteElegivel']).to eq true
  expect(@response_body.parsed_response['valido']).to eq true
end

E("faço uma requisição POST para o serviço Plano") do
  @contrato_json = CarneOnlineFactories.contrato_plano
  @responsebody_plano = carne_online.consultar_plano(@contrato_json)
  expect(@response_body.parsed_response['valido']).to eq true
end

E('informo a quantidade de parcelas para a compra com carne online {string}') do |parcelas|
  parelas_servico = @responsebody_plano.parsed_response['parcelas'].length
  # caso o numeros de parcelas informado for maior que o disponivel, será selecionado a maior parcela disponivel
  if parelas_servico < parcelas.to_i
    parcela = parelas_servico.to_i - 1
    @valor_parcela = @responsebody_plano.parsed_response['parcelas'][parcela]['valor']
    @valor_juros = @responsebody_plano.parsed_response['parcelas'][parcela]['jurosNominal']
    $valor_total_compra = @responsebody_plano.parsed_response['parcelas'][parcela]['valorTotalCompra']
    @qtd_parcelas = @responsebody_plano.parsed_response['parcelas'][parcela]['numero']
  else
    parcela = parcelas.to_i - 1
    @valor_parcela = @responsebody_plano.parsed_response['parcelas'][parcela]['valor']
    @valor_juros = @responsebody_plano.parsed_response['parcelas'][parcela]['jurosNominal']
    @valor_total_compra = @responsebody_plano.parsed_response['parcelas'][parcela]['valorTotalCompra']
    @qtd_parcelas = @responsebody_plano.parsed_response['parcelas'][parcela]['numero']
  end

end





