include ActionView::Helpers::DateHelper

class Admin::IndexController < AdminController
  
  def index
    @uptime = time_ago_in_words(Blog::BOOTET_AT)

    @gems = {}
    Bundler.load.specs.map do |spec| 
      @gems[spec.name] = spec.version.to_s
    end
    @outdated = Gem::Specification.outdated
  end

end
