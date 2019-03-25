# encoding: utf-8
Dado('informo uma senha inválida') do
  @senha = 'd55sa65s'
  @contratojson_login = RequestLogin.request_login(@email, @senha)
end

Dado('não informo o campo senha') do
  @contratojson_login = RequestLogin.request_sem_senha(@email)
end

Dado('que o possuo um cliente logado') do
  @contratojson_login = RequestLogin.request_login(DADOS_USUARIO['email_valido'][AMBIENTE][BANDEIRA], 'Varejo123')
  step 'faço uma requisição POST para o serviço Login'
  step 'não é apresentado erro para a resquisação Login'
  step "o código de resposta deve ser 200"
end

Dado('logo pela api para realizar exclusão no front') do |table|
  @contratojson_login = RequestLogin.request_login(table.rows_hash["email"], table.rows_hash["senha"])
  step 'faço uma requisição POST para o serviço Login'
  step 'não é apresentado erro para a resquisação Login'
  step 'o código de resposta deve ser 200'
end

Dado("que estou logado com usuario {string}, {string}") do |usuario, senha|
  @contratojson_login = RequestLogin.request_login(usuario,  senha)
  step 'faço uma requisição POST para o serviço Login'
  step 'não é apresentado erro para a resquisação Login'
  step 'o código de resposta deve ser 200'
end

Dado('informo a propriedade id_cliente') do
  $id_cliente = @responsebody_login['EfetuarLoginResult']['IdCliente']
end

Quando('faço uma requisição POST para o serviço Login') do
  @responsebody_login = realizar_login.post_login(@contratojson_login)
  $cookie = parse_cookie(@responsebody_login)
  $usuario_guid = @responsebody_login.parsed_response['EfetuarLoginResult']['SessionID']
  $ticket = @responsebody_login.parsed_response['EfetuarLoginResult']['Ticket']
end

E('faço uma requisição POST para o serviço Carrinho') do
  @responsebody_carrinho = carrinho.post_carrinho(@contratojson_login)
end

Quando('faço uma requisição POST sem o campo senha para o serviço Login') do
  @responsebody_login = realizar_login.post_login(@contratojson_login)
end

Quando('faço uma requisição POST para autenticar o usuario o serviço Login') do
  @responsebody_login = realizar_login.post_login(@contratojson_login)
  $cookie = @responsebody_login.headers['set-cookie'].to_s

  expect(@responsebody_login.parsed_response['EfetuarLoginResult']['Erro']).to eql false
  expect(@responsebody_login.parsed_response['EfetuarLoginResult']['Email']).to eql @email
end

Quando('faço uma requisição POST sem cookie para o serviço Login') do
  @responsebody_login = realizar_login.post_login(@contratojson_login)
end

Então('o código de resposta deve ser {int} para o serviço Carrinho') do |status_code|
  expect(@responsebody_login.parsed_response['EfetuarLoginResult']['Erro']).to eql false
  expect(@responsebody_login.parsed_response['EfetuarLoginResult']['Email']).to eql @email
  expect(@responsebody_carrinho.code).to eq status_code
end

Então('o código de resposta deve ser {int}') do |status_code|
  expect(@responsebody_login.code).to eq status_code
end

Então('acesso as informações do carrinho') do
  expect(@responsebody_carrinho.parsed_response['Erro']).to eql false
end

Então('deve ser retornado um JSON contendo a mensagem') do
  expect(@responsebody_login.parsed_response['EfetuarLoginResult']['Erro']).to eql true
  expect(@responsebody_login.parsed_response['EfetuarLoginResult']['Mensagens'][0]).to eql LoginCommons.valida_mensagem

end

Então('não é apresentado erro para a resquisação Login') do
  expect(@responsebody_login.parsed_response['EfetuarLoginResult']['Erro']).to be_falsey, @responsebody_login.parsed_response['EfetuarLoginResult']['Mensagens'].to_s
end

Dado('que estou logado com o usuario parametrizado {string}') do |usuario|
  step "informo o email e senha do usuario '#{usuario}'"
  step 'faço uma requisição POST para o serviço Login'
  step 'não é apresentado erro para a resquisação Login'
  step 'o código de resposta deve ser 200'
  step 'informo a propriedade id_cliente'
end

E('informo o email e senha do usuario {string}') do |usuario|
  @email = DADOS_USUARIO[BANDEIRA][AMBIENTE][usuario]['email']
  @senha = DADOS_USUARIO[BANDEIRA][AMBIENTE][usuario]['senha']
  @contratojson_login = RequestLogin.request_login(@email, @senha)
end
