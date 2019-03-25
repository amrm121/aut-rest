#language:pt
@b2c
@FullSmoke
@ShortSmoke
@CheckoutSquad
@ComercioLogin
@ignoreHp @ignoreAoc
@ignoreDev
Funcionalidade: B2C - Validar serviço login
  Eu como automação
  Quero efetuar login via serviço (API)
  Para garantir a autenticação do usuário
  e obter um feedback mais rápido referente à disponibilidade dos serviços

  Contexto:
    Dado informo o email e senha do usuario "black_list"

  @login_sucesso
  Cenário: Fazer login
    Quando faço uma requisição POST para o serviço Login
    E faço uma requisição POST para o serviço Carrinho
    Então o código de resposta deve ser 200 para o serviço Carrinho
    E acesso as informações do carrinho

  @login_sem_senha
  Cenário: Tentar fazer login sem passar o campo senha
    Mas não informo o campo senha
    Quando faço uma requisição POST sem cookie para o serviço Login
    Então o código de resposta deve ser 400

  @login_senha_invalida
  Cenário: Tentar fazer o login com a senha inválida
    Mas informo uma senha inválida
    Quando faço uma requisição POST sem cookie para o serviço Login
    Então o código de resposta deve ser 200
    E deve ser retornado um JSON contendo a mensagem
    
    
    