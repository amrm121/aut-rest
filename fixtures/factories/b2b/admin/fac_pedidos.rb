class PedidoFactories

  PEDIDOS_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2b/admin/pedidos.yml')
  CONFIRMAR_RESERVA = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2b/admin/confirmar_reserva.yml')
  PEDIDOS_MASSA = YAML.load_file("#{PATH_API_REST}features/support/massa/admin/pedidos.yml")

  def self.modelo_de_dados_criar_pedidos
    m_hash = PEDIDOS_REQUEST.dup
    m_hash['Produtos'].first['IdLojista'] = 15
    m_hash['Produtos'].first['Codigo'] = '6942614'
    m_hash['Produtos'].first['Quantidade'] = '1'
    m_hash['Produtos'].first['Premio'] = '0'
    m_hash['Produtos'].first['PrecoVenda'] = '69.00'
    m_hash['Produtos'].last['IdLojista'] = 15
    m_hash['Produtos'].last['Codigo'] = '3653034'
    m_hash['Produtos'].last['Quantidade'] = '1'
    m_hash['Produtos'].last['Premio'] = '0'
    m_hash['Produtos'].last['PrecoVenda'] = '309.90'
    m_hash['EnderecoEntrega']['CEP'] = '09520010'
    m_hash['EnderecoEntrega']['Estado'] = 'SP'
    m_hash['EnderecoEntrega']['Logradouro'] = 'Rua João Pessoa'
    m_hash['EnderecoEntrega']['Cidade'] = 'São Caetano do Sul'
    m_hash['EnderecoEntrega']['Numero'] = '83'
    m_hash['EnderecoEntrega']['Referencia'] = 'teste'
    m_hash['EnderecoEntrega']['Bairro'] = 'Centro'
    m_hash['EnderecoEntrega']['Complemento'] = 'Teste'
    m_hash['EnderecoEntrega']['Telefone'] = '11456845689'
    m_hash['EnderecoEntrega']['Telefone2'] = '1194568-4568'
    m_hash['Campanha'] = '2199'
    m_hash['CNPJ'] = '08.845.775/0001-70'
    m_hash['PedidoParceiro'] = Faker::Number.between(1, 1000000).to_s
    m_hash['ValorFrete'] = '10.32'
    m_hash
  end

  def self.modelo_de_dados_pedido_duplicado
    hash = PEDIDOS_REQUEST.dup
    hash['Produtos'].first['IdLojista'] = 15
    hash['Produtos'].first['Codigo'] = '3653034'
    hash['Produtos'].first['Quantidade'] = '1'
    hash['Produtos'].first['Premio'] = '0'
    hash['Produtos'].first['PrecoVenda'] = '309.90'
    hash['Produtos'].last['IdLojista'] = 15
    hash['Produtos'].last['Codigo'] = '2273247'
    hash['Produtos'].last['Quantidade'] = '1'
    hash['Produtos'].last['Premio'] = '0'
    hash['Produtos'].last['PrecoVenda'] = '169.90'
    hash['EnderecoEntrega']['CEP'] = '09520010'
    hash['EnderecoEntrega']['Estado'] = 'SP'
    hash['EnderecoEntrega']['Logradouro'] = 'Rua João Pessoa'
    hash['EnderecoEntrega']['Cidade'] = 'São Caetano do Sul'
    hash['EnderecoEntrega']['Numero'] = '83'
    hash['EnderecoEntrega']['Referencia'] = 'teste'
    hash['EnderecoEntrega']['Bairro'] = 'Centro'
    hash['EnderecoEntrega']['Complemento'] = 'Teste'
    hash['EnderecoEntrega']['Telefone'] = '11456845689'
    hash['EnderecoEntrega']['Telefone2'] = '1194568-4568'
    hash['Campanha'] = '2199'
    hash['CNPJ'] = '08.845.775/0001-70'
    hash['PedidoParceiro'] = '9731298'
    hash['ValorFrete'] = '26.16'
    hash
  end

  def self.modelo_de_dados_campanha_com_retira
    hash = PEDIDOS_REQUEST.dup
    hash['Produtos'].first['IdLojista'] = 15
    hash['Produtos'].first['Codigo'] = '6942614'
    hash['Produtos'].first['Quantidade'] = '1'
    hash['Produtos'].first['Premio'] = '0'
    hash['Produtos'].first['PrecoVenda'] = '69.00'
    hash['Produtos'].last['IdLojista'] = 15
    hash['Produtos'].last['Codigo'] = '3653034'
    hash['Produtos'].last['Quantidade'] = '1'
    hash['Produtos'].last['Premio'] = '0'
    hash['Produtos'].last['PrecoVenda'] = '309.90'
    hash['EnderecoEntrega']['CEP'] = '06415-130'
    hash['EnderecoEntrega']['Estado'] = 'SP'
    hash['EnderecoEntrega']['Logradouro'] = 'Rua João Pessoa'
    hash['EnderecoEntrega']['Cidade'] = 'São Caetano do Sul'
    hash['EnderecoEntrega']['Numero'] = '83'
    hash['EnderecoEntrega']['Referencia'] = 'teste'
    hash['EnderecoEntrega']['Bairro'] = 'Centro'
    hash['EnderecoEntrega']['Complemento'] = 'Teste'
    hash['EnderecoEntrega']['Telefone'] = '11456845689'
    hash['EnderecoEntrega']['Telefone2'] = '1194568-4568'
    hash['Campanha'] = '2155'
    hash['CNPJ'] = '58.530.966/0001-10'
    hash['PedidoParceiro'] = Faker::Number.between(1, 1000000).to_s
    hash['ValorFrete'] = '10.32'
    hash
  end

  def self.modelo_de_dados_confirmar_pedido_invalido pedido_parceiro
    hash = CONFIRMAR_RESERVA.dup
    hash['IdCampanha'] = PEDIDOS_MASSA[BANDEIRA][AMBIENTE]['confirmar_pedido']['IdCampanha']
    hash['IdPedidoParceiro'] = pedido_parceiro
    hash['Destinatario']['Nome'] = PEDIDOS_MASSA[BANDEIRA][AMBIENTE]['confirmar_pedido']['Nome']
    hash['Destinatario']['CpfCnpj'] = PEDIDOS_MASSA[BANDEIRA][AMBIENTE]['confirmar_pedido']['DestinatarioCpfCnpj']
    hash['Destinatario']['Email'] = PEDIDOS_MASSA[BANDEIRA][AMBIENTE]['confirmar_pedido']['DestinatarioEmail']
    hash
  end

  def self.modelo_de_dados_confirmar_pedido pedido_parceiro
    hash = CONFIRMAR_RESERVA.dup
    hash['IdCampanha'] = PEDIDOS_MASSA[BANDEIRA][AMBIENTE]['confirmar_pedido']['IdCampanha']
    hash['IdPedidoParceiro'] = pedido_parceiro
    hash['Destinatario']['Nome'] = PEDIDOS_MASSA[BANDEIRA][AMBIENTE]['confirmar_pedido']['Nome']
    hash['Destinatario']['CpfCnpj'] = PEDIDOS_MASSA[BANDEIRA][AMBIENTE]['confirmar_pedido']['DestinatarioCpfCnpj']
    hash['Destinatario']['Email'] = PEDIDOS_MASSA[BANDEIRA][AMBIENTE]['confirmar_pedido']['DestinatarioEmail']
    hash
  end
end