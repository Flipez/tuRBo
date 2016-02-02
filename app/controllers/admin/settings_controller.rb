class Admin::SettingsController < AdminController
  
  def index
    @settings = MySettings.all
  end

  def save
    settings = params.except(:commit, :method, :controller, :action, :utf8, :authenticity_token)
    
    settings.each do |k,v|
      v = nil if v.empty?
      MySettings[k.to_sym] = v
    end

    MySettings.enable_recaptcha = false unless settings.include? :enable_recaptcha

    redirect_to :back
  end

  def add_url
    urls = MySettings.dynamic_urls
    urls ||= {}

    urls[params[:domain]] = params[:name]

    MySettings.dynamic_urls = urls

    redirect_to :back
  end

end
