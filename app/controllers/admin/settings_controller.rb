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

    redirect_to :back
  end

end
