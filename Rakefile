task :parallel_test, %i[processes tags profiles] do |_t, args|
  options = "#{args[:tags]} #{args[:profiles]}"
  command = "bundle exec parallel_cucumber features/specifications/* -n #{args[:processes]} --first-is-1 -o \"#{options}\""
  puts "\nIniciando a Execução dos Testes:\n#{command}\n"
  system command
end

task :update_gems do
  puts '======================================================='
  puts "\nInstalando a gem Bundler..."
  system 'gem i bundler --no-document --quiet'
  puts "OK!\n"
  puts 'Instalando as demais dependencias do projeto...'
  system 'bundle install --quiet'
  puts "OK!\n"
  puts '======================================================='
end
