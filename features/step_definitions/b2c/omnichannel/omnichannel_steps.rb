#encoding: utf-8
OMNI = YAML.load_file("#{PATH_API_REST}features/support/massa/omni/cupom_omni.yml")


Dado("que tenha cupom {string}") do |tipo_cupom|
  case tipo_cupom
  when 'válido'
    @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['ativo']
    @cpf = OMNI[BANDEIRA][AMBIENTE]['cpf']['valido']
    @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['cb']
    @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['loja_fisica']
    @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
    @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['vv']
  when 'vencido'
    @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['vencido']
    @cpf = OMNI[BANDEIRA][AMBIENTE]['cpf']['valido']
    @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['cb']
    @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['site']
    @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
    @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['vv']
  when 'consumido'
    @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['consumido']
    @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['cb']
    @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['site']
    @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
    @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['vv']
  when 'válido_deslogado'
    @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['deslogado']
    @cpf = OMNI[BANDEIRA][AMBIENTE]['cpf']['valido']
    @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['cb']
    @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['site']
    @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
    @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['vv']
  else
    puts 'Validar implementação'
  end
end

Dado("não informo um campo obrigatório {string}") do |campo_obg|
  case campo_obg
  when 'codigoBandeira'
    @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['ativo']
    @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['vazio']
    @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['site']
    @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
    @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['vv']
    @cpf = OMNI[BANDEIRA][AMBIENTE]['cpf']['valido']
  when 'codigoCanalVenda'
    @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['ativo']
    @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['cb']
    @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['vazio']
    @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
    @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['vv']
    @cpf = OMNI[BANDEIRA][AMBIENTE]['cpf']['valido']
  when 'codigoCupom'
    @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['vazio']
    @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['cb']
    @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['site']
    @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
    @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['vv']
    @cpf = OMNI[BANDEIRA][AMBIENTE]['cpf']['valido']
  when 'tipoVenda'
    @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['ativo']
    @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['cb']
    @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['site']
    @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
    @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['err']
    @cpf = OMNI[BANDEIRA][AMBIENTE]['cpf']['valido']
  else
    puts 'Validar implementação'
  end

end

Dado("o campo CPF está vazio") do
  @cupom = OMNI[BANDEIRA][AMBIENTE]['cupom_ominichannel']['ativo']
  @bandeira = OMNI[BANDEIRA][AMBIENTE]['bandeira']['cb']
  @canal_venda = OMNI[BANDEIRA][AMBIENTE]['canal_venda']['site']
  @lista_sku = OMNI[BANDEIRA][AMBIENTE]['lista_sku']['codigo_sku_elegivel']
  @tipo_venda = OMNI[BANDEIRA][AMBIENTE]['tipoVenda']['vv']
  @cpf = OMNI[BANDEIRA][AMBIENTE]['cpf']['vazio']
end

Quando("fizer um POST no serviço consulta_cupom") do
  @contrato_json_omni = OmnichannelFactories.modelo_consulta(@cupom, @bandeira, @canal_venda, @lista_sku, @tipo_venda, @cpf)
  @responsebody_omni = consulta_omnichannel.post_consulta(@contrato_json_omni)
end

Quando("fizer um POST no serviço consulta_cupom com token invalido") do

  @contrato_json_omni = OmnichannelFactories.modelo_consulta(@cupom, @bandeira, @canal_venda, @lista_sku, @tipo_venda, @cpf)
  @responsebody_omni = consulta_omnichannel.post_consulta_token_invalido(@contrato_json_omni)
end

Então("valido o retorno de um status code {int}") do |status|
  expect(@responsebody_omni.code).to eq status
end

E("valido com sucesso os dados do cupom") do
  expect(@responsebody_omni.parsed_response['codigoCupom']).not_to be_empty
  expect(@responsebody_omni.parsed_response['cpf']).not_to be_empty
  expect(@responsebody_omni.parsed_response['dataInicioDeVigencia']).not_to be_empty
  expect(@responsebody_omni.parsed_response['dataFimDeVigencia']).not_to be_empty
  expect(@responsebody_omni.parsed_response['listaSku'][0]['tipoSku']).to eql 'C'
end

Então("deve ser exibido a mensagem:") do |mensagem|
  expect(@responsebody_omni.parsed_response['descricao']).to eql mensagem
end

Então("valido com sucesso os dados do cupom para cliente deslogado") do
  expect(@responsebody_omni.parsed_response['codigoCupom']).not_to be_empty
  expect(@responsebody_omni.parsed_response['listaSku']).to be_empty
  expect(@responsebody_omni.parsed_response['cpf']).to be_empty
  expect(@responsebody_omni.parsed_response['dataInicioDeVigencia']).not_to be_empty
  expect(@responsebody_omni.parsed_response['dataFimDeVigencia']).not_to be_empty
  expect(@responsebody_omni.parsed_response['codigoCupom']).not_to be_empty
end