include ActionView::Helpers::DateHelper

class Admin::IndexController < AdminController
  

  def index
    @redis = Redis.new
    @uptime = time_ago_in_words(Blog::BOOTET_AT)

    @gems = {}
    Bundler.load.specs.map do |spec| 
      @gems[spec.name] = spec.version.to_s
    end

    @outdated_gems = @redis.smembers('outdated_gems')
    @last_gem_check = time_ago_in_words(Time.at(@redis.get('last_gem_check').to_i))
  end

end
