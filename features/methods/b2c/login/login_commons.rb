module LoginCommons
  def self.valida_mensagem
    begin
    mensagem = YAML.load_file("#{PATH_API_REST}features/support/massa/mensagens.yml")
    mensagem[BANDEIRA]['email_senha_incorreto']
    rescue StandardError
      raise "A chave #{BANDEIRA} não foi encontrada no arquivo"
    end
  end
end