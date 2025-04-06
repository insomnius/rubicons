# frozen_string_literal: true

require 'rake'

# Define the default task
task :default do
  puts 'Default task executed. No specific tasks defined.'
end

# Load custom tasks from lib/tasks
Dir.glob('lib/tasks/**/*.rake').each { |rake_file| load rake_file }
