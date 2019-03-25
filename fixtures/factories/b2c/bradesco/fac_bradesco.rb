require 'faker'
require 'cpf_faker'

class BradescoFactories

  BRADESCO_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/bradesco/proposta_bradesco.yml')

  def self.modelo_dados_proposta_cliente_bradesco()
    var_cliente = self.modelo_dados_pessoais_proposta_cliente_bradesco
    var_cliente = self.modelo_dados_profissionais_proposta_cliente_bradesco(var_cliente)
    var_cliente = self.modelo_dados_residenciais_proposta_cliente_bradesco(var_cliente)
    return var_cliente
  end

  def self.modelo_dados_pessoais_proposta_cliente_bradesco()
    name = Faker::Name.name
    email = Faker::Internet.free_email(name)

    var_cliente = BRADESCO_REQUEST.dup
    var_cliente['enviarDadosPessoais'] = 'Continuar'
    var_cliente['DadosPessoais']['Nome'] = name
    var_cliente['DadosPessoais']['DataNascimento'] = '12/12/1990'
    var_cliente['DadosPessoais']['Email'] = email
    var_cliente['DadosPessoais']['EmailConfirmacao'] = email
    var_cliente['DadosPessoais']['TelefoneCelular'] = '(11)94568-4568'
    var_cliente['DadosPessoais']['Cpf'] = Faker::CPF.pretty
    var_cliente['DadosPessoais']['Rg'] = Faker::CPF.numeric
    var_cliente['DadosPessoais']['IdSexo'] = ['1', '2', '9'].sample
    var_cliente['DadosPessoais']['IdEstadoCivil'] = ['1', '2', '3', '4', '5', '6'].sample
    var_cliente['DadosPessoais']['IdNacionalidade'] = ['1', '2', '9'].sample
    var_cliente['DadosPessoais']['NomeMae'] = Faker::Name.name
    var_cliente['DadosPessoais']['IdDependentes'] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10'].sample
    var_cliente['DadosPessoais']['TelefoneResidencial'] = '(11)4568-4568'
    var_cliente['DadosPessoais']['FlagAceitaMsgSMS'] = [true, false].sample
    var_cliente['DadosPessoais']['FlagAceitaMsgEmail'] = [true, false].sample
    return var_cliente
  end

  def self.modelo_dados_profissionais_proposta_cliente_bradesco(var_cliente)
    var_cliente['enviarDadosProfissionais'] = 'Continuar'
    var_cliente['DadosProfissionais']['NomeEmpresa'] = Faker::Name.name
    var_cliente['DadosProfissionais']['Ocupacao'] = ['Analista', 'Do Lar', 'Empresario', 'Desenvolvedor', 'Administrador', 'Vendedor', 'Motorista'].sample
    var_cliente['DadosProfissionais']['IdNaturezaOcupacao'] = ['1', '2', '3', '4', '5', '6', '7', '8', '9'].sample
    var_cliente['DadosProfissionais']['TempoAno'] = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10'].sample
    var_cliente['DadosProfissionais']['TempoMes'] = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10'].sample
    var_cliente['DadosProfissionais']['RendaMensal'] = ['5000','1000','10000','15000'].sample
    return var_cliente
  end

  def self.modelo_dados_residenciais_proposta_cliente_bradesco(var_cliente)
    var_cliente['enviarDadosResidenciais'] = 'Continuar'
    var_cliente['DadosResidenciais']['IdTipoResidencia'] = ['1', '2', '3', '4', '5', '6'].sample
    var_cliente['DadosResidenciais']['Anos'] = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10'].sample
    var_cliente['DadosResidenciais']['Meses'] = ['00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '10'].sample
    var_cliente['DadosResidenciais']['Cep'] = '09520-010'
    var_cliente['DadosResidenciais']['Endereco'] = 'R Joao Pessoa'
    var_cliente['DadosResidenciais']['Numero'] = '100'
    var_cliente['DadosResidenciais']['Complemento'] = 'Bloco b'
    var_cliente['DadosResidenciais']['Bairro'] = 'Centro'
    var_cliente['DadosResidenciais']['Cidade'] = 'São Caetano do Sul'
    var_cliente['DadosResidenciais']['Uf'] = 'SP'
    return var_cliente
  end

  def self.modelo_dados_cartao_proposta_cliente_bradesco(var_cliente)
    var_cliente['enviarDadosCartao'] = 'Enviar Solicitação'
    var_cliente['DadosCartao']['NomeImpressoCartao'] = name
    var_cliente['DadosCartao']['IdDiaVencimento'] = ['01', '02', '03', '05', '06', '08', '10', '12', '13', '15', '16','18','20','23','24','25'].sample
    var_cliente['DadosCartao']['FlagAutorizaServicoAvaliacaoEmergencialCredito'] = true
    var_cliente['DadosCartao']['FlagCartaoAdicional'] = false
    var_cliente['DadosCartao']['FlagAceiraMsgSMS'] = [true, false].sample
    var_cliente['DadosCartao']['FlagAceitaMsgEmail'] = [true, false].sample
    var_cliente['DadosCartao']['FlagAceitaTermo'] = true
    return var_cliente
  end

  def self.modelo_dados_proposta_cliente_adicional_bradesco(proposta_cliente)
    var_cliente = proposta_cliente
    var_cliente['enviarDadosCartao'] = 'Enviar Solicitação'
    var_cliente['DadosCartao']['FlagCartaoAdicional'] = true
    var_cliente['DadosCartao']['Adicional']['NomeImpressoCartao'] = "#{Faker::Name.first_name} #{Faker::Name.first_name}" 
    var_cliente['DadosCartao']['Adicional']['Cpf'] = Faker::CPF.pretty
    var_cliente['DadosCartao']['Adicional']['DataNascimento'] = '12/12/1990'
    var_cliente['DadosCartao']['Adicional']['IdSexo'] = ['1', '2'].sample
    var_cliente['DadosCartao']['Adicional']['IdParentesco'] = ['1', '2', '3', '4'].sample
    return var_cliente
  end

  def self.modelo_dados_pessoais_proposta_bradesco_invalido(valor, campo)
    var_cliente = self.modelo_dados_pessoais_proposta_cliente_bradesco()
    var_cliente['DadosPessoais']["#{campo}"] = valor
    return var_cliente
  end

  def self.modelo_dados_pessoais_sem_campo(campo)
    hash = self.modelo_dados_pessoais_proposta_cliente_bradesco()
    hash['DadosPessoais']["#{campo}"] 
    hash = json_delete_field("DadosPessoais.#{campo}", hash)
    return hash
  end

  def self.modelo_dados_profissionais_proposta_bradesco_invalido(valor, campo)
    var_cliente = BRADESCO_REQUEST.dup
    var_cliente = self.modelo_dados_profissionais_proposta_cliente_bradesco(var_cliente)
    var_cliente['enviarDadosProfissionais'] = 'Continuar'
    var_cliente['DadosProfissionais']["#{campo}"] = valor
    return var_cliente
  end

  def self.modelo_dados_profissionais_sem_campo(campo)
    hash = BRADESCO_REQUEST.dup
    hash = self.modelo_dados_profissionais_proposta_cliente_bradesco(hash)
    hash['enviarDadosProfissionais'] = 'Continuar'
    hash['DadosProfissionais']["#{campo}"]
    hash = json_delete_field("DadosProfissionais.#{campo}", hash)
    return hash
  end

  def self.modelo_dados_residenciais_proposta_bradesco_invalido(valor, campo)
    var_cliente = BRADESCO_REQUEST.dup
    var_cliente = self.modelo_dados_residenciais_proposta_cliente_bradesco(var_cliente)
    var_cliente['enviarDadosResidenciais'] = 'Continuar'
    var_cliente['DadosResidenciais']["#{campo}"] = valor
    return var_cliente
  end

  def self.modelo_dados_residenciais_sem_campo(campo)
    hash = BRADESCO_REQUEST.dup
    hash = self.modelo_dados_residenciais_proposta_cliente_bradesco(hash)
    hash['enviarDadosResidenciais'] = 'Continuar'
    hash['DadosResidenciais']["#{campo}"]
    hash = json_delete_field("DadosResidenciais.#{campo}", hash)
    return hash
  end

  def self.modelo_dados_cartao_proposta_bradesco_invalido(valor, campo)
    var_cliente = BRADESCO_REQUEST.dup
    var_cliente = self.modelo_dados_cartao_proposta_cliente_bradesco(var_cliente)
    var_cliente['enviarDadosCartao'] = 'Enviar Solicitação'
    var_cliente['DadosCartao']["#{campo}"] = valor
    return var_cliente
  end

  def self.modelo_dados_cartao_sem_campo(campo)
    hash = BRADESCO_REQUEST.dup
    hash = self.modelo_dados_cartao_proposta_cliente_bradesco(hash)
    hash['enviarDadosCartao'] = 'Enviar Solicitação'
    hash['DadosCartao']["#{campo}"]
    hash = json_delete_field("DadosCartao.#{campo}", hash)
    return hash
  end

  def self.modelo_dados_cartao_adicional_proposta_bradesco_invalido(valor, campo)
    var_cliente = BRADESCO_REQUEST.dup
    var_cliente = self.modelo_dados_proposta_cliente_adicional_bradesco(var_cliente)
    var_cliente['enviarDadosCartao'] = 'Enviar Solicitação'
    var_cliente['DadosCartao']['Adicional']["#{campo}"] = valor
    var_cliente['DadosPessoais']["#{campo}"] = valor if campo == 'Cpf'
    return var_cliente
  end

end