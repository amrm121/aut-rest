require 'rspec'
require 'httparty'
require 'pry'
require 'faker'
require 'jsonpath'
require 'mongo'
require 'logger'
require 'correios-cep'
require 'brstring'
require 'resolv-replace'
require_relative 'utils'

Faker::Config.locale ||= 'pt-BR'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

$LOG ||= Logger.new('automation_log.log')

PATH_API_REST ||= ENV['PATH_API_REST']
PATH_API_REST.nil? ? ENV['PATH_API_REST'] : PATH_API_REST

BANDEIRA ||= ENV['BANDEIRA']
AMBIENTE ||= ENV['AMBIENTE']
SERVIDOR ||= ENV['SERVIDOR']

DATABASE ||= YAML.load_file(File.dirname(__FILE__) + "/massa/db/database.yml")
URL ||= YAML.load_file(File.dirname(__FILE__) + "/config/urls.yml")
ENDPOINT ||= YAML.load_file(File.dirname(__FILE__) + "/config/endpoints.yml")
DADOS_USUARIO ||= YAML.load_file(File.dirname(__FILE__) + "/massa/dados_usuario.yml")
MASSA_PAGAMENTO ||= YAML.load_file(File.dirname(__FILE__) + "/massa/carrinho/pagamento.yml")

Correios::CEP.configure do |config|
  config.request_timeout = 5
end

Dir[File.join(File.dirname(__FILE__), '../../fixtures/factories/**/*.rb')].sort.each {|file| require file}
Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')].each {|file| require file }
Dir[File.join(File.dirname(__FILE__), '../methods/**/**/*.rb')].each {|file| require file }

World(REST)
