Dado("que eu tenha um pedido com status a confirmar reserva") do
  step 'que eu tenha um payload padrão para criação de pedido'
  step 'é enviada uma requisição para Criar reserva'
  @cod_pedido = @response_body.parsed_response['PedidoReserva']['CodigoPedido']
  @id_pedido_parceiro = @response_body.parsed_response['PedidoReserva']['PedidoParceiro']
  @data = PedidoFactories.modelo_de_dados_confirmar_pedido(@id_pedido_parceiro)
end

Dado("que eu tenha um pedido com status a confirmar reserva falso") do
  step 'que eu tenha um payload padrão para criação de pedido'
  step 'é enviada uma requisição para Criar reserva'
  @cod_pedido = @response_body.parsed_response['PedidoReserva']['CodigoPedido']
  @id_pedido_parceiro = @response_body.parsed_response['PedidoReserva']['PedidoParceiro']
  @data = PedidoFactories.modelo_de_dados_confirmar_pedido_invalido(@id_pedido_parceiro)
end

Quando("solicitar a confirmação na API confirmar_reserva") do |table|
  table.hashes.each do |row|
    @response_body = pedidos.put_confirmar_reserva(@data, row, @cod_pedido)
  end
end

Então("devo ver a mensagem informando que pedido não está com status válido para confirmação") do
  expect(@response_body.parsed_response['Valido']).to be false
  expect(@response_body.parsed_response['Mensagens'].first['Codigo']).to eql 'PedidoComStatusInvalido'
  expect(@response_body.parsed_response['Mensagens'].first['Conteudo']).to eql 'Pedido não está com status válido para confirmação.'
end

Então("devo ver o status com retorno false para confirmação de reserva") do
  expect(@response_body.parsed_response['Pedido']['PedidoConfirmado']).to be false
  expect(@response_body.parsed_response['Valido']).to be true
end

Então("devo ver a mensagem de confirmação de reserva") do
  expect(@response_body.parsed_response['Pedido']['PedidoConfirmado']).to be true
  expect(@response_body.parsed_response['Valido']).to be true
end
