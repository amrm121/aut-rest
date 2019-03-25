#language:pt
@b2b
@FullSmoke
@BacklogB2bSquad
@CatalogoB2b
@health_check
@ignoreDev @ignoreHlg @ignoreStage
Funcionalidade: B2B - Health Check - API Catálogo
  Como uma aplicação de serviço
  Quero enviar requisições para as operações da API Catálogo
  Para verificar que as mesmas estão disponíveis

  Esquema do Cenário: Validação das requisições GET da API Catálogo
    Dado que tenha um payload padrão do método "<metodo>" da API Catálogo
    Quando é enviada uma requisição GET para "<metodo>" da API Catálogo
    Então o serviço retorna uma resposta válida com status code 200

    Exemplos:
      | metodo            |
      | Obter Categorias  |
