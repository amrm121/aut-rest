class RequestOutrasLojasRetira
  RETIRA_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2c/retira/async_outras_lojas_retira.yml')
  PATH_MASSA = YAML.load_file("#{PATH_API_REST}features/support/massa/b2c/retira.yml")

  def self.list_shops_mass(cep, sku)
    hash = RETIRA_REQUEST.dup
    hash['cep'] = PATH_MASSA[BANDEIRA][AMBIENTE]['cep'][cep]
    hash['idsku'] = PATH_MASSA[BANDEIRA][AMBIENTE]['sku'][sku]
    hash['isImediata'] = 'false'
    hash['isProprietario'] = 'false'
    hash
  end

  def self.list_shops(cep, sku)
    hash = RETIRA_REQUEST.dup
    hash['cep'] = cep
    hash['idsku'] = sku
    hash['isImediata'] = 'false'
    hash['isProprietario'] = 'false'
    hash
  end

end