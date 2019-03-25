#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@AdminB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API AdminB2B
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API AdminB2B
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições POST da API AdminB2B
    Dado que tenha um payload padrão do método "<metodo>" da API AdminB2B
    Quando é enviada uma requisição POST para "<metodo>" da API AdminB2B
    Então o serviço retorna uma resposta sem erros com status code 200

    Exemplos:
      | metodo                  |
      | Consultar Vinculos Loja |
