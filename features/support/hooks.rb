# encoding: utf-8
Before do |scenario|
  switch_ip if SERVIDOR
  @test_start = time_now
  day = Time.now.strftime('%Y%m%d')
  time = Time.now.strftime('%Hh%Mm%Ss%L')
  scenario_name = scenario.name.remover_acentos.titleize.gsub(/\W/, '')
  FOLDER_PATH = "reports/evidences/#{day}/#{time}_#{scenario_name}"
  FileUtils.mkdir_p(FOLDER_PATH) unless Dir.exist?(FOLDER_PATH)
end

After do |scenario|
  puts "Início: #{@test_start}"
  puts "Término: #{time_now}"
  i = 0
  Dir[File.join(File.dirname(__FILE__), "../../#{FOLDER_PATH}/*.txt")].sort.each do |f|
    i += 1
    file_name = f.split('/').last.split('.').first
    embed(f, 'text/plain', "    #{file_name}_evidencia_#{i}    ")
  end
  File.open('reports/failed_scenarios.txt', 'a') { |f| f << "#{scenario.name}\n" } if scenario.failed?
end