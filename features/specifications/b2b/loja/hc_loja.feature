#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@LojaB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API Loja
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API Loja
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições POST da API Loja
    Dado que tenha um payload padrão do método "<metodo>" da API Loja
    Quando é enviada uma requisição POST para "<metodo>" da API Loja
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo                |
      | Status Compra Entrega |
