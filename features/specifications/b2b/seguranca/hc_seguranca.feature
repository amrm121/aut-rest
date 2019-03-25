#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@SegurancaB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API Segurança
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API Segurança
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API Segurança
    Quando é enviada uma requisição GET para "<metodo>" da API Segurança
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo  |
      | Chaves  |
