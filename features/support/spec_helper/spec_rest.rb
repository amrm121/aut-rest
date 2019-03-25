module REST
  def consulta_omnichannel
    Omnichannel::Rest::Omni.new
  end

  def realizar_login
    Login::Rest::Login.new
  end

  def carrinho
    ConsultarCarrinho::Rest::Carrinho.new
  end

  def obter_endereco_cliente
    Endereco::Rest::Endereco.new
  end

  def obter_tipos_entrega
    Endereco::Rest::TiposEntrega.new
  end

  def selecionar_tipos_entrega
    Endereco::Rest::SelecionarTiposEntrega.new
  end

  def enviar_proposta_bradesco
    EnviarPropostaBradesco::Rest::EnviarProposta.new
  end

  def criar_cliente
    Cliente::Rest::Cliente.new
  end

  def pedidos
    ApiIntegracaoB2b::Rest::Pedidos.new
  end

  def entrega
    ApiIntegracaoB2b::Rest::LocaisRetirada.new
  end

  def parceiros_b2b_estrategia_venda
    ApiMarketing::Rest::EstrategiaVenda.new
  end

  def mais_pontos_configuracao
    ApiMaisPontos::Rest::Configuracao.new
  end

  def workflow_execucao
    ApiWorkflow::Rest::Execucao.new
  end

  def loja_compras
    ApiLoja::Rest::Compras.new
  end

  def seguranca_chaves
    ApiSeguranca::Rest::Chaves.new
  end

  def gateway_maispontos
    ApiGateway::Rest::MaisPontos.new
  end

  def cotador_b2b_comum
    ApiCotadorB2B::Rest::Comum.new
  end

  def cartao_presente_administracao
    ApiCartaoPresente::Rest::Administracao.new
  end

  def corporativo_localidade
    ApiCorporativo::Rest::Localidade.new
  end

  def catalogo_categorias
    ApiCatalogo::Rest::Categorias.new
  end

  def admin_loja_personalizada
    ApiAdminB2b::Rest::LojaPersonalizada.new
  end

  def listar_fretes
    ConsultarCarrinho::Rest::ListarFretes.new
  end

  def lojas_retira
    Retira::Rest::OutrasLojasRetira.new
  end

  def postmon
    Postmon::Rest::Postmon.new
  end

  def mongo
    DB::MongoDB::MongoConnection
  end

  def mongo_sku
    DB::MongoDB::MongoSku
  end

  def forma_pagamento
    FormaPagamento::Rest::FormaPagamento.new
  end

  def carne_online
    CarneOnline::Rest::CarneOnlineAPI.new
  end

  def consultar_cliente
    Cliente::Rest::ConsultarCliente.new
  end

  def consultar_compra
    Compra::Rest::ConsultarCompra.new
  end

  def recomendacao
    Recommender::Rest::Recomendacao.new
  end

end
