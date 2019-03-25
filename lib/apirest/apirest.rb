Dir[File.join(File.dirname(__FILE__), 'apirest/**/*.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '../../features/support/**/*.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '../../features/services/**/*.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), '../../features/step_definitions/**/*.rb')].sort.each { |file| require file }
