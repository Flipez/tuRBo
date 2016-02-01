Recaptcha.configure do |config|
  config.public_key  = MySettings.recaptcha_pubkey
  config.private_key = MySettings.recaptcha_privkey
  #config.public_key  = '6LfcrRITAAAAAC8njz5T8s72B37YTuchbZTAY5wL'
  #config.private_key = '6LfcrRITAAAAAB2uSz85Q_qL_e9na_MephEqPmax'
end
