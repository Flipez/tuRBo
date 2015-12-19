class GemUpdateWorker
  include Sidekiq::Worker

  def perform_async
  @redis = Redis.new
    @redis.del('outdated_gems')
    @redis.sadd('outdated_gems', Gem::Specification.outdated)
    @redis.set('last_gem_check', Time.now.to_i)
  end

end
