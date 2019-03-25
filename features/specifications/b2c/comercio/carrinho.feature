#language:pt
@b2c
@FullSmoke
@ShortSmoke
@CheckoutSquad
@ComercioCarrinho
Funcionalidade: B2C - Validar serviço Carrinho
  Eu como automação
  Quero validar operações da API de Carrinho
  Para garantir a capacidade de manipular diversos serviços disponibilizados pela coleção

  @ignoreHp @ignoreAoc
  @ignoreDev
  @limpar_carrinho
  Cenário: Limpar carrinho com usuário determinado
    Dado que estou logado com o usuario parametrizado "black_list"
    E informo a propriedade id_cliente
    Quando faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Então serviço ExcluirProdutosDoCarrinho deve responder com 200

