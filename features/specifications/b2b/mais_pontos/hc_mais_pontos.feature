#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@MaisPontosB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API MaisPontos
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API MaisPontos
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API MaisPontos
    Dado que tenha um payload padrão do método "<metodo>" da API MaisPontos
    Quando é enviada uma requisição GET para "<metodo>" da API MaisPontos
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo        |
      | Configuracoes |
