class HcGatewayMaisPontosFactories
  PATH_MASSA = YAML.load_file(File.dirname(__FILE__) + '/../../../../features/support/massa/b2b/gateway/hc_gateway.yml')[BANDEIRA][AMBIENTE]

  def self.calculo_pontos
    PATH_MASSA[__method__.to_s]
  end
end
