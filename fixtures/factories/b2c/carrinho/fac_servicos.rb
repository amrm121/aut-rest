class ServicosFactories

  FIQUE_SEGURO = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/servico_fique_seguro.yml")

  def self.fique_seguro(id_carrinho_sku, id_sku_servico, preco_venda_sku)
    json = FIQUE_SEGURO.dup
    json['IdUnidadeNegocio'] = unidade_negocio
    json['Token'] = $usuario_guid
    json['IdCarrinhoSku'] = id_carrinho_sku.to_i
    json['IdSkuServico'] = id_sku_servico
    json['PrecoVendaSku'] = preco_venda_sku.to_f
    json
  end
end