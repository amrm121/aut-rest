#language:pt
@b2c
@FullSmoke
@ShortSmoke
@CheckoutSquad
@ComercioCliente
@ignoreHp @ignoreAoc
@ignoreDev
Funcionalidade: B2C - Validar serviço Cliente
  Eu como automação
  Quero criar novos usuários via serviço (API)
  Para garantir a capacidade de gerar clientes novos através da aplicação

  @criar_cliente_pf
  Cenário: Criar usuário PF
    Dado que o cliente possui informações necessárias para cadastro
    Quando faço uma requisição PUT para o serviço Cliente_2
    Então novo cliente é gerado com sucesso na aplicação Cliente_2

  @criar_endereco_cliente_pf
  Cenário: Criar endereço para novo usuário
    Dado que realizo login com um cliente novo sem endereço
    Quando faço uma requisição PUT para o serviço EnderecoMeuPerfil
      | cep |
      | sp  |
      | rj  |
      | sp  |
    Então novo cliente possui endereço na aplicação EnderecoMeuPerfil

  @Autenticação @QAUTO-2700
  Cenário: Autenticar usuário
    Dado que estou logado com o usuario parametrizado "black_list"
    Quando faço uma requisição GET para o serviço Autenticado
    Então valido que o usuário está autenticado

  @QAUTO-2704
  Cenário: Tokens renovações
    Dado que estou logado com o usuario parametrizado "black_list"
    Quando faço uma requisição POST para o serviço TokensRenovacoes
    Então valido a renovação do token