module CartaoCommons
  def self.valida_mensagem
    begin
      mensagem = YAML.load_file("#{PATH_API_REST}features/support/massa/mensagens.yml")
      mensagem[BANDEIRA]['email_senha_incorreto']
    rescue StandardError
      raise "A chave #{BANDEIRA} não foi encontrada no arquivo"
    end
  end

  def self.carregar_dados_cartao(cartao)
    dados_cartao = {
      'numero': MASSA_PAGAMENTO['cartao_de_credito'][cartao]['numero'].sample,
      'cvv': MASSA_PAGAMENTO['cartao_de_credito'][cartao]['cvv'],
      'dtValMes': MASSA_PAGAMENTO['cartao_de_credito'][cartao]['dtValMes'],
      'dtValAno': MASSA_PAGAMENTO['cartao_de_credito'][cartao]['dtValAno'],
      'nome': MASSA_PAGAMENTO['cartao_de_credito'][cartao]['nome']
    }
    dados_cartao
  end

  def self.obter_id_pagamento_grupo_por_descricao(descricao_grupo, response_forma_grupo)
    response_forma_grupo.parsed_response['DadosRetorno'].each {|grupo|
      next unless grupo['TextoGrupo'].casecmp(descricao_grupo).zero?
      return grupo['IdFormaPagamentoGrupo']
    }
  end

  def self.obter_valor_desconto_avista(response)
    @valor_desconto_avista = response.parsed_response['Carrinho']['ValorComDescontoAVista']
  end

  def self.obter_valor_total
    @valor_total = @response_carrinhov2.parsed_response['Carrinho']['ValorTotal']
  end

  def self.obter_id_pagamento_por_descricao(descricao_pagamento, response)
    nome = MASSA_PAGAMENTO['descricao_pagamento'][descricao_pagamento]
    response.parsed_response['DadosRetorno'].each {|forma_pagamento|
      next unless nome.include?forma_pagamento['Nome']
      return forma_pagamento['IdFormaPagamento']
    }
  end

  def self.dividir_valor_cartao1(valor_total_compra)
    (valor_total_compra / 2).round(2)
  end

  def self.dividir_valor_cartao2(valor_total_compra)
    (valor_total_compra / 2).round(2)
  end

  def self.obter_id_parcelamento(forma_pagamento)
    forma_pagamento.parsed_response['CarrinhoFormaPagamento'][0]['FormaPagamento']['Parcelamentos'][0]['IdFormaPagamentoParcelamento']
  end

  def self.obter_id_parcelamento_por_descricao(descricao_pagamento, forma_pagamento)
    nome = MASSA_PAGAMENTO['descricao_pagamento'][descricao_pagamento]
    forma_pagamento.parsed_response['CarrinhoFormaPagamento'].each do |forma|
      next unless forma['FormaPagamento']['Nome'].casecmp(nome).zero?
        return @id_parcelamento = forma['FormaPagamento']['Parcelamentos'][0]['IdFormaPagamentoParcelamento']
    end
  end

  def self.obter_valor_parcela_por_descricao(descricao_pagamento, forma_pagamento)
    nome = MASSA_PAGAMENTO['descricao_pagamento'][descricao_pagamento]
    forma_pagamento.parsed_response['CarrinhoFormaPagamento'].each do |forma|
      if forma['FormaPagamento']['Nome'].casecmp(nome).zero?
        return @valor_compra = forma['FormaPagamento']['Parcelamentos'][0]['ValorParcela']
      end
    end
  end

  def self.obter_valor_parcela(forma_pagamento)
    forma_pagamento.parsed_response['CarrinhoFormaPagamento'][0]['FormaPagamento']['Parcelamentos'][0]['ValorParcela']
  end

  def self.calcula_valor_segundo_cartao(valor_carrinho, valor_cartao1, valor_cartao2)
    if valor_cartao1 + valor_cartao2 != valor_carrinho
      valor_cartao2 += (valor_carrinho - (valor_cartao1 + valor_cartao2)).round(2).to_f
    end
    valor_cartao2.round(2)
  end
end