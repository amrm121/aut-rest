#language:pt
@b2b
@FullSmoke
@BopeSquad
@AdminEntrega
@ignoreCasasBahia @ignorePontoFrio @ignoreBarateiro @ignoreHp @ignoreAoc
@ignoreHlg @ignoreStage @ignorePrd
Funcionalidade: B2B - Serviço locais de entrega
  Como usuário
  Quero listar as dez lojas mais próximas que possuem a modalidade retira rápido

  @listar_locais_retirada
  Cenário: Listar locais que disponibilizam entrega por retira rápido
    Dado que eu tenha um payload padrão para requisição
    Quando é enviada uma requisição para locais de entrega
    Então  devo ver uma lista informando os dez locais de entrega mais próximos
    E o código de resposta deve ser 200 no serviço

  @sku_incorreto
  Cenário: Visualizar mensagem de erro ao efetuar consultar com SKU inválido.
    Dado que eu tenha um payload padrão com dados de sku incorreto
    Quando é enviada uma requisição para locais de entrega
    Então  devo ver informação sobre SKU inexistente
    E o código de resposta deve ser 200 no serviço

  @cep_incorreto
  Cenário: Visualizar mensagem de erro ao efetuar consultar com CEP inválido.
    Dado que eu tenha um payload padrão com dados de CEP incorreto
    Quando é enviada uma requisição para locais de entrega
    Então  devo ver informação sobre CEP inválido
    E o código de resposta deve ser 200 no serviço

  @campanha_sem_retira
  Cenário: Efetuar requisição utilizando campanha que não possui retira rápido
    Dado que eu tenha um payload padrão com dados de campanha sem retira rápido
    Quando é enviada uma requisição para locais de entrega
    Então  devo ver informação sobre campanha sem retira rápido
    E o código de resposta deve ser 200 no serviço

  @sku_sem_retira
  Cenário: Efetuar requisição utilizando SKU que não possui retira rápido
    Dado que eu tenha um payload padrão com dados de SKU sem retira rápido
    Quando é enviada uma requisição para locais de entrega
    Então  devo ver informação sobre SKU sem retira rápido
    E o código de resposta deve ser 200 no serviço
