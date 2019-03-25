class OmnichannelFactories

  OMNICHANNEL_EFETIVACAO = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/omnichannel/omnichannel_efetivacao_cupom.yml')
  OMNICHANNEL_CONSULTA = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/omnichannel/omnichannel_consulta_cupom.yml')
  OMNICHANNEL_CONSUMO = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/omnichannel/omnichannel_consumo_cupom.yml')

  def self.modelo_efetivacao(cupom, bandeira, canal_venda, lista_sku, tipo_venda)

    var_cupom = OMNICHANNEL_EFETIVACAO.dup
    var_cupom['codigoCupom'] = cupom
    var_cupom['codigoBandeira'] = bandeira
    var_cupom['codigoCanalVenda'] = canal_venda
    var_cupom['listaSku'][0]['codigoSku'] = lista_sku
    var_cupom['tipoVenda'] = tipo_venda
    puts "o var_cupom é #{var_cupom}"
    var_cupom
  end


  def self.modelo_consulta(cupom, bandeira, canal_venda, lista_sku, tipo_venda, cpf)

    var_cupom = OMNICHANNEL_CONSULTA.dup
    var_cupom['codigoCupom'] = cupom
    var_cupom['codigoBandeira'] = bandeira
    var_cupom['codigoCanalVenda'] = canal_venda
    var_cupom['listaSku'][0]['codigoSku'] = lista_sku
    var_cupom['tipoVenda'] = tipo_venda
    var_cupom['cpf'] = cpf
    puts "o var_cupom é #{var_cupom}"
    var_cupom

  end

  def self.modelo_consumo(cupom, bandeira, canal_venda, lista_sku, tipo_venda)

    var_cupom = OMNICHANNEL_consumo.dup
    var_cupom['codigoCupom'] = cupom
    var_cupom['codigoBandeira'] = bandeira
    var_cupom['codigoCanalVenda'] = canal_venda
    var_cupom['listaSku'][0]['codigoSku'] = lista_sku
    var_cupom['tipoVenda'] = tipo_venda
    puts "o var_cupom é #{var_cupom}"
    var_cupom
  end

end