#language:pt
@b2c
@ignoreDev
@ignorePrd
@MeiosPagamentoSquad
@CarneDigital
Funcionalidade: B2C - Validar serviço Carne Digital
  Eu como automação
  Quero validar operações da API do Carne Digital

  @health_check_elegibilidade
  Cenario: Health Check serviço de Elegibilidade
    Dado que estou logado com o usuario parametrizado "black_list"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto | logista | quantidade |
      | normal  | gpa     | 1          |
    E seleciono o tipo de entrega "normal" para o endereço "Correios SP"
    E faço uma requisição GET para o serviço ObterTokenCarneOnline
    E faço uma requisição POST para o serviço Elegibilidade
    Entao serviço carne online deve responder o status 200
    E valido que o usuario esta elegivel ao carne digital

  @health_check_ObterTokenCarneOnline_teste
  Cenario: Health Check serviço para obter token carne online
    Dado que estou logado com o usuario parametrizado "carne_online"
    Quando faço uma requisição GET para o serviço ObterTokenCarneOnline
    Entao serviço carne online deve responder o status 200

  @health_check_plano
  Cenario: Health Check serviço de Plano
    Dado que estou logado com o usuario parametrizado "carne_online"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto | logista | quantidade |
      | normal  | gpa     | 1          |
    E seleciono o tipo de entrega "normal" para o endereço "Correios SP"
    E faço uma requisição GET para o serviço ObterTokenCarneOnline
    E faço uma requisição POST para o serviço Elegibilidade
    Então serviço carne online deve responder o status 200
    E valido que o usuario esta elegivel ao carne digital
    E faço uma requisição POST para o serviço Plano
    E serviço carne online deve responder o status 200

  @finalizar_compra_cdc
  Esquema do Cenario: Finalizar pedido com um sku
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto   | logista   | quantidade   |
      | <produto> | <logista> | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento carne digital com "<parcelas>" parcelas
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso

    Exemplos:
      | usuario      | produto     | logista | quantidade | endereço | opção_de_entrega | parcelas |
      | carne_online | normal      | gpa     | 1          | random   | normal           | 14       |
      | carne_online | normal      | gpa     | 1          | random   | agendada         | 10       |
      | carne_online | retira_loja | gpa     | 1          | random   | retira loja      | 20       |
      | carne_online | normal      | gpa     | 6          | random   | normal           | 17       |


  @finalizar_compra_cdc_dois_produtos
  Esquema do Cenario: Finalizar pedido com dois sku
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto | logista | quantidade   |
      | normal  | gpa     | <quantidade> |
      | normal  | gpa     | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento carne digital com "<parcelas>" parcelas
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso

    Exemplos:
      | usuario      | quantidade | endereço | opção_de_entrega | parcelas |
      | carne_online | 1          | random   | normal           | 3        |


  @finalizar_compra_cdc_dois_produtos_max_quantidade
  Esquema do Cenario: Finalizar pedido com dois skus e max quantidade
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto | logista | quantidade   |
      | normal  | gpa     | <quantidade> |
      | normal  | gpa     | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento carne digital com "<parcelas>" parcelas
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso

    Exemplos:
      | usuario      | quantidade | endereço | opção_de_entrega | parcelas |
      | carne_online | 6          | random   | normal           | 9        |


  @finalizar_compra_cdc_max_produtos
  Esquema do Cenario: Finalizar pedido com a quantidade max do carrinho
    Dado que estou logado com o usuario parametrizado "<usuario>"
    E faço uma requisição DELETE para o serviço ExcluirProdutosDoCarrinho
    Quando adiciono produto no carrinho
      | produto | logista | quantidade   |
      | normal  | gpa     | <quantidade> |
      | normal  | gpa     | <quantidade> |
      | normal  | gpa     | <quantidade> |
      | normal  | gpa     | <quantidade> |
    E seleciono o tipo de entrega "<opção_de_entrega>" para o endereço "<endereço>"
    E informo a forma de pagamento carne digital com "<parcelas>" parcelas
    E finalizo a compra
    Entao valido o fechamento da compra com sucesso

    Exemplos:
      | usuario      | quantidade | endereço    | opção_de_entrega | parcelas |
      | carne_online | 6          | Correios SP | normal           | 5        |
