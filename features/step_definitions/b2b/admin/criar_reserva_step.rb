#encoding: utf-8
Dado("que eu tenha um payload padrão para criação de pedido") do
  @data = PedidoFactories.modelo_de_dados_criar_pedidos
end

Dado("que eu tenha um payload padrão para criação de pedido com campanha que possui retira rápido") do
  @data = PedidoFactories.modelo_de_dados_campanha_com_retira
end

Dado("que eu tenha um payload padrão para pedido duplicado") do
  @data = PedidoFactories.modelo_de_dados_pedido_duplicado
end

Quando("é enviada uma requisição para Criar reserva") do
  @response_body = pedidos.post_criar_reserva(@data)
end

Então("devo ver a mensagem de criação efetuada com sucesso") do
  expect(@response_body.parsed_response['Valido']).to be true
  expect(@response_body.parsed_response['Mensagens'].empty?).to be true
  expect(@response_body.parsed_response['PedidoReserva']['AguardandoConfirmacao']).to be true
end

Então("devo ver a mensagem informando que não é possível reservar item de retira rápido") do
  expect(@response_body.parsed_response['Valido']).to be false
  expect(@response_body.parsed_response['Mensagens'].first['Codigo']).to eql 'NaoPermiteReservaRetira'
  expect(@response_body.parsed_response['Mensagens'].first['Conteudo']).to eql 'Campanha corrente vinculada a tipo de entrega Retira Rápido.'
end

Então("devo ver a mensagem com código de pedido duplicado") do
  expect(@response_body.parsed_response['Valido']).to be false
  expect(@response_body.parsed_response['Mensagens'].first['Codigo']).to eql 'PedidoDuplicado'
end

Então("devo ver o contrato exibido com sucesso") do
  expect(@response_body.parsed_response['PedidoReserva']['ValorProduto']).to be_a_kind_of(Float)
  expect(@response_body.parsed_response['PedidoReserva']['ValorTotalPedido']).to be_a_kind_of(Float)
  expect(@response_body.parsed_response['PedidoReserva']['CodigoPedido']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['PedidoParceiro']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].first['IdLojista']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].first['Codigo']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].first['Quantidade']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].first['Premio']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].first['PrecoVenda']).to be_a_kind_of(Float)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].last['IdLojista']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].last['Codigo']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].last['Quantidade']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].last['Premio']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['Produtos'].last['PrecoVenda']).to be_a_kind_of(Float)
  expect(@response_body.parsed_response['ParametrosExtras']).to be_a_kind_of(NilClass)
  expect(@response_body.parsed_response['PedidoReserva']['AguardandoConfirmacao']).to be_a_kind_of(TrueClass)
  expect(@response_body.parsed_response['PedidoReserva']['DadosEntrega']['PrevisaoDeEntrega']).to be_a_kind_of(String)
  expect(@response_body.parsed_response['PedidoReserva']['DadosEntrega']['ValorFrete']).to be_a_kind_of(Float)
  expect(@response_body.parsed_response['PedidoReserva']['DadosEntrega']['IdEntregaTipo']).to be_a_kind_of(Integer)
  expect(@response_body.parsed_response['PedidoReserva']['DadosEntrega']['IdEnderecoLojaFisica']).to be_a_kind_of(NilClass)
  expect(@response_body.parsed_response['PedidoReserva']['DadosEntrega']['IdUnidadeNegocio']).to be_a_kind_of(NilClass)
  expect(@response_body.parsed_response['PedidoReserva']['DadosEntrega']['NomeLojaFisica']).to be_a_kind_of(NilClass)
  expect(@response_body.parsed_response['Valido']).to be_a_kind_of(TrueClass)
  expect(@response_body.parsed_response['Protocolo']).to be_a_kind_of(String)
end
