OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/auth'
  end
  provider :facebook, '523540627661367', 'e312d7b6a6be67feb4c7543d56d6d1d9' 
 # provider :facebook, '410106739044604', 'e631f64d610295eb742b2839544db854'
end