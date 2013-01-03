Rails.application.config.middleware.use OmniAuth::Builder do
  provider :foursquare, 'app_id', 'app_secret'
end