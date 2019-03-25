#language: pt
@b2c
@FullSmoke
@CheckoutSquad
@Omnichannel
@ignoreHP @ignoreAoc
@ignoreDev @ignoreStg @ignorePrd
Funcionalidade: B2C - Consultar Cupom Omnichannel - Deslogado
  Como uma aplicação de serviço
  Eu quero efetuar validações no serviço de cupons Omnichannel

  @cupom_valido_deslogado
  Cenário: Validar consulta cupom válido/ vigente - Deslogado - omni
    Dado que tenha cupom 'válido_deslogado'
    Quando fizer um POST no serviço consulta_cupom
    Então valido o retorno de um status code 200
    E valido com sucesso os dados do cupom para cliente deslogado
  
