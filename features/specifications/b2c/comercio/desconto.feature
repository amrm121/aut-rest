#language:pt
@b2c
@CheckoutSquad
@DescontoCarrinho
Funcionalidade: B2C - Validar serviço Desconto
  Eu como automação
  Quero validar operações da API de Carrinho
  Para garantir a capacidade de manipular diversos serviços disponibilizados pela coleção

  @ignoreHp @ignoreAoc
  @ignoreDev @FullSmoke @ShortSmoke
  @inserir_cupom_desconto_invalido
  Cenário: Inserir cupom de desconto invalido
    Dado que estou logado com o usuario parametrizado "black_list"
    Quando informo um cupom de desconto "invalido"
    E faço uma requisição POST para o serviço CupomDesconto
    Entao valido mensagem de cupom de desconto invalido

  @ignoreHp @ignoreAoc @ignoreExtra @ignorePontofrio @ignoreBarateiro
  @ignoreDev @ignorePrd
  @inserir_cupom_desconto_valido
  Cenário: Inserir cupom de desconto valido
    Dado que estou logado com o usuario parametrizado "black_list"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | quantidade |
      | sku_teste | gpa       | 1          |
    E informo um cupom de desconto "teste_meios_pagamento"
    E faço uma requisição POST para o serviço CupomDesconto
    Entao valido cupom inserido com sucesso

  @ignoreHp @ignoreAoc @ignoreExtra @ignorePontofrio @ignoreBarateiro
  @ignoreDev @ignorePrd
  @remover_cupom_desconto_carrinho
  Cenário: Remover cupom de desconto do carrinho
    Dado que estou logado com o usuario parametrizado "black_list"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | quantidade |
      | sku_teste | gpa       | 1          |
    E informo um cupom de desconto "teste_meios_pagamento"
    E faço uma requisição POST para o serviço CupomDesconto
    E valido cupom inserido com sucesso
    E faço uma requisição POST para o serviço CupomDescontoRemover
    Entao valido cupom removido com sucesso

  @ignoreHp @ignoreAoc @ignoreBarateiro
  @ignoreDev @FullSmoke @ShortSmoke
  @inserir_vale_presente_invalido
  Cenário: Inserir vale presente invalido
    Dado que estou logado com o usuario parametrizado "black_list"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | quantidade |
      | sku_teste | gpa       | 1          |
    E informo a forma de pagamento boleto
    E seleciono o tipo de entrega "normal" para o endereço "random"
    E informo a forma de pagamento vale presente
    E faço uma requisição POST para o serviço CartaoPresenteValidar
    Entao valido mensagem de erro ao enviar o cartao presente sem captcha

