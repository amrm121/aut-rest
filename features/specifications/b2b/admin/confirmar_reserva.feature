#language:pt
@b2b
@FullSmoke
@BopeSquad
@AdminPedidos
@ignoreCasasBahia @ignorePontoFrio @ignoreBarateiro @ignoreHp @ignoreAoc
@ignoreHlg @ignoreStage @ignorePrd
Funcionalidade: B2B - Confirmar reserva
  Como usuário
  Quero confirmar reserva do pedido

  @status_invalido
  Cenário: Tentativa de confirmação de pedido com status inválido
    Dado que eu tenha um pedido com status a confirmar reserva falso
    Quando solicitar a confirmação na API confirmar_reserva
      | confirmacao |
      | false       |
    Então devo ver o status com retorno false para confirmação de reserva
    E o código de resposta deve ser 200 no serviço

  @status_valido
  Cenário: Confirmar reserva de um pedido com status de 'Aguardando Confirmação'
    Dado que eu tenha um pedido com status a confirmar reserva
    Quando solicitar a confirmação na API confirmar_reserva
      | confirmacao |
      | true        |
    Então devo ver a mensagem de confirmação de reserva
    E o código de resposta deve ser 200 no serviço
