include Utils

class RequestLogin
  LOGIN_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/carrinho/login.yml')
  def self.request_login(email, senha)
    var_login = LOGIN_REQUEST.dup
    var_login['clienteLogin']['Email'] = email
    var_login['clienteLogin']['Senha'] = senha
    var_login
  end

  def self.request_sem_senha(email)
    hash = LOGIN_REQUEST.dup
    hash['clienteLogin']['Email'] = email
    hash = json_delete_field('clienteLogin.Senha', hash)
    return hash
  end
end