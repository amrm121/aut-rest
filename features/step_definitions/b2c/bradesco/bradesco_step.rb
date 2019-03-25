Dado("que tenha preenchido o formulário com dados válidos") do
  @contrato_json_bradesco = BradescoFactories.modelo_dados_proposta_cliente_bradesco()
end

Dado("que tenha preenchido o formulário  de {string} com {string} inválido no {string}") do |formulario, valor, campo|
  @contrato_json_bradesco = BradescoFactories.modelo_dados_pessoais_proposta_bradesco_invalido(valor,campo) if formulario == 'Dados Pessoais'
  @contrato_json_bradesco = BradescoFactories.modelo_dados_profissionais_proposta_bradesco_invalido(valor,campo) if formulario == 'Dados Profissionais'
  @contrato_json_bradesco = BradescoFactories.modelo_dados_residenciais_proposta_bradesco_invalido(valor,campo) if formulario == 'Dados Residenciais'
  @contrato_json_bradesco = BradescoFactories.modelo_dados_cartao_proposta_bradesco_invalido(valor,campo) if formulario == 'Dados Cartão'
  @contrato_json_bradesco = BradescoFactories.modelo_dados_cartao_adicional_proposta_bradesco_invalido(valor,campo) if formulario == 'Cartão Adicional'
end

Dado("escolho um cartao adicional") do
  @contrato_json_cartao_adicional_bradesco = BradescoFactories.modelo_dados_proposta_cliente_adicional_bradesco(@contrato_json_bradesco)
end

Dado("não passo o {string} no formulário de {string}") do |campo, formulario|
  @contrato_json_bradesco = BradescoFactories.modelo_dados_pessoais_sem_campo(campo) if formulario == 'Dados Pessoais'
  @contrato_json_bradesco = BradescoFactories.modelo_dados_profissionais_sem_campo(campo) if formulario == 'Dados Profissionais'
  @contrato_json_bradesco = BradescoFactories.modelo_dados_residenciais_sem_campo(campo) if formulario == 'Dados Residenciais'
  @contrato_json_bradesco = BradescoFactories.modelo_dados_cartao_sem_campo(campo) if formulario == 'Dados Cartão'
  @contrato_json_bradesco = BradescoFactories.modelo_dados_cartao_adicional_sem_campo(campo) if formulario == 'Cartão Adicional'
end

Quando("é enviada uma requisição para o serviço de primeira compra Bradesco") do
  @responsebody_bradesco = enviar_proposta_bradesco.post_primeira_compra(@contrato_json_bradesco)
end

Então("o código de resposta deve ser {int} no serviço bradesco primeira compra") do |status_code|
  expect(@responsebody_bradesco.code).to eq status_code
end

Então("recebo uma mensagem de erro {string} no corpo da resposta") do |erro_false|
  expect(@responsebody_bradesco.parsed_response['Erro']).to eql false
end
                                                                                                                        
Então("recebo uma {string} no corpo da resposta") do |message|                                                           
  expect(@responsebody_bradesco.parsed_response['Erro']).to eql true
  expect(@responsebody_bradesco.parsed_response['Mensagens'].first).to eql message
end                                                                                                                     