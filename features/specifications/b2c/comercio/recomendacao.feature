#language:pt
@b2c
@FullSmoke
@ShortSmoke
@ComercioRecomendacao
@ignoreHp @ignoreAoc @ignoreBarateiro
@ignoreDev @ignoreHlg @ignoreStg
Funcionalidade: B2C - Validar serviço Recomendação
  Eu como automação
  Quero receber recomendações de produtos a partir da API de Recomendação
  Para garantir que o sistema é capaz de devolver produtos similares aos quais o usuário pesquisa

  @lista_recomendacao
  Cenário: Retorno de lista de Skus
    Dado que faço uma requisição GET para o serviço Recomendacao
    Então o código de resposta deve ser 200 para o serviço Recomendacao
    E lista de recomendações deverá ser apresentada pelo serviço Recomendação
