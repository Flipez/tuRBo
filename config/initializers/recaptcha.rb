Recaptcha.configure do |config|
  config.public_key  = MySettings.recaptcha_pubkey rescue nil
  config.private_key = MySettings.recaptcha_privkey rescue nil
end
