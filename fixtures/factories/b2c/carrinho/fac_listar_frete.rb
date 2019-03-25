class RequestListarFretes
  LISTAR_FRETE_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/carrinho/listar_fretes.yml')
  LISTAR_FRETE_MULTIPLAS_LOJAS_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/carrinho/listar_fretes_multiplas_lojas.yml')
  LISTAR_FRETE_MASSA = YAML.load_file("#{PATH_API_REST}features/support/massa/carrinho/listar_fretes.yml")


  def self.listar_fretes(lojista, sku, endereo_loja_fisica)
    hash = LISTAR_FRETE_REQUEST.dup
    hash['LojasFisicas'].first['IdLojista'] = LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_lojista'][lojista]
    hash['LojasFisicas'].first['IdSku'] = LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_sku'][sku]
    hash['LojasFisicas'].first['IdEnderecoLojaFisica'] = LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_endereco_loja_fisica'][endereo_loja_fisica]
    hash['UsuarioGuid'] = LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['usuario_guid']
    hash
  end

  def self.listar_fretes_multiplas_lojas(table)
    hash = LISTAR_FRETE_MULTIPLAS_LOJAS_REQUEST.dup
    table.hashes.each do |row|
      hash['LojasFisicas'].first['IdLojista'] = (LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_lojista'][row[:lojista]]).to_i
      hash['LojasFisicas'].first['IdSku'] = (LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_sku'][row[:sku]]).to_i
      hash['LojasFisicas'].first['IdEnderecoLojaFisica'] = (LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_endereco_loja_fisica'][row[:endereco_loja_fisica]]).to_i
      hash['LojasFisicas'].last['IdLojista'] = (LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_lojista'][row[:lojista_2]]).to_i
      hash['LojasFisicas'].last['IdSku'] = (LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_sku'][row[:sku_2]]).to_i
      hash['LojasFisicas'].last['IdEnderecoLojaFisica'] = (LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['id_endereco_loja_fisica'][row[:endereco_loja_fisica_2]]).to_i
      hash['UsuarioGuid'] = LISTAR_FRETE_MASSA[BANDEIRA][AMBIENTE]['usuario_guid']
    end
    hash
  end
end