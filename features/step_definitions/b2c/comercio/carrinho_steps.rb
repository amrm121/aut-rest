Quando("faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho") do
  @request_carrinho = carrinho.delete_sku_carrinho($id_cliente)
end

Quando("serviço ExcluirProdutosDoCarrinho deve responder com {int}") do |code|
  expect(@request_carrinho.code).to be code
end

E('informo um produto valido {string}, {string}') do |produto, logista|
  @contrato_carrinho_sku = RequestCarrinho.add_sku_to_cart(produto, logista)
end

Quando('faço uma requisição PUT para o serviço IncluirUmProdutoNoCarrinho') do
  @response_incluir_sku = carrinho.put_carrinho_sku(@contrato_carrinho_sku)
  expect(@response_incluir_sku.parsed_response['Erro']).to be_falsey, @response_incluir_sku.parsed_response['Mensagens'].to_s
  expect(@response_incluir_sku.parsed_response['Skus'][0]['Sku']['Erro']).to be_falsey, @response_incluir_sku.parsed_response['Skus'][0]['Sku']['Mensagens'].to_s
end

E('informo a forma de pagamento carne digital com {string} parcelas') do |parcelas|
  step 'faço uma requisição GET para o serviço ObterTokenCarneOnline'
  step 'faço uma requisição POST para o serviço Elegibilidade'
  step 'valido que o usuario esta elegivel ao carne digital'
  step 'faço uma requisição POST para o serviço Plano'
  step "informo a quantidade de parcelas para a compra com carne online '#{parcelas}'"
  @contrato_forma_pagamento = RequestCarrinho.contrato_carne_digital(@valor_total_compra, @id_cliente_legado, @qtd_parcelas, @valor_juros, @valor_parcela)
end

E('faço uma requisição POST para o serviço CompraFormaPagamento') do
  @response_forma_pagamento = carrinho.post_forma_pagamento(@contrato_forma_pagamento)
  expect(@response_forma_pagamento.parsed_response['Erro']).to be_falsey, @response_forma_pagamento.parsed_response['Mensagens'].to_s
end

E('faço uma requisição POST para o serviço Compra') do
  @contrato_compra = RequestCarrinho.consulta_carrinho_v2
  @response_compra = carrinho.post_compra(@contrato_compra)
  expect(@response_compra.parsed_response['Erro']).to be_falsey, @response_compra.parsed_response['Mensagens'].to_s
  expect(@response_compra.parsed_response['IdCompra']).not_to be_nil
  @id_compra = @response_compra.parsed_response['IdCompra']
end

Entao('valido o fechamento da compra com sucesso') do
  @id_compra = @response_compra.parsed_response['IdCompra']
  @response_compra_finalizada = consultar_compra.compra_finalizada(@id_compra)
  expect(@response_compra_finalizada.code).to be 200
  expect(@response_compra_finalizada.parsed_response['Valido']).to eql true
  puts "Numero do pedido: #{@id_compra}"
end

E('faço uma requisição POST para o serviço ObterCarrinho') do
  @contratojson = RequestCarrinho.obter_carrinho
  @responsebody_carrinho = carrinho.post_carrinho(@contratojson)
end

E('valido o retorno do servico ObterCarrinho') do
  expect(@responsebody_carrinho.parsed_response['Erro']).to be_falsey, @responsebody_carrinho.parsed_response['Mensagens'].to_s
  $valor_compra = @responsebody_carrinho.parsed_response['ValorTotal']
  $valor_frete = @responsebody_carrinho.parsed_response['SubTotalFrete']
  $valor_produtos = @responsebody_carrinho.parsed_response['SubTotalProdutos']
  $valor_garantia = @responsebody_carrinho.parsed_response['ValorGarantia']
end

E('altero a quantidade do produto para {string}') do |qtd|
  @responsebody_carrinho.parsed_response['Skus'].each {|produto|
    next unless produto['Sku']['IdSku'] == $id_sku.to_i
    if qtd.to_i > 1
      @id_sku_carrinho = produto['CarrinhoSkuIds'][0]
      @quantidade_sku = qtd
      step 'faço uma requisição POST para o serviço alterarQuantidadeSku'
    end
  }
end

E('faço uma requisição POST para o serviço alterarQuantidadeSku') do
  @response_quantidade_sku = carrinho.post_alterar_quantidade_sku(@id_sku_carrinho, @quantidade_sku)
  expect(@response_quantidade_sku.parsed_response['Erro']).to eql false
end

E('faço uma requisição PUT para o serviço incluirSkuServico') do
  @response_body = carrinho.put_incluir_sku_servico(@contrato_sku_servico)
end

E('informo o tipo de serviço fique seguro {string}') do |fique_seguro|
  #todo - Melhorar solução para mais de um produto
  if fique_seguro != ''
    case fique_seguro.downcase
    when 'roubo e furto qualificado'
      id_sku_servico = @response_incluir_sku['Skus'][0]['Sku']['FiqueSeguro'][2]['IdServicoPlano']
    when 'quebra acidental'
      id_sku_servico = @response_incluir_sku['Skus'][0]['Sku']['FiqueSeguro'][1]['IdServicoPlano']
    when "roubo e furto qualificado + quebra acidental"
      id_sku_servico = @response_incluir_sku['Skus'][0]['Sku']['FiqueSeguro'][0]['IdServicoPlano']
    else
      raise "Não foi encontrado o fique seguro informado #{fique_seguro}"
    end
    preco_venda_sku = @response_incluir_sku['Skus'][0]['PrecoPorValorUnitario']
    id_carrinho_sku = @response_incluir_sku['Skus'][0]['CarrinhoSkuIds'][0]
    @contrato_sku_servico = ServicosFactories.fique_seguro(id_carrinho_sku, id_sku_servico, preco_venda_sku)
    step 'faço uma requisição PUT para o serviço incluirSkuServico'
  end
end

Quando('adiciono produto no carrinho') do |table|
  table.hashes.each do |row|
    step "informo um produto valido '#{row[:produto]}', '#{row[:logista]}'"
    step 'faço uma requisição PUT para o serviço IncluirUmProdutoNoCarrinho'
    step 'faço uma requisição POST para o serviço ObterCarrinho'
    step 'valido o retorno do servico ObterCarrinho'
    step "informo o tipo de serviço fique seguro '#{row[:fiqueSeguro]}'"
    step "altero a quantidade do produto para '#{row[:quantidade]}'"
  end
end

E('finalizo a compra') do
  step 'faço uma requisição POST para o serviço CompraFormaPagamento'
  step 'faço uma requisição POST para o serviço Compra'
end

E('seleciono o tipo de entrega {string} para o endereço {string}') do |tipo_entrega, endereco|
  step 'faço uma requisição GET para o serviço Endereco'
  step "informo o endereço de entrega '#{endereco}', '#{tipo_entrega}'"
  step 'faço uma requisição GET para o serviço ListarEntregas'
  step "informo o tipo de entrega '#{tipo_entrega}'"
  step 'faço uma requisição POST para o serviço alterarEnderecoEntrega'
  step 'faço uma requisição POST para o serviço ObterCarrinho'
  step 'valido o retorno do servico ObterCarrinho'
end

E('faço uma requisição POST para o serviço V2Carrinho') do
  @contrato_carrinhov2 = RequestCarrinho.consulta_carrinho_v2
  @response_carrinhov2 = carrinho.post_carrinho_v2(@contrato_carrinhov2)
end

E('adiciono um produto de uma lista de casamento') do

end








