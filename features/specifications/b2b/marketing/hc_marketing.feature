#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@MarketingB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API Marketing
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API Marketing
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API Marketing
    Quando é enviada uma requisição GET para "<metodo>" da API Marketing
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo                     |
      | Informacoes Envio Parceiro |
