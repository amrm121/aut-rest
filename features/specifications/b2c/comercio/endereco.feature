#language:pt
@b2c
@FullSmoke
@ShortSmoke
@CheckoutSquad
@ComercioEnderecoTipoEntrega
@ignoreExtra @ignorePontoFrio @ignoreBarateiro @ignoreHp @ignoreAoc
@ignoreDev @ignoreStg @ignorePrd
Funcionalidade: B2C - Selecionar Tipo de Entrega
  Como automação dos testes
  Quero selecionar um tipo de entrega via serviço (API)
  Para garantir a disponibilidade de entrega
  e obter um feedback mais rápido referente à disponibilidade dos serviços

  Contexto:
    Dado informo o email e senha do usuario "black_list"
    Quando faço uma requisição POST para o serviço Login

  @validar_selecao_tipo_entrega
  @endereco_entrega
  Cenário: Validar a seleção de um tipo de entrega
    E faço uma requisição GET para o serviço Endereco
    E faço uma requisição GET para o serviço TiposEntrega
    E faço uma requisição POST para o serviço CarrinhoEnderecoEntrega
    Então o codigo de resposta deve ser 200
    E o usuario deve estar autenticado na aplicação CarrinhoEnderecoEntrega
  



    
    
    