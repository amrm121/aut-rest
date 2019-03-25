#language: pt
@b2c
@FullSmoke
@CheckoutSquad
@Omnichannel
@ignoreHP @ignoreAoc
@ignoreDev @ignoreStg @ignorePrd
Funcionalidade: B2C - Consultar Cupom Omnichannel - Logado
  Como uma aplicação de serviço
  Eu quero efetuar validações no serviço de cupons Omnichannel

  @cupom_valido_vigente
  Cenário: Validar consulta cupom válido/ vigente - omni
    Dado que tenha cupom 'válido'
    Quando fizer um POST no serviço consulta_cupom
    Então valido o retorno de um status code 200
    E valido com sucesso os dados do cupom

  @cupom_vencido
  Cenário: Validar consulta cupom vencido - omni
    Dado que tenha cupom 'vencido'
    Quando fizer um POST no serviço consulta_cupom
    Então valido o retorno de um status code 404
    E deve ser exibido a mensagem:
  """
  Cupom de Desconto Inexistente
  """

  @cupom_valido_token_invalido
  Cenário: Validar consulta cupom válido/ vigente e token autorização inválida - omni
    Dado que tenha cupom 'válido'
    Quando fizer um POST no serviço consulta_cupom com token invalido
    Então valido o retorno de um status code 401

  @cupom_campos_obrigatorios
  Esquema do Cenário: Validar campos obrigatórios
    Dado que tenha cupom 'válido'
    E não informo um campo obrigatório <campo>
    Quando fizer um POST no serviço consulta_cupom
    Então valido o retorno de um status code 400
    E deve ser exibido a mensagem:
  """
  <mensagem>
  """
    Exemplos:
      | campo              | mensagem                                         |
      | 'codigoBandeira'   | Parametro código da bandeira é obrigatorio       |
      | 'codigoCanalVenda' | Parametro canal de venda obrigatório             |
      | 'codigoCupom'      | Parametro código do cupom é obrigatório          |
      | 'tipoVenda'        | Tipo de Venda inválido: a informação deve ser VV |

  @cupom_consulta_sem_cpf
  Cenário: Validar consulta sem CPF - omni
    Dado que tenha cupom 'válido'
    Mas o campo CPF está vazio
    Quando fizer um POST no serviço consulta_cupom
    Então valido o retorno de um status code 422
    E deve ser exibido a mensagem:
  """
  Cpf Inválido
  """
