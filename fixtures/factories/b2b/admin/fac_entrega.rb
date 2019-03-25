class EntregaFactories

  ENTREGA_REQUEST = YAML.load_file(File.dirname(__FILE__) + '/../../../templates/b2b/admin/entrega.yml')

  def self.local_retirada
    hash = ENTREGA_REQUEST.dup
    hash['cep'] = '06415-130'
    hash['id_campanha'] = '2155'
    hash['id_sku'] = '3551588'
    hash
  end

  def self.sku_incorreto
    hash = ENTREGA_REQUEST.dup
    hash['cep'] = '06415-130'
    hash['id_campanha'] = '2155'
    hash['id_sku'] = '35515881'
    hash
  end

  def self.cep_incorreto
    hash = ENTREGA_REQUEST.dup
    hash['cep'] = '0000'
    hash['id_campanha'] = '2155'
    hash['id_sku'] = '3551588'
    hash
  end

  def self.campanha_sem_retira
    hash = ENTREGA_REQUEST.dup
    hash['cep'] = '06415-130'
    hash['id_campanha'] = '1'
    hash['id_sku'] = '3551588'
    hash
  end

  def self.sku_sem_retira
    hash = ENTREGA_REQUEST.dup
    hash['cep'] = '06415-130'
    hash['id_campanha'] = '2155'
    hash['id_sku'] = '137744'
    hash
  end
end