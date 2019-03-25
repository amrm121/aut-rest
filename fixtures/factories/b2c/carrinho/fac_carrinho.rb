class RequestCarrinho

  CARRINHO_REQUEST = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/carrinho.yml")
  CARRINHO_SKU_REQUEST = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/carrinho_sku.yml")
  CONTRATO_CARNE_DIGITAL = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/carne_digital.yml")
  CONTRATO_OBTER_CARRINHO = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/obter_carrinho.yml")
  CONTRATO_BOLETO = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/boleto.yml")
  CONTRATO_CARTAO_CREDITO = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/cartao_credito.yml")
  CONTRATO_DOIS_CARTOES = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/dois_cartoes.yml")
  CONTRATO_CARTAO_NUM = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/forma_num_cartao.yml")
  CONTRATO_CARTAO_BOLETO_NUM = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/forma_num_cartao_boleto.yml")
  CONTRATO_CARTAO_BOLETO = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/boleto_cartao.yml")
  CONTRATO_CUPOM = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/cupom_desconto.yml")
  CONTRATO_CARTAO_PRESENTE_NUM = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/forma_num_cartao_presente.yml")
  CONTRATO_CARTAO_PRESENTE = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/forma_pagamento/cartao_presente.yml")


  def self.consulta_carrinho
    json = CARRINHO_REQUEST.dup
    json['IdUnidadeNegocio'] = unidade_negocio
    json
  end

  def self.consulta_carrinho_sku
    var_carrinho = CARRINHO_SKU_REQUEST.dup
    var_carrinho['IdSku'] = 9373016
    var_carrinho
  end

  def self.add_sku_to_cart(produto, logista)
    massa = YAML.load_file("#{PATH_API_REST}features/support/massa/carrinho/listar_fretes.yml")[BANDEIRA][AMBIENTE]
    $id_sku = if massa['id_sku'][produto].kind_of?(Array)
                massa['id_sku'][produto].sample
              else
                massa['id_sku'][produto]
              end

    json = CARRINHO_SKU_REQUEST.dup
    json['Token'] = $usuario_guid
    json['IdUnidadeNegocio'] = unidade_negocio
    json['IdSku'] = $id_sku
    json['IdLojista'] = massa['id_lojista'][logista]
    json
  end

  def self.contrato_carne_digital(valor_total_compra, id_cliente_legado, qtde_parcelas, valor_juros, valor_parcela)
    json = CONTRATO_CARNE_DIGITAL.dup
    json[0]['Valor'] = valor_total_compra.to_f
    json[0]['FormaPagamentoCarneOnline']['IdClienteLegado'] = id_cliente_legado.to_i
    json[0]['FormaPagamentoCarneOnline']['QuantidadeDeParcelasCarneOnline'] = qtde_parcelas.to_i
    json[0]['FormaPagamentoCarneOnline']['ValorTotalJuros'] = valor_juros.to_f
    json[0]['FormaPagamentoCarneOnline']['ValorParcela'] = valor_parcela.to_f
    json
  end

  def self.obter_carrinho
    json = CONTRATO_OBTER_CARRINHO.dup
    json
  end

  def self.contrato_boleto
    json = CONTRATO_BOLETO.dup
    json[0]['Valor'] = $valor_compra.to_f
    json
  end

  def self.contrato_cartao_credito(cartao, valor_compra, id_parcelamento, id_forma_pagamento)
    json = CONTRATO_CARTAO_CREDITO.dup
    json[0]['Valor'] = valor_compra.to_f
    json[0]['IdFormaPagamentoParcelamento'] = id_parcelamento
    json[0]['IdFormaPagamento'] = id_forma_pagamento
    json[0]['NrSeguranca'] = cartao[:cvv].to_s
    json[0]['Nome'] = cartao[:nome].to_s
    json[0]['NrCartao'] = cartao[:numero].to_s
    json[0]['DtValidadeAno'] = cartao[:dtValAno].to_s
    json[0]['DtValidadeMes'] = cartao[:dtValMes].to_s
    json
  end

  def self.contrato_dois_cartoes(cartao1, cartao2, id_forma_pagamento_1, id_parcelamento_1, valor_compra_1, id_forma_pagamento_2, id_parcelamento_2, valor_compra_2)
    json = CONTRATO_DOIS_CARTOES.dup
    json[0]['Valor'] = valor_compra_1.to_f
    json[0]['IdFormaPagamentoParcelamento'] = id_parcelamento_1
    json[0]['IdFormaPagamento'] = id_forma_pagamento_1
    json[0]['NrSeguranca'] = cartao1[:cvv]
    json[0]['Nome'] = cartao1[:nome].to_s
    json[0]['NrCartao'] = cartao1[:numero].to_s
    json[0]['DtValidadeAno'] = cartao1[:dtValAno].to_s
    json[0]['DtValidadeMes'] = cartao1[:dtValMes].to_s
    json[1]['Valor'] = valor_compra_2.to_f
    json[1]['IdFormaPagamentoParcelamento'] = id_parcelamento_2
    json[1]['IdFormaPagamento'] = id_forma_pagamento_2
    json[1]['NrSeguranca'] = cartao2[:cvv].to_s
    json[1]['Nome'] = cartao2[:nome].to_s
    json[1]['NrCartao'] = cartao2[:numero].to_s
    json[1]['DtValidadeAno'] = cartao2[:dtValAno].to_s
    json[1]['DtValidadeMes'] = cartao2[:dtValMes].to_s
    json
  end

  def self.pagamento_cartao_num(cartao, valor_compra)
    json = CONTRATO_CARTAO_NUM.dup
    json['IdUnidadeNegocio'] = unidade_negocio
    json['Token'] = $usuario_guid
    json['FormasPagamento'][0]['NumeroCartao'] = cartao[:numero].to_s
    json['FormasPagamento'][0]['Valor'] = valor_compra.to_f
    json
  end

  def self.consulta_carrinho_v2
    json = CARRINHO_REQUEST.dup
    json['IdUnidadeNegocio'] = unidade_negocio
    json['Token'] = $usuario_guid
    json['Operador'] = ""
    json
  end

  def self.pagamento_boleto_cartao_num(cartao, valor_compra_boleto, valor_compra_cartao, id_cartao, id_boleto)
    json = CONTRATO_CARTAO_BOLETO_NUM.dup
    json['FormasPagamento'][0]['Valor'] = valor_compra_cartao.to_f
    json['FormasPagamento'][0]['NumeroCartao'] = cartao['numero']
    json['FormasPagamento'][0]['IdFormaPagamento'] = id_cartao
    json['FormasPagamento'][1]['Valor'] = valor_compra_boleto.to_f
    json['FormasPagamento'][1]['IdFormaPagamento'] = id_boleto
    json
  end

  def self.contrato_boleto_cartao(dados_cartao, id_forma_pgto_cartao, id_parcela_cartao, valor_compra_cartao, id_forma_pgto_boleto, id_parcela_boleto, valor_compra_boleto)
    json = CONTRATO_DOIS_CARTOES.dup
    json[0]['Valor'] = valor_compra_cartao.to_f
    json[0]['IdFormaPagamentoParcelamento'] = id_parcela_cartao
    json[0]['IdFormaPagamento'] = id_forma_pgto_cartao
    json[0]['NrSeguranca'] = dados_cartao[:cvv]
    json[0]['Nome'] = dados_cartao[:nome].to_s
    json[0]['NrCartao'] = dados_cartao[:numero].to_s
    json[0]['DtValidadeAno'] = dados_cartao[:dtValAno].to_s
    json[0]['DtValidadeMes'] = dados_cartao[:dtValMes].to_s
    json[1]['IdFormaPagamento'] = id_forma_pgto_boleto
    json[1]['IdFormaPagamentoParcelamento'] = id_parcela_boleto
    json[1]['Valor'] = valor_compra_boleto.to_f
    json
  end

  def self.contrato_cupom_desconto(cupom)
    json = CONTRATO_CUPOM.dup
    json['Cupom'] = cupom
    json
  end

  def self.pagamento_cartao_presente(id_forma, valor)
    json = CONTRATO_CARTAO_PRESENTE_NUM.dup
    json['FormasPagamento'][0]['IdFormaPagamento'] = id_forma
    json['FormasPagamento'][0]['Valor'] = valor.to_f
    json['IdUnidadeNegocio'] = unidade_negocio
    json['Token'] = $usuario_guid
    json
  end

  def self.contrato_cartao_presente(numero, senha)
    json = CONTRATO_CARTAO_PRESENTE.dup
    json['formaPagamentoCartaoPresente']['Token'] = $usuario_guid
    json['formaPagamentoCartaoPresente']['IdUnidadeNegocio'] = unidade_negocio
    json['formaPagamentoCartaoPresente']['Senha'] = senha
    json['formaPagamentoCartaoPresente']['Numero'] = numero
    json['IdUnidadeNegocio'] = unidade_negocio
    json['Token'] = $usuario_guid
    json
  end

end