class RequestEndereco
  ENDERECO_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/endereco/endereco.yml')
  DADOS_USUARIO = YAML.load_file("#{PATH_API_REST}features/support/massa/dados_usuario.yml")

  def self.request_adicionar_endereco(cep)
    cep = cep_valido(cep)
    endereco = buscaCep(cep)
    var_endereco = ENDERECO_REQUEST.dup
    var_endereco['clienteEndereco']['Cep'] = cep
    var_endereco['clienteEndereco']['Destinatario'] = 'VV Aut Bot'
    var_endereco['clienteEndereco']['PontoReferencia'] = 'Testes Aut'
    var_endereco['clienteEndereco']['Estado'] =  endereco['estado']
    var_endereco['clienteEndereco']['Municipio'] = endereco['cidade']
    var_endereco['clienteEndereco']['Bairro'] = endereco['bairro']
    var_endereco['clienteEndereco']['Complemento'] = 'Testes aut'
    var_endereco['clienteEndereco']['Numero'] = '111'
    var_endereco['clienteEndereco']['Rua'] = endereco['logradouro']
    var_endereco['clienteEndereco']['Nome'] = 'VV Aut ' + endereco['estado'].to_s + ' ' + rand(1...100000).to_s
    var_endereco['clienteEndereco']['TipoEndereco'] = ['Residencial', 'Comercial'].sample
    var_endereco
  end

  private

  def self.buscaCep cep
    begin
      hash =  Postmon::Rest::Postmon.new.get_cep cep
    rescue Net::ReadTimeout
      raise 'Lentidão na API Postmon'
    end
    hash
  end

  def self.cep_valido(cep)
    case cep
    when 'sp'
      cep = DADOS_USUARIO['cep_valido']['sp'].sample
    when 'rj'
      cep = DADOS_USUARIO['cep_valido']['rj'].sample
    when 'sp_paulista'
      cep = DADOS_USUARIO['cep_valido']['sp_paulista'].sample
    when 'sp_barra_funda'
      cep = DADOS_USUARIO['cep_valido']['sp_barra_funda'].sample
    when 'sp_pinheiros'
      cep = DADOS_USUARIO['cep_valido']['sp_pinheiros'].sample
    when 'sp_morumbi'
      cep = DADOS_USUARIO['cep_valido']['sp_morumbi'].sample
    else
      'Estado válido não selecionado'
    end
    cep
  end
end