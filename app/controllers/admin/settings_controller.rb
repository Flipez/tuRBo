class Admin::SettingsController < AdminController
  
  def index
    @settings = MySettings.all
  end

  def save

    settings = params.except(:commit, :method, :controller, :action)

    settings.each do |k,v|
      MySettings[k.to_sym] = v
    end

    redirect_to :back
  end

end
