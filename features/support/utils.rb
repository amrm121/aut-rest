module Utils
  include HTTParty

  def json_delete_field(key_path, object)
    item = JSON.parse(object.to_json, object_class: OpenStruct)
    key_path.split('.').inject(item) do |memo, value|
      if value == key_path.split('.').last
        memo.delete_field("#{value}")
      end
      memo.send(value)
    end
    convert_to_hash_recursive(item)
  end

  def parse_cookie(response)
    cookie_hash = CookieHash.new
    response.get_fields('Set-Cookie').each {|cookie| cookie_hash.add_cookies(cookie)}
    cookie_hash.to_cookie_string
  end

  def generate_evidence(response)
    response_time = time_now
    evidence_folder = FOLDER_PATH
    verb = response.request.http_method::METHOD
    evidence_file = "#{evidence_folder}/#{Time.now.strftime('%Hh%Mm%Ss%L')}_#{verb}.txt"

    File.open(evidence_file, 'w:ASCII-8BIT') do |f|
      f << "=================================================\n"
      f << "#                     REQUEST                   #\n"
      f << "=================================================\n"
      f << "\n>>>> ENDPOINT <<<<\n#{response.request.last_uri}\n"
      f << "\n>>>> BANDEIRA <<<<\n#{BANDEIRA}\n"
      f << "\n>>>> AMBIENTE <<<<\n#{AMBIENTE}\n"
      f << "\n>>>> REQUEST BODY <<<<\n#{(response.request.options[:body])}\n" unless verb.eql?('GET')
      f << "=================================================\n"
      f << "=================================================\n\n"

      f << "\n=================================================\n"
      f << "#                   RESPONSE                    #\n"
      f << "=================================================\n"
      f << "\n>>>> RESPONSE HEADERS <<<<\n"
      response.header.each {|key, value| f << "#{key}: #{value}\n" unless key.eql?('authorization')}
      f << "\n>>>> RESPONSE BODY <<<<\n#{JSON.pretty_generate(format_json(response.body))}\n"
      f << "\n>>>> RESPOSTA DA REQUISIÇÃO <<<<\n#{response_time}\n\n"
      f << "=================================================\n"
      f << '================================================='
    end
  end

  def format_json(json)
    JSON.parse(json)
  rescue JSON::ParserError
    JSON.parse(json.to_json)
  end

  def switch_ip
    path = File.join(File.dirname(__FILE__), "hosts/#{SERVIDOR}/hosts")
    hosts_resolver = Resolv::Hosts.new(path)
    dns_resolver = Resolv::DNS.new
    Resolv::DefaultResolver.replace_resolvers([hosts_resolver, dns_resolver])
    puts "[Aviso] IP alterado. API irá ser testada no Servidor: #{SERVIDOR}"
  end

  def find_in_json(json, array_keys)
    hash_values = {}
    array_keys.each { |key| hash_values[key] = JsonPath.on(json, "$..#{key}") }
    hash_values.empty? ? raise('A busca no arquivo json não retornou resultados') : hash_values
  end

  private

  def convert_to_hash_recursive obj
    result = obj
    case result
    when OpenStruct
      result = result.marshal_dump
      result.each do |k, v|
        result[k] = convert_to_hash_recursive(v)
      end
    when Array
      result = result.map {|v| convert_to_hash_recursive(v)}
    end
    result
  end

  def time_now
    Time.now.strftime('%d/%m/%Y %H:%M:%S.%L - GMT %z')
  end

  def unidade_negocio
    case BANDEIRA
    when 'casasbahia'
      id_unidade_negocio = '8'
    when 'extra'
      id_unidade_negocio = '5'
    when 'pontofrio'
      id_unidade_negocio = '1'
    when 'batareiro'
      id_unidade_negocio = '13'
    else
      'Bandeira não encontrada'
    end
    id_unidade_negocio
  end

  def withdraw_type (type)
    case type.downcase
    when 'retira'
      type = 1
    when 'correio'
      type = 3
    when 'lockers'
      type = 2
    else
      raise 'Tipo de retirada inválido'
    end
    type
  end

end
