desc "Check for outdated gems"
task :gem_update_check => :environment do
  puts "Check for outdated gems"
    GemUpdateWorker.new.perform
  puts "done."
end
