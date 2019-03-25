class RequestSelecionarEndereco

  SELECIONAR_ENDERECO_REQUEST = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/selecionar_endereco_entrega.yml")
  ENTREGA_AGENDADA = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/entrega_agendada.yml")
  ENTREGA_NORMAL = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/entrega_normal.yml")
  ENTREGA_RETIRA_CORREIOS = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/entrega_retira_correios.yml")
  ENTREGA_RETIRA_LOJA = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/entrega_retira_loja.yml")
  ENTREGA_RETIRA_LOCKERS = YAML.load_file("#{PATH_API_REST}fixtures/templates/b2c/carrinho/entrega_retira_lockers.yml")

  def self.consulta_selecionar_endereco(id_cliente_endereco)
    var_endereco = SELECIONAR_ENDERECO_REQUEST.dup
    var_endereco['entrega']['IdClienteEnderecoSelecionado'] = id_cliente_endereco
    var_endereco
  end

  def self.entrega_agendada(id_periodo_agenda, data_agendamento, id_endereco)
    json = ENTREGA_AGENDADA.dup
    json['entrega']['Token'] = $usuario_guid
    json['entrega']['IdUnidadeNegocio'] = unidade_negocio
    json['entrega']['IdPeriodoSelecionado'] = id_periodo_agenda
    json['entrega']['DataSelecionada'] = data_agendamento
    json['entrega']['IdClienteEnderecoSelecionado'] = id_endereco
    json
  end

  def self.entrega_normal(id_endereco)
    json = ENTREGA_NORMAL.dup
    json['entrega']['Token'] = $usuario_guid
    json['entrega']['IdUnidadeNegocio'] = unidade_negocio
    json['entrega']['IdClienteEnderecoSelecionado'] = id_endereco
    json
  end

  def self.entrega_retira_correios(id_endereco, array_withdraw_point)
    json = ENTREGA_RETIRA_CORREIOS.dup
    json['Token'] = $usuario_guid
    json['IdUnidadeNegocio'] = array_withdraw_point['IdUnidadeNegocio']
    json['IdLojaFisicaSelecionado'] = array_withdraw_point['IdEnderecoLojaFisica']
    json['filtroLojaBairro'] = array_withdraw_point['Bairro']
    json['filtroLojaCidade'] = array_withdraw_point['Municipio']
    json['entrega']['Token'] = $usuario_guid
    json['entrega']['IdUnidadeNegocio'] = array_withdraw_point['IdUnidadeNegocio']
    json['filtroLojaRegiao'] = array_withdraw_point['Regiao']
    json['filtroLojaEstado'] = array_withdraw_point['UF']
    json['entrega']['IdClienteEnderecoSelecionado'] = id_endereco
    json
  end

  def self.entrega_retira_loja(id_endereco, array_withdraw_point)
    json = ENTREGA_RETIRA_LOJA.dup
    json['Token'] = $usuario_guid
    json['IdUnidadeNegocio'] = array_withdraw_point['IdUnidadeNegocio']
    json['IdLojaFisicaSelecionado'] = array_withdraw_point['IdEnderecoLojaFisica']
    json['filtroLojaBairro'] = array_withdraw_point['Bairro']
    json['filtroLojaCidade'] = array_withdraw_point['Municipio']
    json['entrega']['Token'] = $usuario_guid
    json['entrega']['IdUnidadeNegocio'] = array_withdraw_point['IdUnidadeNegocio']
    json['filtroLojaRegiao'] = array_withdraw_point['Regiao']
    json['filtroLojaEstado'] = array_withdraw_point['UF']
    json['entrega']['IdClienteEnderecoSelecionado'] = id_endereco
    json
  end

  def self.entrega_retira_lockers(id_endereco, array_withdraw_point)
    json = ENTREGA_RETIRA_LOCKERS.dup
    json['Token'] = $usuario_guid
    json['IdUnidadeNegocio'] = array_withdraw_point['IdUnidadeNegocio']
    json['IdLojaFisicaSelecionado'] = array_withdraw_point['IdEnderecoLojaFisica']
    json['filtroLojaBairro'] = array_withdraw_point['Bairro']
    json['filtroLojaCidade'] = array_withdraw_point['Municipio']
    json['entrega']['Token'] = $usuario_guid
    json['entrega']['IdUnidadeNegocio'] = unidade_negocio
    json['filtroLojaRegiao'] = array_withdraw_point['Regiao']
    json['filtroLojaEstado'] = array_withdraw_point['UF']
    json['entrega']['IdClienteEnderecoSelecionado'] = id_endereco
    json
  end
end