class CarneOnlineFactories

  CONTRATO_ELEGIBILIDADE = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/carne_online/elegibilidade.yml')
  CONTRATO_PLANO = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/carne_online/plano.yml')

  def self.contrato_elegibilidade
    json = CONTRATO_ELEGIBILIDADE.dup
    json['valorCompra'] = $valor_compra.to_f
    json
  end

  def self.contrato_plano
    json = CONTRATO_PLANO.dup
    json['ValorTotalCompra'] = $valor_compra.to_f
    json['ValorServicos'] = $valor_garantia.to_f
    json['ValorFrete'] = $valor_frete.to_f
    json
  end


end