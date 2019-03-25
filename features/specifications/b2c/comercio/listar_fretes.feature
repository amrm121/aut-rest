#language:pt
@b2c
@FullSmoke
@ShortSmoke
@MulticanalidadeSquad
@ComercioListarFretes
@ignoreExtra @ignorePontoFrio @ignoreBarateiro @ignoreHP @ignoreAoc
@ignoreDev @ignoreStg
Funcionalidade: B2C - Validar listagem de fretes
  Eu como automação
  Quero enviar requisições para a API de Listar Frete
  para validar disponibilidade e informações retornadas da mesma


  @FRTMC-1072 @ignoreHlg
  Esquema do Cenário:  Validar Pontos de Retirada
    Dado que tenha informado um lojista "<lojista>", sku "<sku>" e endereço loja física  "<endereco_loja_fisica>"
    Quando é enviada uma requisição do tipo post para o serviço Listar Frete
    Então o código de resposta deve ser 200 para o serviço Listar Frete
    E o campo IdTipoPontoRetirada deve apresentar o valor <id_ponto_retirada>

    Exemplos:
      | lojista                | sku                | endereco_loja_fisica    | id_ponto_retirada |
      | retira_loja_consolacao | pesado_sem_servico | retira_loja_consolacao  | 1                 |
      | gpa                    | leve_sem_servico   | retira_loja_sao_miguel  | 1                 |
      | gpa                    | leve_sem_servico   | lockers_jardim_paulista | 2                 |
      | gpa                    | leve_sem_servico   | correio_cerqueira_cesar | 3                 |
      | gpa                    | leve_com_servico   | retira_loja_sao_miguel  | 1                 |
      | gpa                    | leve_com_servico   | locker_paraiso          | 2                 |
      | gpa                    | leve_com_servico   | correio_guaianases      | 3                 |
      | retira_loja_mirassol   | leve_com_ruptura   | retira_loja_mirassol    | 1                 |


  @FRTMC-1072 @ignoreHlg
  Esquema do Cenário:  Validar campo Frete igual a null
    Dado que tenha informado um lojista "<lojista>", sku "<sku>" e endereço loja física  "<endereco_loja_fisica>"
    Quando é enviada uma requisição do tipo post para o serviço Listar Frete
    Então o código de resposta deve ser 200 para o serviço Listar Frete
    E o campo Fretes deve apresentar o valor 'null'

    Exemplos:
      | lojista              | sku                | endereco_loja_fisica |
      | gpa                  | pesado_sem_servico | correio_guaianases   |
      | gpa                  | pesado_sem_servico | locker_paraiso       |
      | retira_loja_mirassol | leve_com_ruptura   | correio_mirassol     |


  @FRTMC-1072 @pontos_retirada_2_produtos @ignoreHlg
  Esquema do Cenário:  Validar Pontos de Retirada com 2 produtos
    Dado que eu tenha informado o lojista, sku e endereço loja fisica dos dois produtos
      | lojista   | sku   | endereco_loja_fisica   | lojista_2   | sku_2   | endereco_loja_fisica_2   |
      | <lojista> | <sku> | <endereco_loja_fisica> | <lojista_2> | <sku_2> | <endereco_loja_fisica_2> |
    Quando é enviada uma requisição do tipo post para o serviço Listar Frete
    Então o código de resposta deve ser 200 para o serviço Listar Frete
    E o campo IdTipoPontoRetirada deve apresentar o valor <id_ponto_retirada>

    Exemplos:
      | lojista | sku              | endereco_loja_fisica   | lojista_2 | sku_2            | endereco_loja_fisica_2 | id_ponto_retirada |
      | gpa     | leve_sem_servico | retira_loja_sao_miguel | gpa       | leve_com_servico | retira_loja_sao_miguel | 1                 |

