desc "Check for outdated gems"
task :gem_update_check => :environment do
  puts "Check for outdated gems"
    @redis = Redis.new
    @redis.del('outdated_gems')
    @redis.sadd('outdated_gems', Gem::Specification.outdated)
    @redis.set('last_gem_check', Time.now.to_i)
  puts "done."
end
