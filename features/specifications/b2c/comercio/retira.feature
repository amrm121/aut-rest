#language:pt
@b2c
@FullSmoke
@ShortSmoke
@MulticanalidadeSquad
@retira
@ignoreBarateiro @ignoreHP @ignoreAoc
@ignoreDev @ignoreStg
Funcionalidade: B2C - Validar listagem de fretes
  Eu como automação
  Quero enviar requisições para a API AsyncOutrasLojasRetira
  para validar disponibilidade e informações retornadas da mesma

  @FRTMC-1969
  Cenário: Validar retorno dos 3 primeiros pontos de retirada
    Dado que eu tenha informado o cep e sku desejado
      | cep         | sku    |
      | barra_funda | retira |
    Quando é enviada uma requisição GET para o serviço AsyncOutrasLojasRetira
    Então o código de resposta deve ser 200 para o serviço AsyncOutrasLojasRetira
    E as 3 primeiras lojas retornadas devem ser do tipo retira

  @FRTMC-1969
  Cenário: Validar mensagem de retorno ao realizar consulta com cep inválido
    Dado que eu tenha informado o cep e sku desejado
      | cep          | sku    |
      | cep_invalido | retira |
    Quando é enviada uma requisição GET para o serviço AsyncOutrasLojasRetira
    Então o código de resposta deve ser 200 para o serviço AsyncOutrasLojasRetira
    E é retornada uma mensagem solicitando para informar um cep válido

  @FRTMC-1969
  Cenário: Validar mensagem de retorno ao realizar consulta com cep que não contém o produto
    Dado que eu tenha informado o cep e sku desejado
      | cep    | sku     |
      | manaus | retira2 |
    Quando é enviada uma requisição GET para o serviço AsyncOutrasLojasRetira
    Então o código de resposta deve ser 200 para o serviço AsyncOutrasLojasRetira
    E é retornada uma mensagem informando que não foi encontrado nenhum ponto de retirada

  @FRTMC-1986 @habilitarRetiraCorreios_on @ignorePontoFrio @ignoreExtra
  Cenário: Validar o retorno de pontos de retirada correio com a chave habilitarRetiraCorreios habilitada
    Dado que eu tenha informado o cep e sku desejado
      | cep         | sku    |
      | barra_funda | retira |
    Quando é enviada uma requisição GET para o serviço AsyncOutrasLojasRetira
    Então o código de resposta deve ser 200 para o serviço AsyncOutrasLojasRetira
    E é retornado ponto de retirada do tipo 'correio'

  @FRTMC-1986 @habilitarRetiraCorreios_off @ignorePrd  @ignorePontoFrio @ignoreExtra
  Cenário: Validar o retorno de pontos de retirada correio com a chave habilitarRetiraCorreios dasabilitada
    Dado que eu tenha informado o cep e sku desejado
      | cep         | sku    |
      | barra_funda | retira |
    Quando é enviada uma requisição GET para o serviço AsyncOutrasLojasRetira
    Então o código de resposta deve ser 200 para o serviço AsyncOutrasLojasRetira
    E não é retornado nenhum ponto de retirada do tipo 'correio'

  @FRTMC-1986 @habilitarRetiraLockers_on @ignorePontoFrio @ignoreExtra
  Cenário: Validar o retorno de pontos de retirada lockers com a chave habilitarRetiraLockers habilitada
    Dado que eu tenha informado o cep e sku desejado
      | cep         | sku            |
      | cep_lockers | retira_lockers |
    Quando é enviada uma requisição GET para o serviço AsyncOutrasLojasRetira
    Então o código de resposta deve ser 200 para o serviço AsyncOutrasLojasRetira
    E é retornado ponto de retirada do tipo 'lockers'

  @FRTMC-1986 @habilitarRetiraLockers_off @ignorePrd  @ignorePontoFrio @ignoreExtra
  Cenário: Validar o retorno de pontos de retirada lockers com a chave habilitarRetiraLockers dasabilitada
    Dado que eu tenha informado o cep e sku desejado
      | cep         | sku            |
      | cep_lockers | retira_lockers |
    Quando é enviada uma requisição GET para o serviço AsyncOutrasLojasRetira
    Então o código de resposta deve ser 200 para o serviço AsyncOutrasLojasRetira
    E não é retornado nenhum ponto de retirada do tipo 'lockers'