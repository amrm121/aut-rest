#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@GatewayB2b
@health_check
@ignoreHp @ignoreAoc
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API Gateway
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API Gateway
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API Gateway
    Dado que tenha um payload padrão do método "<metodo>" da API Gateway
    Quando é enviada uma requisição GET para "<metodo>" da API Gateway
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo          |
      | Calculo Pontos  |
