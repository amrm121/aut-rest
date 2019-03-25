#language:pt
@b2b
@FullSmoke
@BopeSquad
@AdminEntrega
@ignoreCasasBahia @ignorePontoFrio @ignoreBarateiro @ignoreHp @ignoreAoc
@ignoreHlg @ignoreStage @ignorePrd
Funcionalidade: B2B - Criar reserva
  Como usuário
  Quero criar reserva de itens, sendo assim o sistema deve impossibilitar reserva de itens Retira Rápido

  @criar_reserva
  Cenário: Criar reserva do pedido
    Dado que eu tenha um payload padrão para criação de pedido
    Quando é enviada uma requisição para Criar reserva
    Então  devo ver a mensagem de criação efetuada com sucesso
    E o código de resposta deve ser 200 no serviço

  @criar_reserva_retira_rapido
  Cenário: Tentativa de criação de reserva para item de retira rapido
    Dado que eu tenha um payload padrão para criação de pedido com campanha que possui retira rápido
    Quando é enviada uma requisição para Criar reserva
    Então  devo ver a mensagem informando que não é possível reservar item de retira rápido
    E o código de resposta deve ser 200 no serviço

  @pedido_duplicado
  Cenário: Validar tratativa de criação de pedidos com dados duplicados
    Dado que eu tenha um payload padrão para pedido duplicado
    Quando é enviada uma requisição para Criar reserva
    Então  devo ver a mensagem com código de pedido duplicado
    E o código de resposta deve ser 200 no serviço

  @validar_contrato
  Cenário: Validar estrutura do contrato
    Dado que eu tenha um payload padrão para criação de pedido
    Quando é enviada uma requisição para Criar reserva
    Então devo ver o contrato exibido com sucesso
    E o código de resposta deve ser 200 no serviço