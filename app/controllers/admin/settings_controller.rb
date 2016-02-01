class Admin::SettingsController < AdminController
  
  def index
    @settings = MySettings.all
  end

  def save
    redirect_to :back
  end

end
