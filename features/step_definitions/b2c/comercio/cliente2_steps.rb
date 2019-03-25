# encoding: utf-8
Dado("que o cliente possui informações necessárias para cadastro") do
  @request_cliente2 = RequestCliente.cadastro_cliente
end

Quando("faço uma requisição PUT para o serviço Cliente_2") do
  @responsebody_cliente2 = criar_cliente.put_criar_usuario(@request_cliente2)
  while @responsebody_cliente2['Salvar2Result']['Mensagens'].any?
    p '[Alerta] E-mail já existente, tendando novamente...'
    @request_cliente2 = RequestCliente.cadastro_cliente
    @responsebody_cliente2 = criar_cliente.put_criar_usuario(@request_cliente2)
    break if @responsebody_cliente2['Salvar2Result']['Mensagens'].empty?
  end
  puts 'Email criado: ' + @responsebody_cliente2['Salvar2Result']['Email']
  puts 'Senha padrão: Varejo123'
end

Então("novo cliente é gerado com sucesso na aplicação Cliente_2") do
  expect(@responsebody_cliente2['Salvar2Result']['Erro']).to be false
end

Dado("que realizo login com um cliente novo sem endereço") do
  step 'que o cliente possui informações necessárias para cadastro'
  step 'faço uma requisição PUT para o serviço Cliente_2'
  step 'novo cliente é gerado com sucesso na aplicação Cliente_2'
  @request_login = RequestLogin.request_login(@responsebody_cliente2['Salvar2Result']['Email'], 'Varejo123')
  @responsebody_login = realizar_login.post_login(@request_login)
end

Quando ('faço uma requisição GET para o serviço Autenticado') do
  @response_autenticacao = consultar_cliente.get_autenticar_cliente_logado
end

Entao ('valido que o usuário está autenticado') do
  expect(@response_autenticacao.parsed_response['UsuarioAutenticado']).to eql true
  expect(@response_autenticacao.parsed_response['Erro']).to be_falsey, @response_autenticacao.parsed_response['Mensagens'][0].to_s
end

Quando("faço uma requisição POST para o serviço TokensRenovacoes") do
  @request_token_renovacao = RequestCliente.token_renovacao
  @response_token = consultar_cliente.post_renovacao_token(@request_token_renovacao)
end

Então("valido a renovação do token") do
  @data_atual = Time.now.strftime "%d/%m/%Y %H:%M:%S"
  @data_token = @response_token.parsed_response['DataExpiracao']
  expect(@data_atual.to_datetime).to be < (@data_token.to_datetime)
  puts "Data Atual : #{@data_atual}"
  puts "Data Token : #{@data_token}"
end