class HcComprasFactories
  PATH_MASSA = YAML.load_file(File.dirname(__FILE__) + '/../../../../features/support/massa/b2b/loja/hc_loja.yml')
  path_template = File.dirname(__FILE__) + '/../../../templates/b2b/loja/'
  STATUS_COMPRA_ENTREGA = YAML.load_file("#{path_template}status_compra_entrega.yml")

  def self.status_compra_entrega
    massa = PATH_MASSA[BANDEIRA][AMBIENTE][__method__.to_s]
    hash = STATUS_COMPRA_ENTREGA.dup
    hash['IdCompra'] = massa['id_compra']
    hash
  end
end
