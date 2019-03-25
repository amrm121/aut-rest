#language:pt
@b2c
@FullSmoke
@CheckoutSquad
@BradescoEnviarProposta
@ignoreExtra @ignorePontoFrio @ignoreBarateiro @ignoreHP @ignoreAoc
@ignoreDev @ignoreStg @ignorePrd
Funcionalidade: B2C - Enviar proposta para o Bradesco
  Como cliente das Casas Bahia
  QUERO que minha solicitação de cartão de crédito seja analisada pelo banco
  PARA que este possa aprovar ou não meu cartão de crédito

  @bradesco_validar_envio_proposta
  Cenário: Validar envio da proposta para o Bradesco
    Dado que tenha preenchido o formulário com dados válidos
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma mensagem de erro 'false' no corpo da resposta

  @bradesco_validar_envio_proposta_cartao_adicional
  Cenário: Validar envio da proposta para o Bradesco com cartão adicional
    Dado que tenha preenchido o formulário com dados válidos
    E escolho um cartao adicional
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma mensagem de erro 'false' no corpo da resposta

  @bradesco_validar_envio_proposta_dados_incorretos_pessoais
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados incorretos - Dados Pessoais
    Dado que tenha preenchido o formulário  de 'Dados Pessoais' com <valor> inválido no <campo>
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo                 | valor                                                    | mensagem                                                         |
      | 'Nome'                | 'Campo Nome Deve Permitir Apenas Cinquenta Caracteress'  | 'O tamanho do nome não pode conter mais de 50 caracteres'        |
      | 'Nome'                | 'João'                                                   | 'Digite o nome completo'                                         |
      | 'Cpf'                 | '123.456.789-10'                                         | 'CPF inválido.'                                                  |
      | 'Rg'                  | '12.345.678-9'                                           | 'Preencha o RG no formato correto'                               |
      | 'IdSexo'              | 'F'                                                      | 'O campo Sexo foi preenchido com valor incorreto'                |
      | 'IdNacionalidade'     | 'B'                                                      | 'O campo Nacionalidade foi preenchido com valor incorreto'       |
      | 'IdEstadoCivil'       | 'C'                                                      | 'O campo Estado Civil foi preenchido com valor incorreto'        |
      | 'DataNascimento'      | '32/32/9990'                                             | 'Data de Nascimento no formato errado.'                          |
      | 'DataNascimento'      | '12121990'                                               | 'Data de Nascimento no formato errado.'                          |
      | 'NomeMae'             | 'Campo Nome Deve Permitir Apenas Cinquenta Caracteres'   | 'O tamanho do nome da mãe não pode conter mais de 50 caracteres' |
      | 'NomeMae'             | 'Maria'                                                  | 'Digite o nome completo'                                         |
      | 'IdDependentes'       | '99'                                                     | 'O campo Dependentes foi preenchido com valor incorreto'         |
      | 'Email'               | 'email_teste_automacao_checkout@viavarejo-terceiros.com' | 'O E-mail não pode conter mais de 40 caracteres'                 |
      | 'Email'               | 'email_mascara2viavarejo-terceiros.com'                  | 'Preencha o email no formato correto'                            |
      | 'TelefoneResidencial' | '(11)47878-4545'                                         | 'Preencha o telefone residencial no formato correto'             |
      | 'TelefoneCelular'     | '(11)77878-4545'                                         | 'Preencha o celular no formato correto'                          |

  @bradesco_validar_envio_proposta_dados_obrigatorios
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados obrigatórios - Dados Pessoais
    Dado não passo o <campo> no formulário de 'Dados Pessoais'
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo             | mensagem                                         |
      | 'Nome'            | 'O nome deve ser preenchido'                     |
      | 'Cpf'             | 'O CPF deve ser preenchido'                      |
      | 'Rg'              | 'O RG deve ser preenchido'                       |
      | 'IdSexo'          | 'O campo sexo deve ser selecionado'              |
      | 'IdNacionalidade' | 'A nacionalidade deve ser selecionada'           |
      | 'IdEstadoCivil'   | 'O estado civil deve ser selecionado'            |
      | 'DataNascimento'  | 'O campo Data de Nascimento deve ser preenchido' |
      | 'NomeMae'         | 'O nome da mãe deve ser preenchido'              |
      | 'IdDependentes'   | 'O campo Dependentes deve ser preenchido'        |
      | 'Email'           | 'O email deve ser preenchido'                    |
      | 'TelefoneCelular' | 'O telefone celular deve ser preenchido'         |

  @bradesco_validar_envio_proposta_dados_incorretos_profissionais
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados incorretos - Dados Profissionais
    Dado que tenha preenchido o formulário  de 'Dados Profissionais' com <valor> inválido no <campo>
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo                | valor                                      | mensagem                                                               |
      | 'NomeEmpresa'        | 'Nome da Empresa Limite trinta caracteres' | 'O tamanho do nome da empresa não pode conter mais de 30 caracteres'   |
      | 'Ocupacao'           | 'campoOcupacaoDeveTer21campos'             | 'O tamanho do campo ocupação não pode conter mais de 21 caracteres'    |
      | 'IdNaturezaOcupacao' | 'F'                                        | 'O campo Natureza da ocupação foi preenchido com valor incorreto'      |
      | 'TempoAno'           | '999'                                      | 'Anos são restritos de 0 a 99'                                         |
      | 'TempoMes'           | '12'                                       | 'Meses são restritos de 0 a 11'                                        |
      | 'RendaMensal'        | '99999999999'                              | 'O tamanho do campo renda mensal não pode conter mais de 9 caracteres' |
      | 'TelefoneComercial'  | '11478784545'                              | 'Preencha o telefone comercial no formato correto'                     |

  @bradesco_validar_envio_proposta_dados_obrigatorios_profissionais
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados obrigatórios - Dados Profissionais
    Dado não passo o <campo> no formulário de 'Dados Profissionais'
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo                | mensagem                                                          |
      | 'NomeEmpresa'        | 'Nome da empresa é obrigatório'                                   |
      | 'Ocupacao'           | 'Ocupação é obrigatória'                                          |
      | 'IdNaturezaOcupacao' | 'O campo Natureza da ocupação foi preenchido com valor incorreto' |
      | 'RendaMensal'        | 'Renda mensal é obrigatória'                                      |

  @bradesco_validar_envio_proposta_dados_incorretos_residenciais
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados incorretos - Dados Residenciais
    Dado que tenha preenchido o formulário  de 'Dados Residenciais' com <valor> inválido no <campo>
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo              | valor                                                                                                                                                                                    | mensagem                                                        |
      | 'IdTipoResidencia' | '11'                                                                                                                                                                                     | 'O campo Tipo da Residência foi preenchido com valor incorreto' |
      | 'IdTipoResidencia' | 'ff'                                                                                                                                                                                     | 'O campo Tipo da Residência foi preenchido com valor incorreto' |
      | 'Anos'             | '999'                                                                                                                                                                                    | 'Anos são restritos de 0 a 99'                                  |
      | 'Meses'            | '12'                                                                                                                                                                                     | 'Meses são restritos de 0 a 11'                                 |
      | 'Cep'              | '095200201'                                                                                                                                                                              | 'Preencha o cep no formato correto'                             |
      | 'Cep'              | 'ff'                                                                                                                                                                                     | 'Preencha o cep no formato correto'                             |
      | 'Endereco'         | 'Campo endereco aceita no maximo cento e cinquenta caracteres Campo endereco aceita no maximo cento e cinquenta caracteres Campo endereco aceita no maximo cento e cinquenta caracteres' | 'O endereco deve conter até 150 caracteres'                     |
      | 'Numero'           | '123456'                                                                                                                                                                                 | 'O numero deve ter até 5 caracteres'                            |
      | 'Complemento'      | 'Campo aceita ate 15'                                                                                                                                                                    | 'O complemento deve conter até 15 caracteres'                   |
      | 'Bairro'           | 'Campo cidade aceita no maximo cem caracteres Campo bairro aceita no maximo cem caracteres Campo bairro aceita'                                                                          | 'O bairro deve conter até 100 caracteres'                       |
      | 'Cidade'           | 'Campo cidade aceita no maximo cem caracteres Campo bairro aceita no maximo cem caracteres Campo bairro aceita'                                                                          | 'A cidade deve conter até 100 caracteres'                       |
      | 'Uf'               | 'scs'                                                                                                                                                                                    | 'A UF deve conter até 2 caracteres'                             |
      | 'Uf'               | '99'                                                                                                                                                                                     | 'A UF informada é inválida.'                                    |

  @bradesco_validar_envio_proposta_dados_obrigatorios_residenciais
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados obrigatórios - Dados Residenciais
    Dado não passo o <campo> no formulário de 'Dados Residenciais'
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo              | mensagem                                                        |
      | 'IdTipoResidencia' | 'O campo Tipo da Residência foi preenchido com valor incorreto' |
      | 'Anos'             | 'Anos é obrigatório'                                            |
      | 'Meses'            | 'Meses é obrigatório'                                           |
      | 'Cep'              | 'CEP é obrigatório'                                             |
      | 'Endereco'         | 'Endereco é obrigatório'                                        |
      | 'Numero'           | 'Número é obrigatório'                                          |
      | 'Bairro'           | 'Bairro é obrigatório'                                          |
      | 'Cidade'           | 'Cidade é obrigatório'                                          |
      | 'Uf'               | 'UF é obrigatório'                                              |

  @bradesco_validar_envio_proposta_dados_incorretos_cartao
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados incorretos - Dados Cartão
    Dado que tenha preenchido o formulário  de 'Dados Cartão' com <valor> inválido no <campo>
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo                | valor                           | mensagem                                                                     |
      | 'NomeImpressoCartao' | 'Nome Impresso com 19 caracter' | 'O tamanho do nome impresso no cartão não pode conter mais de 19 caracteres' |
      | 'IdDiaVencimento'    | '30'                            | 'O campo Vencimento da fatura foi preenchido com valor incorreto'            |
      | 'IdDiaVencimento'    | 'ff'                            | 'O campo Vencimento da fatura foi preenchido com valor incorreto'            |
      | 'FlagAceiteTermo'    | '12'                            | 'Necessário aceitar o termo de uso'                                          |

  @bradesco_validar_envio_proposta_dados_obrigatorios_cartao
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados obrigatórios - Dados Cartão
    Dado não passo o <campo> no formulário de 'Dados Cartão'
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo                | mensagem                                                          |
      | 'NomeImpressoCartao' | 'Nome impresso no cartão é obrigatório'                           |
      | 'IdDiaVencimento'    | 'O campo Vencimento da fatura foi preenchido com valor incorreto' |
      | 'FlagAceiteTermo'    | 'Necessário aceitar o termo de uso'                               |

  @bradesco_validar_envio_proposta_dados_incorretos_cartao_adicional
  Esquema do Cenário: Validar envio da proposta para o Bradesco com dados incorretos - Cartão Adicional
    Dado que tenha preenchido o formulário  de 'Cartão Adicional' com <valor> inválido no <campo>
    Quando é enviada uma requisição para o serviço de primeira compra Bradesco
    Então o código de resposta deve ser 200 no serviço bradesco primeira compra
    E recebo uma <mensagem> no corpo da resposta

    Exemplos:
      | campo                | valor                           | mensagem                                                                     |
      | 'NomeImpressoCartao' | 'Nome Impresso com 19 caracter' | 'O tamanho do nome impresso no cartão não pode conter mais de 19 caracteres' |
      | 'Cpf'                | '95010935066'                   | 'Preencha o CPF no formato correto'                                          |
      | 'Cpf'                | 'teste'                         | 'Preencha o CPF no formato correto'                                          |
      | 'Cpf'                | '671.377.660-48'                | 'O CPF principal precisa ser diferente do CPF do cartão adicional'           |
      | 'DataNascimento'     | '12121990'                      | 'Data de Nascimento no formato errado.'                                      |
      | 'DataNascimento'     | 'teste'                         | 'Data de Nascimento no formato errado.'                                      |
      | 'IdSexo'             | '0'                             | 'O campo Sexo foi preenchido com valor incorreto'                            |
      | 'IdSexo'             | 'F'                             | 'O campo Sexo foi preenchido com valor incorreto'                            |
      | 'IdParentesco'       | '5'                             | 'O campo Grau de parentesco foi preenchido com valor incorreto'              |
      | 'IdParentesco'       | 'abc'                           | 'O campo Grau de parentesco foi preenchido com valor incorreto'              |
