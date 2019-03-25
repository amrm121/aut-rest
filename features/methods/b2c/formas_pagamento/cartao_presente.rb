module CartaoPresenteCommons

  def self.valida_mensagem_digite_imagem
    begin
      mensagem = YAML.load_file("#{PATH_API_REST}features/support/massa/mensagens.yml")
      mensagem[BANDEIRA]['digite_imagem_cartao_presente']
    rescue StandardError
      raise "A chave #{BANDEIRA} não foi encontrada no arquivo"
    end
  end
end
