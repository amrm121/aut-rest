# encoding: utf-8
Quando('faço uma requisição GET para o serviço Endereco') do
  @responsebody_endereco = obter_endereco_cliente.get_endereco
end

Quando('faço uma requisição PUT para o serviço EnderecoMeuPerfil') do |table|
  table.hashes.each do |row|
    @request_adicionar_endereco = RequestEndereco.request_adicionar_endereco(row[:cep])
    @response_endereco_perfil = obter_endereco_cliente.put_endereco_meu_perfil(@responsebody_login, @request_adicionar_endereco)
  end
end

Quando('faço uma requisição GET para o serviço TiposEntrega') do
  @id_cliente_endereco = @responsebody_endereco.parsed_response['Itens'][0]['IdClienteEndereco']
  @responsebody_tipos_entrega = obter_tipos_entrega.get_tipos_entrega(@id_cliente_endereco)
  expect(@responsebody_tipos_entrega.parsed_response['Erro']).to eql false
  expect(@responsebody_tipos_entrega.parsed_response['UsuarioAutenticado']).to eql true
end

Quando('faço uma requisição POST para o serviço CarrinhoEnderecoEntrega') do
  contrato_endereco_entrega = RequestSelecionarEndereco.consulta_selecionar_endereco(@id_cliente_endereco)
  @response_endereco_entrega = selecionar_tipos_entrega.post_selecionar_entrega(contrato_endereco_entrega)
end

Então('o codigo de resposta deve ser {int}') do |status_code|
  expect(@responsebody_endereco.code).to eql status_code
  expect(@responsebody_tipos_entrega.code).to eql status_code
  expect(@response_endereco_entrega.code).to eql status_code
end

Então('novo cliente possui endereço na aplicação EnderecoMeuPerfil') do
  expect(@response_endereco_perfil['Erro']).to be false
end

Então('o usuario deve estar autenticado na aplicação CarrinhoEnderecoEntrega') do
  expect(@responsebody_endereco.parsed_response['UsuarioAutenticado']).to eql true
end

E('informo o endereço de entrega {string}, {string}') do |endereco, tipo_entrega|
  @responsebody_endereco.parsed_response['Itens'].each do |enderecos|
    if enderecos['Nome'] == endereco
      @id_endereco = enderecos['IdClienteEndereco']
      @cep = enderecos['Cep']
      break
    elsif endereco.eql?('random')
      @id_endereco = @responsebody_endereco.parsed_response['Itens'][0]['IdClienteEndereco']
      @cep = enderecos['Cep']
      break
    end
  end
end

E('faço uma requisição GET para o serviço ListarEntregas') do
  @responsebody_tipos_entrega = obter_tipos_entrega.get_tipos_entrega(@id_endereco)
  expect(@responsebody_tipos_entrega.parsed_response['Erro']).to be_falsey, @responsebody_tipos_entrega.parsed_response['Mensagens'].to_s
end

E('informo o tipo de entrega {string}') do |tipo_entrega|
  case tipo_entrega.downcase
  when 'normal'
    step 'seleciono o tipo de entrega normal'
  when 'agendada'
    step 'seleciono o tipo de entrega agendada'
  when 'retira_correios'
    step 'seleciono o tipo de entrega retira correios'
  when 'retira_loja'
    step 'seleciono o tipo de entrega retira loja'
  when 'retira_lockers'
    step 'seleciono o tipo de entrega retira lockers'
  when 'retira'
    step 'seleciono o tipo de entrega retira 2h'
  else
    raise "Não foi encontrado o tipo de entrega com o valor informado #{tipo_entrega}"
  end
end

E('faço uma requisição POST para o serviço alterarEnderecoEntrega') do
  @response_entrega = selecionar_tipos_entrega.post_selecionar_entrega(@contrato_entrega)
  expect(@response_entrega.parsed_response['Erro']).to eql false
end

E('seleciono o tipo de entrega normal') do
  @contrato_entrega = RequestSelecionarEndereco.entrega_normal(@id_endereco)
end

E('seleciono o tipo de entrega agendada') do
#TODO: - melhorar solução para selecionar qualquer periodo de agendamento
  @responsebody_tipos_entrega.parsed_response['Itens'].each do |entrega|
    next unless entrega['NomeEntregaTipo'].casecmp('Agendada').zero?
    @data_agendamento = entrega['PeriodoAgendamento'][0]['Data']
    @id_periodo_agendamento = entrega['PeriodoAgendamento'][0]['IdPeriodo']
    break
  end
  @contrato_entrega = RequestSelecionarEndereco.entrega_agendada(@id_periodo_agendamento, @data_agendamento, @id_endereco)
end

E('seleciono o tipo de entrega retira loja') do
  @data = RequestOutrasLojasRetira.list_shops(@cep, $id_sku)
  @response_lojas_retira = @response_body = lojas_retira.get_outras_lojas_retira(@data)
  array_withdraw_point = RetiraCommons.return_withdraw_point(@response_lojas_retira, 'retira')
  @contrato_entrega = RequestSelecionarEndereco.entrega_retira_loja(@id_endereco, array_withdraw_point)
end

E('seleciono o tipo de entrega retira correios') do
  @data = RequestOutrasLojasRetira.list_shops(@cep, $id_sku)
  @response_lojas_retira = @response_body = lojas_retira.get_outras_lojas_retira(@data)
  array_withdraw_point = RetiraCommons.return_withdraw_point(@response_lojas_retira, 'correio')
  @contrato_entrega = RequestSelecionarEndereco.entrega_retira_correios(@id_endereco, array_withdraw_point)
end

E('seleciono o tipo de entrega retira lockers') do
  @data = RequestOutrasLojasRetira.list_shops(@cep, $id_sku)
  @response_lojas_retira = @response_body = lojas_retira.get_outras_lojas_retira(@data)
  array_withdraw_point = RetiraCommons.return_withdraw_point(@response_lojas_retira, 'lockers')
  @contrato_entrega = RequestSelecionarEndereco.entrega_retira_lockers(@id_endereco, array_withdraw_point)
end

E('seleciono o tipo de entrega retira 2h') do
  @data = RequestOutrasLojasRetira.list_shops(@cep, $id_sku)
  @response_lojas_retira = @response_body = lojas_retira.get_outras_lojas_retira(@data)
  array_withdraw_point = RetiraCommons.return_withdraw_point(@response_lojas_retira, 'retira')
  @contrato_entrega = RequestSelecionarEndereco.entrega_retira_loja(@id_endereco, array_withdraw_point)
end



