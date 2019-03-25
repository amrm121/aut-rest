#language:pt
@b2c
@ignoreHp @ignoreAoc @ignoreBarateiro
@ignoreDev
@MeiosPagamentoSquad
@finalizar_compra
Funcionalidade: B2C - Finalizar compra
  Eu como automação
  Quero fechar compra atraves da api do carrinho
  Para obter um feedback mais rapido da finalização da compra

  @finalizar_compra_boleto
  Esquema do Cenario: Finalizar compra com boleto
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | garantiaEstendida   | fiqueSeguro   | quantidade   |
      | <produto> | <logista> | <garantiaEstendida> | <fiqueSeguro> | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento boleto
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso
    Exemplos:
      | usuario    | produto           | logista | garantiaEstendida | fiqueSeguro | quantidade | endereço | opção_de_entrega |
      | black_list | acima_1500_reais  | gpa     |                   |             | 1          | random   | normal           |


  @ShortSmoke
  @finalizar_compra_cartao
  Esquema do Cenario: Finalizar compra com cartao de credito
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | garantiaEstendida   | fiqueSeguro   | quantidade   |
      | <produto> | <logista> | <garantiaEstendida> | <fiqueSeguro> | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento cartao de credito "<cartao>"
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso
    Exemplos:
      | usuario    | produto   | logista | garantiaEstendida | fiqueSeguro | quantidade | endereço | opção_de_entrega | cartao |
      | black_list | sku_teste | gpa     |                   |             | 1          | random   | normal           | visa   |
      | black_list | sku_teste | gpa     |                   |             | 1          | random   | normal           | diners |

  @ShortSmoke
  @finalizar_compra_retira_cartao @ignoreHlg @ignorePontoFrio @ignoreExtra
  Esquema do Cenario: Finalizar compras retira com cartao de credito
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | garantiaEstendida   | fiqueSeguro   | quantidade   |
      | <produto> | <logista> | <garantiaEstendida> | <fiqueSeguro> | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento cartao de credito "<cartao>"
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso
    Exemplos:
      | usuario    | produto          | logista | garantiaEstendida | fiqueSeguro | quantidade | endereço        | opção_de_entrega | cartao |
      | black_list | leve_com_servico | gpa     |                   |             | 1          | retira_correios | retira_correios  | visa   |
      | black_list | leve_com_servico | gpa     |                   |             | 1          | retira_lockers  | retira_lockers   | diners |
      | black_list | leve_com_servico | gpa     |                   |             | 1          | retira          | retira           | diners |


  @ShortSmoke
  @finalizar_compra_dois_cartoes
  Esquema do Cenario: Finalizar compra com dois cartoes
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | garantiaEstendida   | fiqueSeguro   | quantidade   |
      | <produto> | <logista> | <garantiaEstendida> | <fiqueSeguro> | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento dois cartoes "<cartao1>", "<cartao2>"
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso
    Exemplos:
      | usuario    | produto    | logista | garantiaEstendida | fiqueSeguro | quantidade | endereço | opção_de_entrega | cartao1 | cartao2   |
      | black_list | sku_teste  | gpa     |                   |             | 1          | random   | normal           | master  | hipercard |
      | black_list | sku_teste  | gpa     |                   |             | 1          | random   | normal           | elo     | amex      |

  @ignoreExtra @ignorePontoFrio
  @finalizar_compra_boleto_cartao
  Esquema do Cenario: Finalizar compra com boleto mais cartao de credito
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | garantiaEstendida   | fiqueSeguro   | quantidade   |
      | <produto> | <logista> | <garantiaEstendida> | <fiqueSeguro> | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento boleto mais cartão de crédito "<cartao>"
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso
    Exemplos:
      | usuario    | produto           | logista | garantiaEstendida | fiqueSeguro | quantidade | endereço | opção_de_entrega | cartao |
      | black_list | acima_1500_reais  | gpa     |                   |             | 1          | random   | normal           | visa   |
      | black_list | acima_1500_reais  | gpa     |                   |             | 1          | random   | normal           | master |


