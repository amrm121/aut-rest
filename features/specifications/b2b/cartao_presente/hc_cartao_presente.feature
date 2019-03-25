#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@CartaoPresenteB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API CartaoPresente
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API CartaoPresente
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API CartaoPresente
    Dado que tenha um payload padrão do método "<metodo>" da API CartaoPresente
    Quando é enviada uma requisição GET para "<metodo>" da API CartaoPresente
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo                     |
      | Contrato Esta Inadimplente |
