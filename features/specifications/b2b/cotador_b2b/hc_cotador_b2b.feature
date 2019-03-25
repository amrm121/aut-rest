#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@CotadorB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API CotadorB2B
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API CotadorB2B
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API CotadorB2B
    Quando é enviada uma requisição GET para "<metodo>" da API CotadorB2B
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo    |
      | Mensagens |
