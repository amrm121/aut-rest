class RequestCliente

  CLIENTE_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/cliente/cliente.yml')
  TOKEN_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/cliente/token_renovacao.yml')

  def self.cadastro_cliente
    cliente = CLIENTE_REQUEST.dup
    cliente['clienteDTO']['IdUnidadeNegocio'] = 8
    cliente['clienteDTO']['ReceberAvisoSms'] =  Faker::Boolean.boolean.to_s
    cliente['clienteDTO']['ReceberAvisoEmail'] =  Faker::Boolean.boolean.to_s
    cliente['clienteDTO']['Senha'] = 'Varejo123'
    cliente['clienteDTO']['ConfirmarSenha'] = 'Varejo123'
    cliente['clienteDTO']['Email'] = 'vv_qa_bot_' +  Faker::Number.between(1,1000000).to_s + '@mailinator.com'
    cliente['clienteDTO']['ConfirmarEmail'] = cliente['clienteDTO']['Email']
    cliente['clienteDTO']['TipoFone1'] = 'Residencial'
    cliente['clienteDTO']['TipoFone2'] = 'Celular'
    cliente['clienteDTO']['Sexo'] =  Faker::Gender.binary_type[0]
    cliente['clienteDTO']['DataNascimentoAno'] = '1990'
    cliente['clienteDTO']['DataNascimentoMes'] = '01'
    cliente['clienteDTO']['DataNascimentoDia'] = '01'
    cliente['clienteDTO']['Telefone2PF'] = '111111111'
    cliente['clienteDTO']['Telefone2DDDPF'] = '11'
    cliente['clienteDTO']['Telefone1PF'] = '11111111'
    cliente['clienteDTO']['Telefone1DDDPF'] = '11'
    cliente['clienteDTO']['Cpf'] = Faker::CPF.pretty
    cliente['clienteDTO']['NomeCompleto'] = 'VV Aut Bot ' +  Faker::GameOfThrones.character
    cliente['clienteDTO']['FlagPJ'] = 'false'
    cliente['IdUnidadeNegocio'] = 8
    cliente['clienteDTO']['Desktop'] = Faker::Boolean.boolean.to_s
    cliente
  end

  def self.token_renovacao
    token = TOKEN_REQUEST.dup
    token['GerarSeExpirado'] = true
    token
  end
end
