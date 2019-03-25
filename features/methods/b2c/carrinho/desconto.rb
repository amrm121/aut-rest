module DescontoCommons
  def self.obtenho_cupom_desconto_massa(tipo_cupom)
    begin
      arquivo = YAML.load_file("#{PATH_API_REST}features/support/massa/carrinho/pagamento.yml")
      arquivo['cupom_desconto'][tipo_cupom]
    rescue StandardError
      raise "A chave #{tipo_cupom} não foi encontrada no arquivo"
    end
  end

  def self.valida_mensagem_cupom
    begin
      arquivo = YAML.load_file("#{PATH_API_REST}features/support/massa/mensagens.yml")
      arquivo[BANDEIRA]['cupom_desconto_invalido']
    rescue StandardError
      raise "A chave #{BANDEIRA} não foi encontrada no arquivo"
    end
  end

  def self.validar_valor_com_desconto(response)
    valor_com_desconto = response['carrinho']['SubTotalProdutos'] - response['carrinho']['Cupom']['Valor']
    valor_total = valor_com_desconto + response['carrinho']['SubTotalFrete']
    valor_total
  end
end