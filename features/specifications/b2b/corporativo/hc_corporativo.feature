#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@CorporativoB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API Corporativo
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API Corporativo
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API Corporativo
    Dado que tenha um payload padrão do método "<metodo>" da API Corporativo
    Quando é enviada uma requisição GET para "<metodo>" da API Corporativo
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo          |
      | Localidade Ceps |
