#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@WorkflowB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API Workflow
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API Workflow
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API Workflow
    Dado que tenha um payload padrão do método "<metodo>" da API Workflow
    Quando é enviada uma requisição GET para "<metodo>" da API Workflow
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo        |
      | Instancia     |
