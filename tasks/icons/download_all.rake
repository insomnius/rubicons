# frozen_string_literal: true

namespace :icons do
  desc 'Download all icon sets at once'
  task :download_all do
    puts 'Starting download of all icon sets...'

    # Get all download tasks within the icons namespace
    icon_tasks = Rake.application.tasks.select do |task|
      task.name =~ /^icons:download_/ && task.name != 'icons:download_all'
    end

    # Print summary of what will be downloaded
    puts "Found #{icon_tasks.length} icon sets to download:"
    icon_tasks.each do |task|
      puts "- #{task.name.gsub('icons:download_', '')}"
    end
    puts "\n"

    # Execute each download task in sequence
    icon_tasks.each do |task|
      puts "\n" + '=' * 80
      puts "Executing task: #{task.name}"
      puts '=' * 80 + "\n"

      begin
        task.invoke
      rescue => e
        puts "ERROR downloading #{task.name}: #{e.message}"
        puts 'Continuing with next icon set...'
      end
    end

    puts "\n" + '=' * 80
    puts 'Download of all icon sets completed!'
    puts '=' * 80
  end
end
