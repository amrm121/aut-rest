E('informo a forma de pagamento boleto') do
  @contrato_forma_pagamento = RequestCarrinho.contrato_boleto
end

E('faço uma requisição GET para o serviço FormaPagamentoGrupo') do
  @response_forma_pagamento_grupo = forma_pagamento.get_forma_pagamento_grupos
end

E('faço uma requisição GET para o serviço FormaPagamento') do
  @response_id_forma_pagamento = forma_pagamento.get_id_forma_pagamento(@id_forma_pgto_grupo)
end

E('informo o cartao para recuperar os ids de Parcelamento') do
  @contrato_pagamento_forma = RequestCarrinho.pagamento_cartao_num(@dados_cartao, @valor_cartao)
end

E('informo o cartao presente para recuperar o id Parcelamento') do
  @contrato_pagamento_forma = RequestCarrinho.pagamento_cartao_presente(@id_forma_pagamento, @valor_total_compra)
end

E('informo o cartao e boleto para recuperar os ids de Parcelamento') do
  @contrato_pagamento_forma = RequestCarrinho.pagamento_boleto_cartao_num(@dados_cartao, @valor_compra_boleto, @valor_compra_cartao, @id_forma_pagamento_cartao, @id_forma_pagamento_boleto)
end

E('faço uma requisição POST para o serviço FormaPagamento') do
  @response_pagamento_forma = forma_pagamento.post_pagamento_forma(@contrato_pagamento_forma)
end

E('informo o cartao {string} para recuperar os ids de Parcelamento') do |dados_cartao|
  @contrato_pagamento_forma = RequestCarrinho.pagamento_cartao_num(dados_cartao, @valor_cartao)
end

E('informo a forma de pagamento boleto mais cartão de crédito {string}') do |descricao_cartao|
  @dados_cartao = CartaoCommons.carregar_dados_cartao descricao_cartao
  step 'faço uma requisição GET para o serviço FormaPagamentoGrupo'
  @id_forma_pgto_grupo = CartaoCommons.obter_id_pagamento_grupo_por_descricao 'Cartões de Crédito', @response_forma_pagamento_grupo
  step 'faço uma requisição GET para o serviço FormaPagamento'
  step 'faço uma requisição POST para o serviço V2Carrinho'
  @valor_desconto_avista = @response_carrinhov2.parsed_response['Carrinho']['ValorComDescontoAVista']
  @valor_total = @response_carrinhov2.parsed_response['Carrinho']['ValorTotal']
  @valor_compra_boleto = MASSA_PAGAMENTO['valor_minimo_boleto'].to_f
  @valor_compra_cartao = (@valor_desconto_avista - @valor_compra_boleto).to_f
  @id_forma_pagamento_cartao = CartaoCommons.obter_id_pagamento_por_descricao descricao_cartao, @response_id_forma_pagamento
  @id_forma_pgto_grupo = CartaoCommons.obter_id_pagamento_grupo_por_descricao 'Boleto Bancário', @response_forma_pagamento_grupo
  step 'faço uma requisição GET para o serviço FormaPagamento'
  @id_forma_pagamento_boleto = CartaoCommons.obter_id_pagamento_por_descricao 'boleto', @response_id_forma_pagamento
  step 'informo o cartao e boleto para recuperar os ids de Parcelamento'
  step 'faço uma requisição POST para o serviço FormaPagamento'
  @id_parcelamento_cartao = CartaoCommons.obter_id_parcelamento_por_descricao descricao_cartao, @response_pagamento_forma
  @valor_compra_cartao = CartaoCommons.obter_valor_parcela_por_descricao descricao_cartao, @response_pagamento_forma
  @id_parcelamento_boleto = CartaoCommons.obter_id_parcelamento_por_descricao 'boleto', @response_pagamento_forma
  @valor_compra_boleto = CartaoCommons.obter_valor_parcela_por_descricao 'boleto', @response_pagamento_forma
  @contrato_forma_pagamento = RequestCarrinho.contrato_boleto_cartao(@dados_cartao, @id_forma_pagamento_cartao, @id_parcelamento_cartao, @valor_compra_cartao, @id_forma_pagamento_boleto, @id_parcelamento_boleto, @valor_compra_boleto)
end

E('informo a forma de pagamento cartao de credito {string}') do |descricao_cartao|
  @dados_cartao = CartaoCommons.carregar_dados_cartao descricao_cartao
  step 'faço uma requisição GET para o serviço FormaPagamentoGrupo'
  @id_forma_pgto_grupo = CartaoCommons.obter_id_pagamento_grupo_por_descricao 'Cartões de Crédito', @response_forma_pagamento_grupo
  step 'faço uma requisição GET para o serviço FormaPagamento'
  step 'faço uma requisição POST para o serviço V2Carrinho'
  @valor_cartao = CartaoCommons.obter_valor_desconto_avista @response_carrinhov2
  @id_forma_pagamento = CartaoCommons.obter_id_pagamento_por_descricao descricao_cartao, @response_id_forma_pagamento
  step 'informo o cartao para recuperar os ids de Parcelamento'
  step 'faço uma requisição POST para o serviço FormaPagamento'
  @id_parcelamento = CartaoCommons.obter_id_parcelamento @response_pagamento_forma
  @valor_compra = CartaoCommons.obter_valor_parcela @response_pagamento_forma
  @contrato_forma_pagamento = RequestCarrinho.contrato_cartao_credito(@dados_cartao, @valor_compra, @id_parcelamento, @id_forma_pagamento)
end

E('informo a forma de pagamento dois cartoes {string}, {string}') do |descricao_cartao1, descricao_cartao2|
  @dados_cartao1 = CartaoCommons.carregar_dados_cartao descricao_cartao1
  @dados_cartao2 = CartaoCommons.carregar_dados_cartao descricao_cartao2
  step 'faço uma requisição GET para o serviço FormaPagamentoGrupo'
  @id_forma_pgto_grupo = CartaoCommons.obter_id_pagamento_grupo_por_descricao 'Cartões de Crédito', @response_forma_pagamento_grupo
  step 'faço uma requisição GET para o serviço FormaPagamento'
  step 'faço uma requisição POST para o serviço V2Carrinho'
  valor_total_compra = CartaoCommons.obter_valor_desconto_avista @response_carrinhov2
  @valor_cartao = CartaoCommons.dividir_valor_cartao1 valor_total_compra
  @dados_cartao = @dados_cartao1
  @id_forma_pagamento_1 = CartaoCommons.obter_id_pagamento_por_descricao descricao_cartao1, @response_id_forma_pagamento
  step 'informo o cartao para recuperar os ids de Parcelamento'
  step 'faço uma requisição POST para o serviço FormaPagamento'
  @id_parcelamento_1 = CartaoCommons.obter_id_parcelamento @response_pagamento_forma
  @valor_compra_1 = CartaoCommons.obter_valor_parcela @response_pagamento_forma
  @valor_cartao2 = CartaoCommons.dividir_valor_cartao2 valor_total_compra
  @valor_cartao = @valor_cartao2
  @dados_cartao = @dados_cartao2
  @id_forma_pagamento_2 = CartaoCommons.obter_id_pagamento_por_descricao descricao_cartao2, @response_id_forma_pagamento
  step 'informo o cartao para recuperar os ids de Parcelamento'
  step 'faço uma requisição POST para o serviço FormaPagamento'
  @id_parcelamento_2 = CartaoCommons.obter_id_parcelamento @response_pagamento_forma
  @valor_compra_2 = CartaoCommons.obter_valor_parcela @response_pagamento_forma
  @valor_compra_2 = CartaoCommons.calcula_valor_segundo_cartao valor_total_compra, @valor_compra_1, @valor_compra_2
  @contrato_forma_pagamento = RequestCarrinho.contrato_dois_cartoes(@dados_cartao1, @dados_cartao2, @id_forma_pagamento_1, @id_parcelamento_1, @valor_compra_1, @id_forma_pagamento_2, @id_parcelamento_2, @valor_compra_2)
end

E('informo a forma de pagamento vale presente') do
  step 'faço uma requisição GET para o serviço FormaPagamentoGrupo'
  @id_forma_pgto_grupo = CartaoCommons.obter_id_pagamento_grupo_por_descricao 'Cartão Presente / Cartão de Compras', @response_forma_pagamento_grupo
  step 'faço uma requisição GET para o serviço FormaPagamento'
  step 'faço uma requisição POST para o serviço V2Carrinho'
  @valor_total_compra = CartaoCommons.obter_valor_desconto_avista @response_carrinhov2
  @id_forma_pagamento = CartaoCommons.obter_id_pagamento_por_descricao 'cartao_presente', @response_id_forma_pagamento
  step 'informo o cartao presente para recuperar o id Parcelamento'
  step 'faço uma requisição POST para o serviço FormaPagamento'
  @id_parcelamento = CartaoCommons.obter_id_parcelamento @response_pagamento_forma
  @contrato_cartao_presente = RequestCarrinho.contrato_cartao_presente('123456', '123')
end

E('faço uma requisição POST para o serviço CartaoPresenteValidar') do
  @response_cartao_presente = forma_pagamento.post_validar_cartao_presente(@contrato_cartao_presente)
end

E('valido mensagem de erro ao enviar o cartao presente sem captcha') do
  expect(@response_cartao_presente['Erro']).to eql true
  expect(@response_cartao_presente['Mensagens'][0]).to eql CartaoPresenteCommons.valida_mensagem_digite_imagem
end
